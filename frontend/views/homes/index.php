<?php require_once 'views/layouts/slide.php';?>

<section class="category-content">
    <div class="men_categories">
        <h2 class="category-title"><?= $men_categories['title']?></h2>
        <div class="row categories-image_link">
            <?php if(!empty($men_categories['content'])):?>
            <?php foreach ($men_categories['content'] as $men_category):?>
                <div class="col-md-4 image_link-content" id="image_link-item-<?= $men_category['id']?>">
                    <a title="<?= $men_category['name']?>" href="product/category-id/<?= $men_category['id']?>">
                        <img src="../backend/assets/uploads/<?= $men_category['avatar']?>" alt="">
                    </a>
                    <p class="category-name"><?= $men_category['name']?></p>
                </div>
            <?php endforeach;?>
            <?php endif;?>
        </div>
    </div>
    <hr style="margin: 3% 5%"/>
    <div class="women_categories">
        <h2 class="category-title"><?= $women_categories['title']?></h2>
        <div class="row categories-image_link">
            <?php if(!empty($women_categories['content'])):?>
            <?php foreach ($women_categories['content'] as $women_category):?>
                <div class="col-md-4 image_link-content" id="image_link-item-<?= $women_category['id']?>">
                    <a title="<?= $women_category['name']?>" href="product/category-id/<?= $women_category['id']?>">
                        <img src="../backend/assets/uploads/<?= $women_category['avatar']?>" alt="">
                    </a>
                    <p class="category-name"><?= $women_category['name']?></p>
                </div>
            <?php endforeach;?>
            <?php endif;?>
            <p></p>
        </div>
    </div>
</section>
