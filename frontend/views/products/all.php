<section class="product-list" id="all_product">
    <?php if(!empty($products)):?>
        <div class="row">
            <?php foreach ($products as $product):?>
                <div class="col-md-3 product-content" id="product__item-<?= $product['id']?>">
                    <p class="product-price"><?= number_format($product['price'])?>đ</p>
                    <a href="product-<?= $product['id']?>">
                        <img src="../backend/assets/uploads/<?= $product['avatar']?>">
                    </a>
                    <p class="product-title"><?= $product['title']?></p>
                </div>
            <?php endforeach;?>
        </div>
        <?= $pages?>
    <?php else:?>
        <h2 style="margin: 0 5%;">Không tìm thấy sản phẩm nào</h2>
    <?php endif;?>
</section>
