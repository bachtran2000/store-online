<section class="payment">
    <h1 class="payment-title">Thông tin liên hệ</h1>
    <div class="payment-content">
        <form action="" method="post">
            <div class="row payment-content-main">
            <div class="col-md-7 contact-info__content">
                <div class="form-group">
                    <label for="full-name">Họ tên <span style="color: #ff293c">*</span></label>
                    <input id="full-name" name="full_name" class="form-control" value="<?php isset($_POST['full_name']) ? $_POST['full_name'] : ''?>"/>
                </div>
                <div class="form-group">
                    <label for="address">Địa chỉ</label>
                    <input id="address" name="address" class="form-control" value="<?php isset($_POST['address']) ? $_POST['address'] : ''?>"/>
                </div>
                <div class="form-group">
                    <label for="mobile">Điện thoại <span style="color: #ff293c">*</span></label>
                    <input id="mobile" name="mobile" class="form-control" value="<?php isset($_POST['mobile']) ? $_POST['mobile'] : ''?>"/>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input id="email" name="email" class="form-control" value="<?php isset($_POST['email']) ? $_POST['email'] : ''?>"/>
                </div>
                <div class="form-group">
                    <label for="note">Ghi chú</label>
                    <textarea id="note" name="note" class="form-control" value="<?php isset($_POST['note']) ? $_POST['note'] : ''?>"></textarea>
                </div>
                <div class="row btn-record">
                    <div class="col-md-6">
                        <a href="cart">Trở lại giỏ hàng</a>
                    </div>
                    <div class="col-md-6">
                        <div class="float-right">
                            <input type="submit" class="btn btn-success btn-order" name="submit" value="Đặt hàng">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-5 cart__content">
                <?php
                //tổng giá trị đơn hàng
                $total_order = 0;
                ?>
                <?php if (!empty($_SESSION['cart'])):?>
                <div class="row cart__detail">
                    <?php foreach($_SESSION['cart'] AS $product_id => $product): ?>
                    <div class="col-md-12 cart__detail-main">
                        <div class="row">
                            <div class="col-md-8 cart__info">
                                <div class="row">
                                    <div class="col-md-4 cart__product-image">
                                        <img class="w-100" src="../backend/assets/uploads/<?= $product['avatar']?>" alt="">
                                        <span><?= $product['quality']?></span>
                                    </div>
                                    <div class="col-md-8 cart__product-title">
                                        <p><?= $product['name']?></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 cart__price">
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
                    <?php endforeach;?>
                </div>
                <?php endif;?>
                <hr/>
                <div class="row cart__price-total">
                    <div class="col-md-6 cart__total-labels">
                        <span>Total</span>
                    </div>
                    <div class="col-md-6 cart__price-total-content">
                        <div class="float-right"><span><?= number_format($total_order)?>đ</span></div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
</section>