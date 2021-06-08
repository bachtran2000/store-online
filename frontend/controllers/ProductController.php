<?php
require_once "controllers/Controller.php";
require_once "models/Product.php";
require_once "models/Category.php";
require_once "models/Pagination.php";

class ProductController extends Controller
{
    public function index(){
        if (!isset($_GET['category_id']) || !is_numeric($_GET['category_id'])) {
            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/';
            header("Location: $url_redirect");
            exit();
        }
        $id = $_GET['category_id'];
        $product_model = new Product();
        $products = $product_model->getProductByCategoryId($id);

        $category_model = new Category();
        $all_categories = $category_model->getAllCategories();
        $men_categories = $category_model->getAllMenCategories();
        $women_categories = $category_model->getAllWomenCategories();
        $category = $category_model->getCategoryById($id);

        $this->content = $this->render('views/products/index.php', [
            'products' => $products,
            'category' => $category
        ]);

        require_once 'views/layouts/main.php';
    }

    public function detail(){
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/products';
            header("Location: $url_redirect");
            exit();
        }
        $id = $_GET['id'];
        $product_model = new Product();
        $product = $product_model->getProductById($id);

        $category_model = new Category();
        $all_categories = $category_model->getAllCategories();
        $men_categories = $category_model->getAllMenCategories();
        $women_categories = $category_model->getAllWomenCategories();

        $this->content = $this->render('views/products/detail.php', [
            'product' => $product
        ]);

        require_once 'views/layouts/main.php';
    }

    public function all(){
        $product_model = new Product();
        $count_total = $product_model->countTotal();

        $query_additional = '';
        if (isset($_GET['products_title'])) {
            $query_additional .= '&products_title=' . $_GET['products_title'];
        }
        $arr_params = [
            'total' => $count_total,
            'limit' => 12,
            'query_string' => 'page',
            'controller' => 'product',
            'action' => 'all',
            'query_additional' => $query_additional,
            'page' => isset($_GET['page']) ? $_GET['page'] : 1
        ];
        $products = $product_model->getAllProductsPagination($arr_params);
        $pagination = new Pagination($arr_params);

        $pages = $pagination->getPagination();

        //lấy danh sách category đang có trên hệ thống để phục vụ cho search
        $category_model = new Category();
        $all_categories = $category_model->getAllCategories();
        $men_categories = $category_model->getAllMenCategories();
        $women_categories = $category_model->getAllWomenCategories();

        $this->content = $this->render('views/products/all.php', [
            'products' => $products,
            'categories' => $all_categories,
            'pages' => $pages,
        ]);
        require_once 'views/layouts/main.php';
    }
}