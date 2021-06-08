$(document).ready(function () {
    $('.carousel').carousel({
        interval: 1000
    });
    $('.header-menu .main-menu ._menu-ul ._menu-li').hover(function () {
        let category = $(this).attr('data-category');
        $('#'+category+'').toggle();
    });
    $('.product-list .product-content a').hover(function () {
        $(this).toggleClass('active');
    });
    // $('.product-quality__content .product-amount').change(function () {
    //     let id = $(this).attr('name');
    //     let num = $(this).val();
    //     $.post(
    //         'index.php?controller=cart&action=update',
    //         {'id': id, 'num': num},
    //         function (data){
    //             $('.cart__form').load("cart .cart__form");
    //         }
    //     )
    // });
    // $('.btn__remove-product').click(function () {
    //     let id = $(this).attr('name');
    //     let num = $("#num-"+id).val();
    //     $.post(
    //         'index.php?controller=cart&action=update',
    //         {'id': id, 'num': 0},
    //         function (data){
    //             $('.cart__form').load("cart .cart__form");
    //         }
    //     )
    // })
})