<?php
require_once 'controllers/Controller.php';
require_once 'models/Order.php';
require_once 'models/Pagination.php';

class OrderController extends Controller
{
    public function index(){
        $order_model = new Order();
        $page = isset($_GET['page']) ? $_GET['page'] : 1;
        $total = $order_model->getTotal();
        $query_additional = '';
        if (isset($_GET['product_title'])) {
            $query_additional .= '&product_title=' . $_GET['product_title'];
        }
        if (isset($_GET['customer_id'])) {
            $query_additional .= '&customer_id=' . $_GET['customer_id'];
        }
        if (isset($_GET['customer_name'])) {
            $query_additional .= '&customer_name=' . $_GET['customer_name'];
        }
        $params = [
            'total' => $total,
            'limit' => 5,
            'query_string' => 'page',
            'controller' => 'order',
            'action' => 'index',
            'page' => $page,
            'query_additional' => $query_additional
        ];
        $pagination = new Pagination($params);
        $pages = $pagination->getPagination();
        $orders = $order_model->getAllPagination($params);

        $this->content = $this->render('views/orders/index.php', [
            'orders' => $orders,
            'pages' => $pages
        ]);

        require_once 'views/layouts/main.php';
    }

    public function handle(){
//        if(!isset($_POST['order_id']) || !is_numeric($_GET['order_id'])){
//            $_SESSION['error'] = 'ID không hợp lệ';
//            header('Location: index.php?controller=order');
//            exit();
//        }

        $id = $_GET['order_id'];
        $orders_model = new Order();
        $is_handle = $orders_model->handleOrders($id);
        if ($is_handle) {
            $_SESSION['success'] = 'Đã xử lí thành công';
        } else {
            $_SESSION['error'] = 'Xử lí đơn hàng thất bại';
        }
        header('Location: index.php?controller=order');
        exit();
    }

    public function delete(){
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            $_SESSION['error'] = 'ID không hợp lệ';
            header('Location: index.php?controller=order');
            exit();
        }

        $id = $_GET['id'];
        $orders_model = new Order();
        $is_delete = $orders_model->deleteOrders($id);
        if ($is_delete) {
            $_SESSION['success'] = 'Xóa đơn hàng thành công';
        } else {
            $_SESSION['error'] = 'Xóa đơn hàng thất bại';
        }
        header('Location: index.php?controller=order');
        exit();
    }
}