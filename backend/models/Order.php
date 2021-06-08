<?php
require_once 'models/Model.php';

class Order extends Model
{

    public $str_search;

    public function __construct() {
        parent::__construct();
        if (isset($_GET['product_title']) && !empty($_GET['product_title'])) {
            $this->str_search .= " AND products.title LIKE '%{$_GET['product_title']}%'";
        }
        if (isset($_GET['customer_id']) && !empty($_GET['customer_id'])) {
            $this->str_search .= " AND customer.id = {$_GET['customer_id']}";
        }
        if (isset($_GET['customer_name']) && !empty($_GET['customer_name'])) {
            $this->str_search .= " AND customer.fullname LIKE '%{$_GET['customer_name']}%'";
        }
    }

    public function getAll() {
        $obj_select = $this->connection
            ->prepare("SELECT orders.*, customer.fullname AS 'customer_name', order_details.*, products.title AS 'product_title' 
                                FROM ( 
                                (orders INNER JOIN customer ON orders.customer_id = customer.id) 
                                INNER JOIN order_details ON orders.id = order_details.order_id 
                                INNER JOIN products ON order_details.product_id = products.id )
                                WHERE TRUE $this->str_search
                                ORDER BY updated_at DESC, created_at DESC");
        $obj_select->execute();
        $orders = $obj_select->fetchAll(PDO::FETCH_ASSOC);
        return $orders;
    }

    public function getAllPagination($params = []) {
        $limit = $params['limit'];
        $page = $params['page'];
        $start = ($page - 1) * $limit;
        $obj_select = $this->connection
            ->prepare("SELECT orders.*, customer.fullname AS 'customer_name', order_details.*, products.title AS 'product_title' 
                                FROM ( 
                                (orders INNER JOIN customer ON orders.customer_id = customer.id) 
                                INNER JOIN order_details ON orders.id = order_details.order_id 
                                INNER JOIN products ON order_details.product_id = products.id )
                                WHERE TRUE $this->str_search
                                ORDER BY updated_at DESC, created_at DESC
                                LIMIT $start, $limit");

        $obj_select->execute();
        $orders = $obj_select->fetchAll(PDO::FETCH_ASSOC);

        return $orders;
    }

    public function getTotal() {
        $obj_select = $this->connection->prepare("SELECT COUNT(order_id) FROM order_details WHERE TRUE $this->str_search");
        $obj_select->execute();
        return $obj_select->fetchColumn();
    }

    public function handleOrders($id){
        $obj_update = $this->connection->prepare("UPDATE orders SET orders_status = 1 WHERE id = $id");
        return $obj_update->execute();
    }

    public function deleteOrders($id){
        $obj_delete = $this->connection->prepare("DELETE FROM orders WHERE id = $id");
        return $obj_delete->execute();
    }
}