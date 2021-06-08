<?php
require_once 'controllers/Controller.php';
require_once 'models/Category.php';
require_once 'models/Order.php';
require_once 'models/OrderDetail.php';
require_once 'configs/PHPMailer/src/PHPMailer.php';
require_once 'configs/PHPMailer/src/SMTP.php';
require_once 'configs/PHPMailer/src/Exception.php';

class PaymentController extends Controller
{
    public function index(){
        $category_model = new Category();
        $all_categories = $category_model->getAllCategories();

        if (!isset($_SESSION['cart'])) {
            $_SESSION['error'] = 'Không thể thanh toán khi giỏ hàng ko có sản phẩm';
            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/cart';
            header("Location: $url_redirect");
            exit();
        }

        if(isset($_POST['submit'])){
            $full_name = $_POST['full_name'];
            $address = $_POST['address'];
            $mobile = $_POST['mobile'];
            $email = $_POST['email'];
            $note = $_POST['note'];

            if(empty($full_name) || empty($mobile)){
                $this->error = 'Họ tên và số điện thoại ko được để trống';
            } else if(!is_numeric($mobile)){
                $this->error = 'Số điện thoại ko đúng định dạng';
            } else if(!empty($email) && !filter_var($email, FILTER_VALIDATE_EMAIL)){
                $this->error = 'Email sai định dạng';
            }

            if(empty($this->error)){
                $order_model = new Order();
                $order_model->full_name = $full_name;
                $order_model->address = $address;
                $order_model->mobile = $mobile;
                $order_model->email = $email;
                $order_model->note = $note;

                $price_total = 0;
                foreach ($_SESSION['cart'] as $cart) {
                    $price_total += $cart['quality'] * $cart['price'];
                }
                $order_model->price_total = $price_total;
                $order_model->payment_status = 1;
                $order_model->orders_status = 0;
                $order_id = $order_model->insert();
                if ($order_id > 0) {
                    $order_detail = new OrderDetail();
                    $order_detail->order_id = $order_id;

                    foreach ($_SESSION['cart'] AS $product_id => $cart) {
                        $order_detail->product_id = $product_id;
                        $order_detail->quality = $cart['quality'];
                        $order_detail->insert();
                    }

                    unset($_SESSION['cart']);
                    $_SESSION['success'] = 'Bạn đã đặt hàng thành công';
                    //tạo message để gửi mail cho kh vừa đặt hàng
                    $message = "Cảm ơn bạn đã đặt hàng, $full_name";
                    //gửi mail theo địa chỉ email của khách
                    $this->sendMail($email, $message);

                    $url_redirect = $_SERVER['SCRIPT_NAME'] . '/thank';
                    header("Location: $url_redirect");
                    exit();
                } else {
                    $_SESSION['error'] = 'Lưu thông tin thanh toán thất bại';
                    $url_redirect = $_SERVER['SCRIPT_NAME'] . '/payment';
                    header("Location: $url_redirect");
                    exit();
                }
            }
        }

        $this->content = $this->render('views/payments/index.php');
        require_once 'views/layouts/main_payment.php';
    }

    protected function sendMail($email, $message) {
        // Instantiation and passing `true` enables exceptions
        $mail = new \PHPMailer\PHPMailer\PHPMailer(true);

        try {
            //Server settings
            $mail->SMTPDebug = \PHPMailer\PHPMailer\SMTP::DEBUG_SERVER;                      // Enable verbose debug output
            $mail->isSMTP();
            // Send using SMTP
            //host miễn phí của gmail
            $mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
            //username gmail của chính bạn
            $mail->Username   = 'darkprince411999@gmail.com';                     // SMTP username

            $mail->Password   = 'nnrduebxhljebqyw';                               // SMTP password
            $mail->SMTPSecure = \PHPMailer\PHPMailer\PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
            $mail->Port       = 587;                                    // TCP port to connect to

            //email người gửi
            $mail->setFrom('darkprince411999@gmail.com', 'Admin');

            //setting mail người nhận
            $mail->addAddress($email);     // Add a recipient

            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Subject = 'Cảm ơn bạn đã đặt hàng';
            $mail->Body    = $message;

            $mail->send();
            echo 'Message has been sent';
        } catch (Exception $e) {
            echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }
    }

    public function thank() {
        $this->content = $this->render('views/payments/thank.php');
        require_once 'views/layouts/main_payment.php';
    }
}