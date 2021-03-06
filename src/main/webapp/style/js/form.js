var selectDivNow = 0;
$(function () {
    //--
    $('.selectDiv').each(function (i) {
        $(this).find('span').text($(this).find('option:first').text());
        $(this).click(function () {
            selectDivNow = i;
            var selectList = "";
            $(this).find('option').each(function () {
                selectList = selectList + "<li>" + $(this).text() + "</li>"
            })
            $('.selectLayer').find('ul').html(selectList);
            $('.selectLayer').width($(this).width());
            $('.selectLayer').css('left', $(this).offset().left);
            $('.selectLayer').css('top', $(this).offset().top + $(this).height() + 1);
            $('.selectLayer').show();
            selectLiFun();
            selectLiClick();
            selectLiClick2();
        })
    })
    $('.selectLayer').hover(
        function () {
            $(this).show();
        },
        function () {
            $(this).hide();
        }
    )
    //--复杂框
    $('.check').toggle(
        function () {
            $(this).addClass('checkNow');
            $(this).find('input').val(1);
        },
        function () {
            $(this).removeClass('checkNow');
            $(this).find('input').val(0);
        }
    )
    //--单选
    $('.radio').click(
        function () {
            $('.radio').removeClass('radioNow');
            $(this).addClass('radioNow');
            $('.radio').find('input').val(0);
            $(this).find('input').val(1);
        }
    )
    //-------文本输入框文字消失显示
    $('.input_hover').focus(function () {
        if ($(this).attr('value') == $(this).attr('title')) {
            $(this).attr('value', '');
        }
    })
    $('.input_hover').blur(function () {
        if ($(this).attr('value') == $(this).attr('title') || $(this).attr('value') == "") {
            $(this).attr('value', $(this).attr('title'));
        }
    })
    //-------文本输入框文字消失显示2
    $('.liInput').each(function (i) {
        $(this).find('.input1').focus(function () {
            $('.liInput').eq(i).find('label').hide();
        })
        $(this).find('.input1').blur(function () {
            if ($(this).attr('value') == "") {
                $('.liInput').eq(i).find('label').show();
            }
        })
        $(this).find('label').click(function () {
            $('.liInput').eq(i).find('label').hide();
            $('.liInput').eq(i).find('.input1').focus();
        })
    })
    //--数字框
    $('.numInput').each(function (i) {
        $(this).find('.num').html($(this).find('input').val());
        $(this).find('.jiaBtn').click(function () {
            $('.numInput').eq(i).find('input').val(Number($('.numInput').eq(i).find('input').val()) + 1);
            $('.numInput').eq(i).find('.num').html($('.numInput').eq(i).find('input').val());
        })
        $(this).find('.jianBtn').click(function () {
            if (Number($('.numInput').eq(i).find('input').val()) > 0) {
                $('.numInput').eq(i).find('input').val(Number($('.numInput').eq(i).find('input').val()) - 1);
            }
            $('.numInput').eq(i).find('.num').html($('.numInput').eq(i).find('input').val());
        })
    })
    //--
    $('.input1').focus(function () {
        $(this).addClass('inputNow');
    })
    $('.input1').blur(function () {
        $(this).removeClass('inputNow');
    })
    //
})

function selectLiClick() {
    $('.selectLayer').find('li').each(function (i) {
        $(this).click(function () {
            $('.selectDiv').eq(selectDivNow).find('span').text($(this).text());
            $('.selectDiv').eq(selectDivNow).find('option').attr('selected', false);
            $('.selectDiv').eq(selectDivNow).find('option').eq(i).attr('selected', true);
        })
    })
}

function selectLiFun() {
    $('.selectLayer').find('li').hover(
        function () {
            $(this).css('background', '#f2f2f2');
        },
        function () {
            $(this).css('background', 'none');
        }
    )
}

//--
function selectLiClick2() {
    $('.selectLayer').find('li').each(function (i) {
        if ($('.ForgotStep2Div').length > 0) {
            $(this).click(function () {
                $('.ForgotStep2Div').hide();
                $('.ForgotStep2Div').eq(i).show();
            })
        }
        //--
    })
}