<section class="product-detail" id="item-<?= $product['id']?>__detail">
    <div class="row product-detail-content">
        <div class="col-md-6 product-image">
            <div class="image-content">
                <img src="../backend/assets/uploads/<?= $product['avatar']?>">
            </div>
        </div>
        <div class="col-md-6 product-detail-main">
            <div class="detail-main-content">
                <h3 class="product-title"><?= $product['title']?></h3>
                <p class="product-price"><?= number_format($product['price'])?>đ</p>
                <form action="" method="post" class="add-to-cart__form">
<!--                    <div class="form-group">-->
<!--                        <label for="product-quantity_input" class="product-quality">Số lượng</label>-->
<!--                        <input type="number" id="product-quantity_input" name="quality" min="1" value="">-->
<!--                    </div>-->
                    <a class="btn btn-add-to-cart" type="submit" href="cart/add/<?= $product['id']?>">
                        Thêm vào giỏ hàng
                    </a>
                </form>
                <div class="product-description">
                    <h4>Mô tả sản phẩm</h4>
                    <div class="product-description-content">
                        <?= $product['content']?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>