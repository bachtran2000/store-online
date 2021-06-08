<?php
//controllers/CartController.php
require_once 'controllers/Controller.php';
require_once "models/Category.php";
require_once 'models/Product.php';
class CartController extends Controller{
  //Xử lý add vào giỏ hàng
  public function add() {
    $id = $_GET['id'];
    $product_model = new Product();
    $product = $product_model->getProductById($id);

    $product_cart = [
        'name' => $product['title'],
        'price' => $product['price'],
        'avatar' => $product['avatar'],
        'quality' => 1
    ];

      if (!isset($_SESSION['cart'])) {
        $_SESSION['cart'][$id] = $product_cart;
      } else {
        if (!array_key_exists($id, $_SESSION['cart'])) {
            $_SESSION['cart'][$id] = $product_cart;
        } else {
            $_SESSION['cart'][$id]['quality']++;
        }
      }
    $url_redirect = $_SERVER['SCRIPT_NAME'] . '/cart';
    header("Location: $url_redirect");
      exit();
  }

  public function index() {
    if (!isset($_SESSION['cart'])) {
      $_SESSION['error'] = 'Không có sản phẩm nào trong giỏ hàng';
    } else {
        if (isset($_POST['submit'])) {
            //lặp giỏ hàng, dựa theo product id để gán lại quality dựa vào mảng $_POST vừa bắt đc
            foreach ($_SESSION['cart'] AS $product_id => $product) {
                //gán lại số lượng từ việc submit form của user
                $_SESSION['cart'][$product_id]['quality'] = $_POST[$product_id];
            }
        }

//    echo "<pre>";
//    print_r($_SESSION['cart']);
//    echo "</pre>";
    }

      $category_model = new Category();
      $all_categories = $category_model->getAllCategories();
      $men_categories = $category_model->getAllMenCategories();
      $women_categories = $category_model->getAllWomenCategories();

    $this->content = $this->render('views/carts/index.php');
    require_once 'views/layouts/main.php';
  }

  public function update(){
      if(isset($_POST['id']) && isset($_POST['num'])){
          if(isset($_SESSION['cart'])){
              $cart = $_SESSION['cart'];
              $id = $_POST['id'];
              if(array_key_exists($id, $cart)){
                  if($_POST['num']>0){
                      $cart[$id] = [
                          'name' => $cart[$id]['name'],
                          'price' => $cart[$id]['price'],
                          'avatar' => $cart[$id]['avatar'],
                          'quality' => $_POST['num']
                      ];
                  } else {
                      unset($cart[$id]);
                  }
                  $_SESSION['cart'] = $cart;
              }
              if(empty($_SESSION['cart'])){
                  unset($_SESSION['cart']);
              }
          }
      }
  }

  //xóa sản phẩm khỏi giỏ hàng
//  public function delete() {
//    $id = $_GET['id'];
//    unset($_SESSION['cart'][$id]);
//
//    if (empty($_SESSION['cart'])) {
//      unset($_SESSION['cart']);
//    }
//    $_SESSION['success'] = 'Xóa sản phẩm thành công';
//    $url_redirect = $_SERVER['SCRIPT_NAME'] . '/cart';
//    header("Location: $url_redirect");
//    exit();
//  }
}