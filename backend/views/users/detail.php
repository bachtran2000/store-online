<?php
require_once 'helpers/Helper.php';
?>
<h2>Chi tiết user</h2>
<table class="table table-bordered">
    <tr>
        <th>ID</th>
        <td><?php echo $user['id'] ?></td>
    </tr>
    <tr>
        <th>Username</th>
        <td><?php echo $user['username'] ?></td>
    </tr>
    <tr>
        <th>Full name</th>
        <td><?php echo $user['full_name'] ?></td>
    </tr>
    <?php
    $user_level = $user['level'];
    $user_level_label = '';
    switch ($user_level){
        case 1:
            $user_level_label = 'Member';
            break;
        case 2:
            $user_level_label = 'Admin';
            break;
        case 3:
            $user_level_label = 'Super Admin';
            break;
        default:
            $user_level_label = '';
            break;
    }
    ?>
    <tr>
        <th>Level</th>
        <td><?php echo $user_level_label ?></td>
    </tr>
    <tr>
        <th>Phone</th>
        <td><?php echo $user['phone'] ?></td>
    </tr>
    <tr>
        <th>Address</th>
        <td><?php echo $user['address'] ?></td>
    </tr>
    <tr>
        <th>Email</th>
        <td><?php echo $user['email'] ?></td>
    </tr>
    <tr>
        <th>Avatar</th>
        <td>
            <?php if (!empty($user['avatar'])): ?>
                <img height="80" src="assets/uploads/<?php echo $user['avatar'] ?>"/>
            <?php endif; ?>
        </td>
    </tr>
    <tr>
        <th>Jobs</th>
        <td><?php echo $user['jobs'] ?></td>
    </tr>
    <tr>
        <th>Status</th>
        <td><?php echo Helper::getStatusText($user['status']); ?></td>
    </tr>
    <tr>
        <th>Created_at</th>
        <td><?php echo date('d-m-Y H:i:s', strtotime($user['created_at'])) ?></td>
    </tr>
    <tr>
        <th>Updated_at</th>
        <td><?php echo date('d-m-Y H:i:s', strtotime($user['updated_at'])) ?></td>
    </tr>
</table>
<?php
$disabled = '';
if(isset($_SESSION['user'])){
    if($_SESSION['user']['username'] != $user['username']) {
        if ($_SESSION['user']['level'] <= $user['level']) {
            $disabled = 'disabled="true"';
        }
    }
}
?>
<a href="index.php?controller=user&action=update&id=<?= $user['id']?>" class="btn btn-info" <?= $disabled?>>Cập nhật</a>
<a href="index.php?controller=user&action=index" class="btn btn-default">Back</a>