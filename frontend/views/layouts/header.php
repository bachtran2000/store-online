<header class="sticky-top header-bar">
    <div class="wrapper row">
        <div class="header-bar__top col-md-12">
            <div class="row header-bar__content">
                <div class="col-md-8 header-bar__content-left"></div>
                <div class="col-md-4 header-bar__content-right header-link">
                    <div class="row d-md-flex justify-content-md-end">
                        <a class="__link" id="register_link" href="home">Đăng ký</a>
                        <div class="vertical-line"></div>
                        <a class="__link" id="login_link" href="home">Đăng nhập</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-bar__bottom col-md-12">
            <div class="row header-bar__content">
                <div class="col-md-3 logo-section">
                    <div class="logo-main">
                        <a class="logo-title" href="home">OOP SHOP</a>
                        <p class="under-title">Only One Price</p>
                    </div>
                </div>
                <div class="col-md-6 search-section">
                    <div class="search-bar_main">
                        <form action="<?= $_SERVER['SCRIPT_NAME']?>" method="get" class="row">
                            <input type="hidden" name="controller" value="product"/>
                            <input type="hidden" name="action" value="all"/>
                            <input name="products_title" class="col-md-10 search-input" placeholder="Search products" value="<?php echo isset($_GET['products_title']) ? $_GET['products_title'] : ''?>">
                            <button type="submit" name="search" class="col-md-2 btn-search"><i class="fas fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <div class="col-md-3 cart-section d-flex justify-content-center">
                    <a title="Giỏ hàng" href="cart">
                        <i class="fas fa-shopping-cart"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="header-menu col-md-12">
            <div class="row main-menu">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <nav class="navbar navbar-expand-lg">
                        <ul class="navbar-nav _menu-ul">
                            <li id="home" class="nav-item _menu-li">
                                <a href="home" class="nav-link">home</a>
                            </li>
                            <li id="men-categories" class="nav-item _menu-li" data-category="men-categories__frame">
                                <a class="nav-link">men categories</a>
                                <div class="sub-menu" id="men-categories__frame">
                                    <ul class="sub-menu_ul" id="men-categories_list">
                                        <?php if (!empty($men_categories)): ?>
                                        <?php foreach ($men_categories as $men_category):?>
                                        <li class="nav-item sub-menu_li">
                                            <a href="product/category-id/<?= $men_category['id']?>">
                                                <?= $men_category['name']?>
                                            </a>
                                        </li>
                                        <?php endforeach;?>
                                        <?php endif;?>
                                    </ul>
                                </div>
                            </li>
                            <li id="women-categories" class="nav-item _menu-li" data-category="women-categories__frame">
                                <a class="nav-link" data-category="women-categories__frame">women categories</a>
                                <div class="sub-menu" id="women-categories__frame">
                                    <ul class="sub-menu_ul" id="women-categories_list">
                                        <?php if (!empty($women_categories)): ?>
                                            <?php foreach ($women_categories as $women_category):?>
                                                <li class="nav-item sub-menu_li">
                                                    <a href="product/category-id/<?= $women_category['id']?>">
                                                        <?= $women_category['name']?>
                                                    </a>
                                                </li>
                                            <?php endforeach;?>
                                        <?php endif;?>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div>
</header>