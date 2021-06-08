<?php
require_once "controllers/Controller.php";
require_once "models/Category.php";

class HomeController extends Controller
{
    public function index(){
        $category_model = new Category();

        $men_categories = $category_model->getAllMenCategories();
        $women_categories = $category_model->getAllWomenCategories();

        $all_categories = $category_model->getAllCategories();
        $count_categories = $category_model->countTotalCategories();

        $this->content = $this->render('views/homes/index.php', [
            'men_categories' => [
                'title' => 'MEN',
                'content' => $men_categories
            ],
            'women_categories' => [
                'title' => 'WOMEN',
                'content' => $women_categories
            ],
            'categories' => $all_categories,
            'count_categories' => $count_categories
        ]);

        require_once 'views/layouts/main.php';
    }
}