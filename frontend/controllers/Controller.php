<?php

class Controller
{
    public $content;
    public $error;

    public function render($file, $variable = []){
        extract($variable);
        ob_start();
        require_once "$file";
        $render_view = ob_get_clean();

        return $render_view;
    }
}