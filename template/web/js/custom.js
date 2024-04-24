$(function () {

    let base_url = $('base').attr('url');

    // Change Language
    $(document).on('click', 'a.language-change', function () {
        var _langid = $(this).attr('data-lang');
        $.ajax({
            crossOrigin: true,
            type: "POST",
            url: base_url + "lang.php",
            data: {'lang_id': _langid},
            success: function () {
                window.location.href = "";
            }
        });
        return false;
    });

    // User Subscribe Newsletter
    $("#subscribeForm").validate({
        rules: {
            email: {
                required: !0,
                email: !0
            }
        },
        messages: {
            email: {
                required: "Enter your Email Address",
                email: "Enter a valid email address"
            }
        },
        submitHandler: function (form) {
            if (form) {
                var Frmval = $("#subscribeForm").serialize();
                $.ajax({
                    type: "POST",
                    dataType: "JSON",
                    url: base_url + "includes/controllers/ajax.subscribers.php",
                    data: "action=addFrontSubscriber&" + Frmval,
                    success: function (data) {
                        var msg = eval(data);
                        if (msg.action == 'warning' || msg.action == 'unsuccess') {
                            var message = '<div class="alert alert-danger"><span>' + msg.message + '</span></div>';
                            $(message).prependTo('.my-msg-1').fadeIn(500, function () {
                                $('.my-msg-1').fadeOut(6000)
                            });
                        }
                        if (msg.action == 'success') {
                            var message = '<div class="alert alert-success"><span>' + msg.message + '</span></div>';
                            $(message).prependTo('.my-msg-1').fadeIn(500, function () {
                                $('.my-msg-1').fadeOut(6000)
                            });
                            $("#subscribeForm")[0].reset();
                        }
                    }
                });
                return !1;
            }
        }
    })

    // Cart Product Plus Minus
    // $(".cart-plus-minus").prepend('<div class="dec qtybutton">-</div>');
    // $(".cart-plus-minus").append('<div class="inc qtybutton">+</div>');

    $(".qtybutton").on("click", function () {
        var $button = $(this);
        var oldValue = $button.parent().find("input").val();
        var newVal = oldValue;

        var $input = $button.parent().find("input"),
            price = parseFloat($input.attr('price')),
            currency = $input.attr('currency'),
            inputTotal = $button.parent().parent().parent().find(".product_total"),
            cartTotal = $button.parent().parent().parent().find(".product-sub-total");

        if ($button.text() == "+") {
            newVal = parseFloat(oldValue) + 1;
        }
        else {
            if (oldValue > 1) {
                newVal = parseFloat(oldValue) - 1;
            }
        }
        var priceTotal = newVal * price;
        priceTotal = priceTotal.toFixed(2);
        cartTotal.html(currency + ' ' + priceTotal);
        inputTotal.val(priceTotal);
        $button.parent().find("input").val(newVal);
    });

    // Add to cart
    $(document).on('click', 'a.add-cart', function () {
        var _formId = $(this).attr('form-id'),
            _cartId = $(this).attr('data-cartid'),
            Frmval = $("form#" + _formId).serialize();
        $.ajax({
            type: "POST",
            dataType: "JSON",
            url: base_url + "add_cart.php",
            data: "action=add_cart&item_slug=" + _cartId + "&" + Frmval,
            success: function (data) {
                var res = eval(data);
                $("sup.cart-total").html(res.no_cart);
                $(".add_to_cart_modal_content").html(res.content);
                $("#add_to_cart_modal").modal();
                $.ajax({
                    type: "POST",
                    dataType: "JSON",
                    url: base_url + "add_cart.php",
                    data: {
                        action: "list_cart"
                    },
                    success: function (data) {
                        var res = eval(data);
                        $("div.mini-cart-product-area").html(res.result);
                        $("span.sub-total-mini-cart").html(res.sub_total);
                        $("span#addedmessage").html(res.message).css('display', 'block').fadeOut(8000);
                    }
                })
            }
        });
        return false;
    });

    // Remove from cart
    $(document).on('click', 'span.remove-cart', function () {
        var _cartId = $(this).attr('data-id'),
            _parent = jQuery(this).parents(".cart-remove");
        $.ajax({
            type: "POST",
            dataType: "JSON",
            url: base_url + "add_cart.php",
            data: "action=remove_cart&item_id=" + _cartId,
            success: function (data) {
                var res = eval(data);
                $("sup.cart-total").html(res.no_cart);
                _parent.remove();
                $("span.sub-total-mini-cart").html(res.sub_total);
            }
        });
        return false;
    });

    // Add to wishlist
    $(document).on('click', 'a.add-wishlist', function () {
        var _cartId = $(this).attr('data-cartid');
        $.ajax({
            type: "POST",
            dataType: "JSON",
            url: base_url + "add_cart.php",
            data: "action=add_wishlist&product_slug[]=" + _cartId,
            success: function (data) {
                var res = eval(data);
                if (res.action === 'warning_no_login' || res.action === 'unsuccess' || res.action === 'warning_already_in_wishlist') {
                    alert(res.message);
                }
                if (res.action === 'success') {
                    $(".wishlist_modal_content").html(res.content);
                    $("#liton_wishlist_modal").modal();
                    
                }
            }
        });
        return false;
    });

    // Add to cart from wishlist
    $(document).on('click', 'a.add-cart-wishlist', function () {
        var _cartId = $(this).attr('data-cartid'),
            $this = $(this);
        $.ajax({
            type: "POST",
            dataType: "JSON",
            url: base_url + "add_cart.php",
            data: "action=add_cart_wishlist&item_slug=" + _cartId,
            success: function (data) {
                var res = eval(data);
                $("sup.cart-total").html(res.no_cart);
                $(".add_to_cart_modal_content").html(res.content);
                $("#add_to_cart_modal").modal();
                $this.parent().parent().remove();
                $.ajax({
                    type: "POST",
                    dataType: "JSON",
                    url: base_url + "add_cart.php",
                    data: {
                        action: "list_cart"
                    },
                    success: function (data) {
                        var res = eval(data);
                        $("div.mini-cart-product-area").html(res.result);
                        $("span.sub-total-mini-cart").html(res.sub_total);
                        $("span.addedmessage").html(res.message);
                    }
                })
            }
        });
        return false;
    });

    // Remove from Wishlist
    $(document).on('click', 'td.remove-wishlist', function () {
        var _cartId = $(this).attr('data-id'),
            _parent = jQuery(this).parents(".cart-remove");
        $.ajax({
            type: "POST",
            dataType: "JSON",
            url: base_url + "add_cart.php",
            data: "action=remove_wishlist&item_id=" + _cartId,
            success: function (data) {
                var res = eval(data);
                _parent.remove();
            }
        });
        return false;
    });

    // CART PAGE
    $(".cqtybutton").on("click", function () {
        var $button = $(this);
        var newVal = 0;
        var rate = 0;
        var oldValue = $button.parent().find("input").val();

        var $input = $button.parent().find("input"),
            price = parseFloat($input.attr('price')),
            currency = $input.attr('currency'),
            cartRowTotal = $button.parent().parent().parent().find(".product-sub-total"),
            _cartId = $input.attr('data-id'),
            _cartLabel = $input.attr('data-label');

        if ($button.text() == "+") {
            newVal = parseFloat(oldValue) + 1;
        }
        else {
            if (oldValue > 1) {
                newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }

        rate = (newVal * price);
        rate = rate.toFixed(2);
        $input.attr('total', rate);
        get_total(currency);

        $.ajax({
            type: "POST",
            dataType: "JSON",
            url: base_url + "add_cart.php",
            data: "action=update_cart&item_id=" + _cartId + "&item_label=" + _cartLabel + "&item_price=" + price + "&item_qty=" + newVal,
            success: function (data) {
            }
        })

        var priceTotal = newVal * price;
        priceTotal = priceTotal.toFixed(2);
        cartRowTotal.html(currency + ' ' + priceTotal);
        $button.parent().find("input").val(newVal);
    });

    function get_total(currency) {
        var totalPoints = 0;
        $('input.cin-input').each(function () {
            totalPoints += parseFloat($(this).attr('total'));
        });
        totalPoints = totalPoints.toFixed(2);
        $('.sub-total-main-cart').html(currency + ' ' + totalPoints);
    }

    $(document).on('click', 'td.remove-cart', function () {
        var _cartId = $(this).attr('data-id'),
            _cartLabel = $(this).attr('data-label'),
            _parent = jQuery(this).parents(".cart-remove"),
            currency = $(this).attr('currency');
        $.ajax({
            type: "POST",
            dataType: "JSON",
            url: base_url + "add_cart.php",
            data: "action=remove_from_cart&item_id=" + _cartId + "&item_label=" + _cartLabel,
            success: function (data) {
                var res = eval(data);
                $("sup.cart-total").html(res.no_cart);
                _parent.remove();
                $("td.sub-total-cart").html(res.sub_total);
                $.ajax({
                    type: "POST",
                    dataType: "JSON",
                    url: base_url + "add_cart.php",
                    data: {
                        action: "list_cart"
                    },
                    success: function (data) {
                        var res = eval(data);
                        $("div.mini-cart-product-area").html(res.result);
                        $("span.sub-total-mini-cart").html(res.sub_total);
                    }
                })
                get_total(currency);
            }
        });
        return false;
    });
});