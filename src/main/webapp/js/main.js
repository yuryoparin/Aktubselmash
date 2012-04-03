$(function() {
    $('a').hover(function() {
        $(this).addClass('hover');
    }, function() {
        $(this).removeClass('hover');
    }).mousedown(function() {
        $(this).addClass('active');
    }).mouseup(function() {
        $(this).removeClass('active');
    }).mouseout(function() {
        $(this).removeClass('active');
    });

    $('.gallery-box').scrollLeft(0);
    $('.gallery-dots span').hover(function() {
        if (!$(this).hasClass('active')) $(this).addClass('hover');
    }, function() {
        if ($(this).hasClass('hover')) $(this).removeClass('hover');
    }).click(function() {
        var $a = $(this);
        $a.parent().find('span').removeClass('active hover');
        $a.addClass('active');

        var i = 0;
        $a.parent().find('span').each(function(index,val) {
            if ($(val).hasClass('active')) i = index;
        });
        $(this).closest('.gallery').find('.gallery-box').animate({scrollLeft: i * 400}, 300, 'easeInCubic');
    });
    $('.gallery-box').click(function() {
        var length = $('.gallery-dots span').length;
        $('.gallery-dots span').get(cnt++ % length).click();
    });

    var cnt = -1;
    $('#navigation li').each(function(index, elem) {
        if (cnt >= 0) {
            $(elem).find('span').css({'border-left': 'none', 'margin-left': '1px'});
            cnt = -1;
        }
        else if ($(elem).hasClass('selected')) cnt = index;
    });

    if (!$('#navigation ul li.selected').length || $('#navigation ul li.last').hasClass('selected')) {
        var $span = $('#navigation ul li.last span');
        var paddingRight = parseInt($span.css('padding-right')) - 1;
        $('#navigation ul li.last span').css('padding-right', paddingRight + 'px');
    }

    $(document).click(function(event) {
//        $('div.select').each(function(index, value) {
//            console.log($(value));
//            if (!$(value).is(':hover')) $(value).removeClass('active');
//        });
    });

    $('div.select select').change(function() {
        $(this).parent().find('span.option-text').html($(this).find('option:selected').text());
    }).mousedown(function() {
        var $div = $(this).closest('div.select');
        setTimeout(function() { $div.addClass('active'); }, 100);
    }).click(function() {
        $(this).closest('div.select').removeClass('active');
    });

//	$('#navigation li').hover(function() {
//		var ul = $(this).find('ul');
//		if (!ul.is(':visible')) {
//			ul.show();
//			var w = ul.closest('li').width();
//			if (w > ul.width()) ul.width(w);
//		}
//	}, function() {
//		var ul = $(this).find('ul');
//		if (ul.is(':visible')) {
//			ul.hide();
//		}
//	});
});

var cartPopupTimeout;

function buy(productId, url) {
    $('.buy-button').hide().parent().width(45);
    $('.blue-button-loading').show();

    $.getJSON(url, { productId: productId }, function(result) {
        if (result.success) {
            $('#header div.cart p').html(tovary(result.size));
            var offset = $('.cart-popup').width() / 2;
            if (cartPopupTimeout) clearTimeout(cartPopupTimeout);
            $('.cart-popup').css({
                display: 'block',
                top: 25,
                left: $('div.cart').offset().left + 18 - $('#header').offset().left - offset
            }).animate({opacity: 1, top: 36}, function() {
                var $$ = $(this);
                cartPopupTimeout = setTimeout(function() {
                    $$.animate({opacity: 0}, function() { $(this).hide() });
                }, 1000);
            });
            $('.error-msg').hide();
            location.href = "http://aktubselmash.ru/cart";
        } else {
            $('.error-msg').dialog({
                buttons: { Ok: function() { $(this).dialog('close'); } },
                width: '450',
                resizable: false
            });
        }
    }).complete(function() {
        $('.blue-button-loading').hide().parent().width(110);
        $('.buy-button').show();
    }).error(function() {
        if (buyErrorDialogOpen) $('.error-msg').closest('.ui-dialog').css('display', 'block');
        else
            $('.error-msg').dialog({
                buttons: { Ok: function() { $(this).parent().hide(); } },
                width: '450',
                resizable: false
            });
        buyErrorDialogOpen = true;
    });
    return false;
}

function tovary(size) {
    return size == 0 ? 'Нет товаров' : size + ' ' + (size == 1 ? 'товар' : (size > 1 && size < 5 ? 'товара' : 'товаров'));
}