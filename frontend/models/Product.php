<?php
require_once "models/Model.php";

class Product extends Model
{
    public $str_search = '';

    public function __construct()
    {
        parent::__construct();
        if (isset($_GET['products_title']) && !empty($_GET['products_title'])) {
            $this->str_search .= " AND products.title LIKE '%{$_GET['products_title']}%'";
        }
    }

    public function getAllProducts(){
        $obj_select_all = $this->connection->prepare("SELECT * FROM products WHERE TRUE $this->str_search");
        $obj_select_all->execute();

        $all_products = $obj_select_all->fetchAll(PDO::FETCH_ASSOC);
        return $all_products;
    }

    public function getAllProductsPagination($arr_params)
    {
        $limit = $arr_params['limit'];
        $page = $arr_params['page'];
        $start = ($page - 1) * $limit;
        $obj_select = $this->connection->prepare("SELECT * FROM products WHERE TRUE $this->str_search LIMIT $start, $limit");

        $arr_select = [];
        $obj_select->execute($arr_select);
        $products = $obj_select->fetchAll(PDO::FETCH_ASSOC);

        return $products;
    }

    public function countTotal()
    {
        $obj_select = $this->connection->prepare("SELECT COUNT(id) FROM products WHERE TRUE $this->str_search");
        $obj_select->execute();

        return $obj_select->fetchColumn();
    }

    public function getProductByCategoryId($id){
        $obj_select = $this->connection->prepare("SELECT * FROM products WHERE category_id = $id");
        $obj_select->execute();

        $products = $obj_select->fetchAll(PDO::FETCH_ASSOC);
        return $products;
    }

    public function getProductById($id){
        $obj_select = $this->connection->prepare("SELECT * FROM products WHERE id = $id");
        $obj_select->execute();

        $products = $obj_select->fetch(PDO::FETCH_ASSOC);
        return $products;
    }
}