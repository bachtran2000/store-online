<?php
require_once 'models/User.php';

class LoginController
{
    //chứa nội dung view
    public $content;
    //chứa nội dung lỗi validate
    public $error;

    /**
     * @param $file string Đường dẫn tới file
     * @param array $variables array Danh sách các biến truyền vào file
     * @return false|string
     */
    public function render($file, $variables = []) {
        date_default_timezone_set("Asia/Ho_Chi_Minh");

        //Nhập các giá trị của mảng vào các biến có tên tương ứng chính là key của phần tử đó.
        //khi muốn sử dụng biến từ bên ngoài vào trong hàm
        extract($variables);
        //bắt đầu nhớ mọi nội dung kể từ khi khai báo, kiểu như lưu vào bộ nhớ tạm
        ob_start();
        //thông thường nếu ko có ob_start thì sẽ hiển thị 1 dòng echo lên màn hình
        //tuy nhiên do dùng ob_Start nên nội dung của nó đã đc lưu lại, chứ ko hiển thị ra màn hình nữa
        require_once $file;
        //lấy dữ liệu từ bộ nhớ tạm đã lưu khi gọi hàm ob_Start để xử lý, lấy xong rồi xóa luôn dữ liệu đó
        $render_view = ob_get_clean();

        return $render_view;
    }

    public function login() {
        if (isset($_SESSION['user'])) {
            header('Location: index.php?controller=category&action=index');
            exit();
        }
        if (isset($_POST['submit'])) {
            $username = $_POST['username'];
            $password = $_POST['password'];

            if (empty($username) || empty($password)) {
                $this->error = 'Username hoặc password không được để trống';
            }
            $user_model = new User();
            if (empty($this->error)) {
                $password = md5($_POST['password']);
                $user = $user_model->getUserByUsernameAndPassword($username, $password);
                if (empty($user)) {
                    $this->error = 'Sai username hoặc password';
                } else {
                    $_SESSION['success'] = 'Đăng nhập thành công';
                    //tạo session user để xác định user nào đang login
                    $_SESSION['user'] = $user;
                    header("Location: index.php?controller=product");
                    exit();
                }
            }
        }
        $this->content = $this->render('views/users/login.php');

        require_once 'views/layouts/main_login.php';
    }

    /**
     * Đăng ký tài khoản mới, mặc định tất cả các user đều có quyền admin
     */
    public function register() {

        if (isset($_POST['submit'])) {
            $user_model = new User();
            $username = $_POST['username'];
            $password = $_POST['password'];
            $password_confirm = $_POST['password_confirm'];
            $fullname = $_POST['fullname'];
            $phone = $_POST['phone'];
            $address = $_POST['address'];
            $email = $_POST['email'];
            $jobs = $_POST['jobs'];
            $user = $user_model->getUserByUsername($username);
            //check validate
            if (empty($username) || empty($password) || empty($password_confirm) || empty($fullname)) {
                $this->error = 'Các trường Username, Password, Nhập lại password, Full name ko được để trống';
            } else if ($password != $password_confirm) {
                $this->error = 'Nhập lại password chưa đúng';
            } else if (!empty($phone) && !is_numeric($phone)) {
                $this->error = 'Số điện thoại phải ở dạng số';
            } else if(!empty($email) && !filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $this->error = 'Email sai định dạng';
            } else if (!empty($user)) {
                $this->error = 'Username này đã tồn tại';
            }
            //xử lý lưu dữ liệu khi không có lỗi
            if (empty($this->error)) {

                $user_model->username = $username;
                //chú ý password khi lưu vào bảng users sẽ được mã hóa md5 trước khi lưu
                //do đang sử dụng cơ chế mã hóa này cho quy trình login
                $user_model->password = md5($password);
                $user_model->fullname = $fullname;
                $user_model->phone = $phone;
                $user_model->address = $address;
                $user_model->email = $email;
                $user_model->jobs = $jobs;
                $is_insert = $user_model->insertRegister();
                if ($is_insert) {
                    $_SESSION['success'] = 'Đăng ký thành công';
                } else {
                    $_SESSION['error'] = 'Đăng ký thất bại';
                }
                header('Location: index.php?controller=login&action=login');
                exit();
            }
        }

        $this->content = $this->render('views/users/register.php');
        require_once 'views/layouts/main_login.php';
    }
}