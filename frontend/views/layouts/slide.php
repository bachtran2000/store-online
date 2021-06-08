<section class="slide-category">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <?php if($count_categories != 0):?>
                <?php for ($i=0; $i<$count_categories; $i++):?>
                    <li data-target="#carouselExampleIndicators" data-slide-to="<?= $i?>" class="<?= ($i == 0) ? 'active' : ''?>"></li>
                <?php endfor;?>
            <?php endif;?>
        </ol>
        <div class="carousel-inner">
            <?php if(!empty($categories)):?>
                <?php foreach ($categories as $category):?>
                    <div class="carousel-item <?= ($category['id'] == 1) ? 'active' : ''?>">
                        <img class="d-block w-100" src="../backend/assets/uploads/<?= $category['avatar']?>">
                    </div>
                <?php endforeach;?>
            <?php endif;?>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="btn__shop-now">
        <a href="products" class="btn text-uppercase">shop now</a>
    </div>
</section>