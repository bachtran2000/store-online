<form method="GET" action="">
    <div class="form-group">
        <label for="username">Username</label>
        <input type="text" name="username" id="username"
               value="<?php echo isset($_GET['username']) ? $_GET['username'] : '' ?>" class="form-control"/>
        <input type="hidden" name="controller" value="user"/>
        <input type="hidden" name="action" value="index"/>
    </div>
    <div class="form-group">
        <input type="submit" value="Tìm kiếm" name="search" class="btn btn-primary"/>
        <a href="index.php?controller=user" class="btn btn-default">Back</a>
    </div>
</form>

<h2>Danh sách user</h2>
<?php
$disabled_member = '';
if(isset($_SESSION['user'])){
    if($_SESSION['user']['level'] == 1){
        $disabled_member = 'disabled="true"';
    }
}
?>
<a href="index.php?controller=user&action=create" class="btn btn-success" <?= $disabled_member?>>
    <i class="fa fa-plus"></i> Thêm mới
</a>
<table class="table table-bordered user-list-table">
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Full name</th>
        <th>phone</th>
        <th>address</th>
        <th>email</th>
        <th>avatar</th>
        <th>jobs</th>
        <th>created_at</th>
        <th></th>
    </tr>
    <?php if (!empty($users)): ?>
        <?php foreach ($users as $user): ?>
            <tr>
                <td><?php echo $user['id'] ?></td>
                <td><?php echo $user['username'] ?></td>
                <td><?php echo $user['full_name'] ?></td>
                <td><?php echo $user['phone'] ?></td>
                <td><?php echo $user['address'] ?></td>
                <td><?php echo $user['email'] ?></td>
                <td>
                    <?php if (!empty($user['avatar'])): ?>
                        <img height="80" src="assets/uploads/<?php echo $user['avatar'] ?>"/>
                    <?php endif; ?>
                </td>
                <td><?php echo $user['jobs'] ?></td>
                <td><?php echo date('d-m-Y H:i:s', strtotime($user['created_at'])) ?></td>
                <?php
                $disabled = '';
                if(isset($_SESSION['user'])){
                    if($_SESSION['user']['username'] != $user['username']) {
                        if ($_SESSION['user']['level'] <= $user['level']) {
                            $disabled = 'hidden';
                        }
                    }
                }
                ?>
                <td class="action">
                    <?php
                    $url_detail = "index.php?controller=user&action=detail&id=" . $user['id'];
                    $url_update = "index.php?controller=user&action=update&id=" . $user['id'];
                    $url_delete = "index.php?controller=user&action=delete&id=" . $user['id'];
                    ?>
                    <a title="Chi tiết" href="<?php echo $url_detail ?>"><i class="fa fa-eye"></i></a> &nbsp;&nbsp;
                    <a class="<?= $disabled?>" title="Update" href="<?php echo $url_update ?>" <?= $disabled_member?>><i class="fa fa-pencil-alt"></i></a> &nbsp;&nbsp;
                    <a class="<?= $disabled?>" title="Xóa" href="<?php echo $url_delete ?>" <?= $disabled_member?> onclick="return confirm('Are you sure delete?')"><i
                                class="fa fa-trash"></i></a>
                </td>
            </tr>
        <?php endforeach; ?>
    <?php else: ?>
    <?php endif; ?>
</table>
<?php echo $pages; ?>