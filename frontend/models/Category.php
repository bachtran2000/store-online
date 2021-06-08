<?php
require_once 'models/Model.php';

class Category extends Model
{
    public function getAllCategories(){
        $obj_select = $this->connection->prepare("SELECT * FROM categories");
        $obj_select->execute();

        $all_categories = $obj_select->fetchAll(PDO::FETCH_ASSOC);
        return $all_categories;
    }

    public function getAllMenCategories(){
        $obj_select = $this->connection->prepare("SELECT * FROM categories WHERE `name` LIKE '%nam%'");
        $obj_select->execute();

        $men_categories = $obj_select->fetchAll(PDO::FETCH_ASSOC);
        return $men_categories;
    }

    public function getAllWomenCategories(){
        $obj_select = $this->connection->prepare("SELECT * FROM categories WHERE `name` LIKE '%nu%'");
        $obj_select->execute();

        $men_categories = $obj_select->fetchAll(PDO::FETCH_ASSOC);
        return $men_categories;
    }

    public function countTotalCategories()
    {
        $obj_select = $this->connection->prepare("SELECT COUNT(id) FROM categories");
        $obj_select->execute();

        return $obj_select->fetchColumn();
    }

    public function getCategoryById($id){
        $obj_select = $this->connection->prepare("SELECT * FROM categories WHERE id = $id");
        $obj_select->execute();

        $category = $obj_select->fetch(PDO::FETCH_ASSOC);
        return $category;
    }
}