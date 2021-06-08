<form method="GET" action="">
    <div class="form-group">
        <label for="product_title">Product title</label>
        <input type="text" name="product_title" id="product_title"
               value="<?php echo isset($_GET['product_title']) ? $_GET['product_title'] : '' ?>" class="form-control"/>
    </div>
    <div class="form-group">
        <label for="customer_id">Customer ID</label>
        <input type="number" name="customer_id" id="customer_id"
               value="<?php echo isset($_GET['customer_id']) ? $_GET['customer_id'] : '' ?>" class="form-control"/>
    </div>
    <div class="form-group">
        <label for="customer_name">Customer name</label>
        <input type="text" name="customer_name" id="customer_name"
               value="<?php echo isset($_GET['customer_name']) ? $_GET['customer_name'] : '' ?>" class="form-control"/>
    </div>
    <input type="hidden" name="controller" value="order"/>
    <input type="hidden" name="action" value="index"/>
    <div class="form-group">
        <input type="submit" value="Tìm kiếm" name="search" class="btn btn-primary"/>
        <a href="index.php?controller=order" class="btn btn-default">Back</a>
    </div>
</form>

<h2>Thống kê đơn hàng</h2>
<table class="table table-bordered">
    <tr>
        <th>ID</th>
        <th>Customer ID</th>
        <th>Customer name</th>
        <th>Product title</th>
        <th>Price total</th>
        <th>Payment status</th>
        <th>Orders status</th>
        <th>Note</th>
        <th>Quality</th>
        <th>Created at</th>
        <th style="width:10%;"></th>
    </tr>
    <?php if (!empty($orders)): ?>
    <form class="form-orders" action="" method="post">
        <?php foreach ($orders as $order): ?>
            <tr>
                <td><?php echo $order['id'] ?></td>
                <td><?php echo $order['customer_id'] ?></td>
                <td><?= $order['customer_name']?></td>
                <td style="width: 15%;"><?= $order['product_title']?></td>
                <td><?php echo $order['price_total'] ?></td>
                <td>
                    <?php
                    $status_text = 'Active';
                    if ($order['payment_status'] == 0) {
                        $status_text = 'Disabled';
                    }
                    echo $status_text;
                    ?>
                </td>
                <td>
                    <?php
                    $status_text = 'Chờ xử lý';
                    $disabled_button = '';
                    if ($order['orders_status'] == 1) {
                        $status_text = 'Đã xử lý';
                        $disabled_button = 'disabled="true"';
                    }
                    echo $status_text;
                    ?>
                </td>
                <td><?php echo $order['note'] ?></td>
                <td><?= $order['quality']?></td>
                <td><?php echo date('d-m-Y H:i:s', strtotime($order['created_at'])) ?></td>
                <?php
                $url_delete = "index.php?controller=order&action=delete&id=".$order['id'];
                ?>
                <td style="width: 10%;">
                    <a href="index.php?controller=order&action=handle&order_id=<?= $order['id']?>" class="btn btn-outline-light btn__handle-orders" <?= $disabled_button?>>Xử lý</a>
                    <a title="Xóa đơn hàng" href="<?= $url_delete?>" onclick="return confirm('Are you sure delete?')"><i
                            class="fa fa-trash"></i></a>
                </td>
            </tr>
        <?php endforeach; ?>
    </form>
    <?php else: ?>
        <tr>
            <td colspan="10">No data found</td>
        </tr>
    <?php endif; ?>
</table>
<?php echo $pages; ?>