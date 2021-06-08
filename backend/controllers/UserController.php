<?php
require_once 'controllers/Controller.php';
require_once 'models/User.php';
require_once 'models/Pagination.php';
class UserController extends Controller {
    public function index() {
        $user_model = new User();
        $page = isset($_GET['page']) ? $_GET['page'] : 1;
        $total = $user_model->getTotal();
        $query_additional = '';
        if (isset($_GET['username'])) {
            $query_additional .= "&username=" . $_GET['username'];
        }
        $params = [
            'total' => $total,
            'limit' => 5,
            'query_string' => 'page',
            'controller' => 'user',
            'action' => 'index',
            'page' => $page,
            'query_additional' => $query_additional
        ];
        $pagination = new Pagination($params);
        $pages = $pagination->getPagination();
        $users = $user_model->getAllPagination($params);

        $this->content = $this->render('views/users/index.php', [
            'users' => $users,
            'pages' => $pages,
        ]);

        require_once 'views/layouts/main.php';
    }

    public function create(){
        if(isset($_SESSION['user']) && $_SESSION['user']['level'] == 1){
            $_SESSION['error'] = 'Member không có quyền thêm user';
            header("Location: index.php?controller=user");
            exit();
        }
        if(isset($_POST['create'])){
            $username = $_POST['username'];
            $fullname = $_POST['fullname'];
            $level = $_POST['level'];
            $user_model = new User();
            $user = $user_model->getUserByUsername($username);
            if(empty($username) || empty($fullname)){
                $this->error = 'Các trường bắt buộc phải nhập';
            } else if(empty($level) || $level == 0){
                $this->error = 'Phân quyền user là bắt buộc';
            } else if(!empty($level)){
                if($_SESSION['user']['level'] == 2){
                    if($level == 2 || $level == 3){
                        $this->error = 'Mày thích edit HTML của tao không?';
                    }
                }
            } else if(!empty($user)){
                $this->error = 'Username đã tồn tại';
            }

            if(empty($this->error)){
                $user_model->username = $username;
                $user_model->password = md5(1);
                $user_model->fullname = $fullname;
                $user_model->level = $level;
                $is_create = $user_model->create();

                if($is_create){
                    $_SESSION['success'] = "Thêm user thành công";
                    header("Location: index.php?controller=user");
                    exit();
                } else {
                    $_SESSION['error'] = "Thêm user thất bại";
                }
            }
        }

        $this->content = $this->render('views/users/create.php');
        require_once 'views/layouts/main.php';
    }

    public function update() {
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            header("Location: index.php?controller=user");
            exit();
        }

        $id = $_GET['id'];
        $user_model = new User();
        $user = $user_model->getById($id);

        if(isset($_SESSION['user'])){
            if($_SESSION['user']['username'] != $user['username']){
                if($_SESSION['user']['level'] <= $user['level']){
                    $_SESSION['error'] = 'Bạn không có quyền cập nhật user này';
                    header("Location: index.php?controller=user");
                    exit();
                }
            }
        }

        if (isset($_POST['submit'])) {
            $username = $_POST['username'];
            $password = $_POST['password'];
            $fullname = $_POST['fullname'];
            $phone = $_POST['phone'];
            $email = $_POST['email'];
            $address = $_POST['address'];
            $jobs = $_POST['jobs'];
            $status = $_POST['status'];
            $check_user_exist = $user_model->getUserByUsername($username);
            //xử lý validate
            if (!empty($email) && !filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $this->error = 'Email không đúng định dạng';
            } else if (empty($password)) {
                $this->error = 'Password bắt buộc phải nhập';
            } else if(!empty($check_user_exist) && $username != $user['username']){
                $this->error = 'Username đã tồn tại';
            } else if ($_FILES['avatar']['error'] == 0) {
                $extension = pathinfo($_FILES['avatar']['name'], PATHINFO_EXTENSION);
                $extension = strtolower($extension);
                $allow_extensions = ['png', 'jpg', 'jpeg', 'gif'];
                $file_size_mb = $_FILES['avatar']['size'] / 1024 / 1024;
                $file_size_mb = round($file_size_mb, 2);
                if (!in_array($extension, $allow_extensions)) {
                    $this->error = 'Phải upload avatar dạng ảnh';
                } else if ($file_size_mb > 2) {
                    $this->error = 'File upload không được lớn hơn 2Mb';
                }
            }

            //xủ lý lưu dữ liệu khi biến error rỗng
            if (empty($this->error)) {
                $filename = $user['avatar'];
                //xử lý upload ảnh nếu có
                if ($_FILES['avatar']['error'] == 0) {
                    $dir_uploads = __DIR__ . '/../assets/uploads';
                    //xóa file ảnh đã update trc đó
                    @unlink($dir_uploads . '/' . $filename);
                    if (!file_exists($dir_uploads)) {
                        mkdir($dir_uploads);
                    }

                    $filename = time() . '-user-' . $_FILES['avatar']['name'];
                    move_uploaded_file($_FILES['avatar']['tmp_name'], $dir_uploads . '/' . $filename);
                }
                //lưu password dưới dạng mã hóa, hiện tại sử dụng cơ chế md5
                $user_model->username = $username;
                $user_model->password = md5($password);
                $user_model->fullname = $fullname;
                $user_model->phone = $phone;
                $user_model->address = $address;
                $user_model->email = $email;
                $user_model->avatar = $filename;
                $user_model->jobs = $jobs;
                $user_model->status = $status;
                $is_update = $user_model->update($id);
                if ($is_update) {
                    $_SESSION['success'] = 'Update dữ liệu thành công';
//                    $_SESSION['user_new'] = $user_new;
                    header("Location: index.php?controller=user");
                    exit();
                } else {
                    $_SESSION['error'] = 'Update dữ liệu thất bại';
                }
            }
        }

        $this->content = $this->render('views/users/update.php', [
            'user' => $user
        ]);

        require_once 'views/layouts/main.php';
    }

    public function delete() {
        if(isset($_SESSION['user']) && $_SESSION['user']['level'] == 1){
            $_SESSION['error'] = 'Member không có quyền xóa user';
            header("Location: index.php?controller=user");
            exit();
        }
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            $_SESSION['error'] = 'ID không hợp lệ';
            header('Location: index.php?controller=user');
            exit();
        }

        $id = $_GET['id'];
        $user_model = new User();
        $is_delete = $user_model->delete($id);
        if ($is_delete) {
            $_SESSION['success'] = 'Xóa dữ liệu thành công';
            header('Location: index.php?controller=user');
            exit();
        } else {
            $_SESSION['error'] = 'Xóa dữ liệu thất bại';
        }
    }

    public function detail() {
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            header("Location: index.php?controller=user");
            exit();
        }
        $id = $_GET['id'];
        $user_model = new User();
        $user = $user_model->getById($id);

        $this->content = $this->render('views/users/detail.php', [
            'user' => $user
        ]);

        require_once 'views/layouts/main.php';
    }

    public function logout() {

//        session_destroy();
        $_SESSION = [];
        session_destroy();
//        unset($_SESSION['user']);
        $_SESSION['success'] = 'Logout thành công';
        header('Location: index.php?controller=login&action=login');
        exit();
    }
}