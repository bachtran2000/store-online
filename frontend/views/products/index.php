<section class="product-list" id="product__category-id-<?= $category['id']?>">
    <h2 class="category-name"><?= $category['name']?></h2>
    <?php if(!empty($products)):?>
    <div class="row">
    <?php foreach ($products as $product):?>
        <div class="col-md-3 product-content" id="product__item-<?= $product['id']?>">
            <p class="product-price"><?= number_format($product['price'])?>đ</p>
            <a title="<?= $product['title']?>" href="product-<?= $product['id']?>">
                <img src="../backend/assets/uploads/<?= $product['avatar']?>">
            </a>
            <p class="product-title"><?= $product['title']?></p>
        </div>
    <?php endforeach;?>
    </div>
    <?php else:?>
        <h2>Không có sản phẩm nào trong category</h2>
    <?php endif;?>
</section>
