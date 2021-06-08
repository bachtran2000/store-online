<!doctype html>
<html lang="en">
<head>
    <base href="<?php echo $_SERVER['SCRIPT_NAME'] ?>"/>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>OOP Shop</title>
    <link rel="shortcut icon" type="image/png" href="assets/images/favicon.png"/>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/5efd05f2e8.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="assets/js/script.js"></script>
</head>
<body>
<div class="container" style="margin-top: 2rem;">
    <?php if (isset($_SESSION['success'])): ?>
        <div class="alert alert-success">
            <?php
            echo $_SESSION['success'];
            unset($_SESSION['success']);
            ?>
        </div>
    <?php endif; ?>
    <?php if (isset($_SESSION['error'])): ?>
        <div class="alert alert-danger">
            <?php
            echo $_SESSION['error'];
            unset($_SESSION['error']);
            ?>
        </div>
    <?php endif; ?>
    <?php if (isset($this->error)): ?>
        <div class="alert alert-danger">
            <?php
            echo $this->error;
            ?>
        </div>
    <?php endif; ?>
</div>

<main class="main-container">
    <?= $this->content?>
</main>

<?php require_once 'footer.php'?>