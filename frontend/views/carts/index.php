<section class="products-cart">
    <h1 class="product-cart-title">Giỏ hàng của bạn</h1>
    <div class="products-cart-content">
        <div class="row cart-labels">
            <div class="col-md-8"></div>
            <div class="col-md-4">
                <div class="row">
                    <p class="col-md-4 product-price__labels">Price</p>
                    <p class="col-md-4 product-quality__labels">Quantity</p>
                    <p class="col-md-4 product-total__labels">Total</p>
                </div>
            </div>
        </div>
        <hr/>
        <form class="cart__form" action="" method="post">
            <?php
            //tổng giá trị đơn hàng
            $total_order = 0;
            ?>
            <div class="row cart__row">
                <?php if (!empty($_SESSION['cart'])):?>
                <?php foreach($_SESSION['cart'] AS $product_id => $product): ?>
                    <div class="col-md-12 cart__main-content">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-md-3 product-image">
                                        <img class="w-100" src="../backend/assets/uploads/<?= $product['avatar']?>" alt="">
                                    </div>
                                    <div class="col-md-6 product-title">
                                        <strong><?= $product['name']?></strong>
                                        <a href="javascript:void(0)" class="btn btn-outline-danger" onclick="deleteCart(<?= $product_id;?>)">Xóa</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-4 product-price__content">
                                        <?= number_format($product['price']); ?>đ
                                    </div>
                                    <div class="col-md-4 product-quality__content">
                                        <input type="number" min="1" max="20" name="<?= $product_id; ?>"
                                               id="num-<?= $product_id?>"
                                               class="product-amount form-control"
                                               value="<?= $product['quality']?>"
                                               onchange="updateCart(<?= $product_id?>)">
                                    </div>
                                    <div class="col-md-4 product-total__content">
                                        <?php
                                        //hiển thị Thành tiền tương ứng với từng sp
                                        $total_product = $product['quality'] * $product['price'];
                                        //cộng dồn vào biến Tổng giá trị đơn hàng
                                        $total_order += $total_product;
                                        echo number_format($total_product) . 'đ';
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 cart__line">
                        <hr/>
                    </div>
                <?php endforeach;?>
                <?php else:?>
                    <?php if (isset($_SESSION['error'])): ?>
                        <div class="col-md-8">
                            <div class="alert alert-danger">
                                <?php
                                echo $_SESSION['error'];
                                ?>
                            </div>
                        </div>
                    <?php endif; ?>
                <?php endif;?>
            </div>
            <div class="row cart__sub-total">
                <div class="col-md-12">
                    <p class="sub-total">Tổng giá trị đơn hàng: <span><?= number_format($total_order)?>đ</span></p>
                </div>
            </div>
            <div class="row cart__btn-record">
                <div class="col-md-12">
                    <a href="products" class="btn btn__shopping-continue">Tiếp tục mua hàng</a>
<!--                    <input type="submit" name="submit" value="Cập nhật giỏ hàng" class="btn btn__update-cart">-->
                    <a href="payment" class="btn btn__payment">Thanh toán</a>
                </div>
            </div>
        </form>
    </div>
</section>

<script type="text/javascript">
    function updateCart(id) {
        let num = $("#num-"+id).val();
        if(num > 20){
            alert("Mỗi sản phầm chỉ được phép mua với số lượng tối đa là 20");
        } else {
            $.post(
                'index.php?controller=cart&action=update',
                {'id': id, 'num': num},
                function (data){
                    $('.cart__form').load("cart .cart__form");
                }
            )
        }
    }
    function deleteCart(id) {
        let num = $("#num-"+id).val();
        $.post(
            'index.php?controller=cart&action=update',
            {'id': id, 'num': 0},
            function (data){
                $('.cart__form').load("cart .cart__form");
            }
        )
    }
</script>