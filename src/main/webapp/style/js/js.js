$(function () {
    //alert($(window).width());
    $('.listHover').find('li').hover(
        function () {
            $(this).addClass('on');
        },
        function () {
            $(this).removeClass('on');
        }
    )
    //--
    $('.tabContentDiv').find('.tabContent:first').show();
    $('.tab').each(function (i) {
        $(this).find('li').each(function (ii) {
            $(this).hover(
                function () {
                    $('.tab').eq(i).find('li').removeClass('liNow');
                    $(this).addClass('liNow');
                    $('.tabContentDiv').eq(i).find('.tabContent').hide();
                    $('.tabContentDiv').eq(i).find('.tabContent').eq(ii).show();
                },
                function () {
                }
            )
        })
    })
    //--
    // $('.navA').toggle(
    //    function(){
    // 	   $('.nav').addClass('on');
    // 	   },
    //    function(){
    // 	   $('.nav').removeClass('on');
    // 	   }
    // )
    $('.navA').click(function () {
        if ($('.nav').hasClass('on')) {
            $('.nav').removeClass('on');
        } else {
            $('.nav').addClass('on');
        }
    });
    //--
    $('.indexPart5').find('.fr').find('li').each(function (i) {
        $(this).find('a').each(function (ii) {
            $(this).hover(
                function () {
                    $('.indexPart5').find('.fr').find('li').eq(i).addClass('on');
                    $('.indexPart5').find('.fr').find('li').eq(i).find('.box1').eq(ii).addClass('on');
                },
                function () {
                    $('.indexPart5').find('.fr').find('li').removeClass('on');
                    $('.indexPart5').find('.fr').find('li').find('.box1').removeClass('on');
                }
            )
        })
    })
    $('.contact').find('li').each(function (i) {
        $(this).find('a').each(function (ii) {
            $(this).hover(
                function () {
                    $('.contact').find('li').eq(i).addClass('on');
                    $('.contact').find('li').eq(i).find('.box1').eq(ii).addClass('on');
                },
                function () {
                    $('.contact').find('li').removeClass('on');
                    $('.contact').find('li').find('.box1').removeClass('on');
                }
            )
        })
    })
    //--
    $('.topA').click(function () {
        $('body,html').animate({scrollTop: 0}, 300);
    })
    //--
    $('.Solution_02').find('area').each(function (i) {
        $(this).hover(
            function () {
                $('.Solution_02').find('.list').find('li').eq(i).addClass('on1');
            },
            function () {
                $('.Solution_02').find('.list').find('li').eq(i).removeClass('on1');
            }
        )
    })
    $('.Solution_02').find('.list3').find('li:even').addClass('liEven');
    //--
    $('.Solution_02').find('.btn-2').find('.a1').click(function () {
        $('body,html').animate({scrollTop: $('.SolutionDD').offset().top}, 300);
    })
    $('.Solution_04').find('.content-1').find('.more').click(function () {
        $('.Solution_04').find('.content-1').hide();
        $('.Solution_04').find('.content-2').show();
    })
    $('.Solution_04').find('.content-2').find('.more').click(function () {
        $('.Solution_04').find('.content-1').show();
        $('.Solution_04').find('.content-2').hide();
    })
    //--
    $('.Solution_05').each(function (i) {
        $(this).find('li').each(function (ii) {
            if (ii % 3 == 0) {
                $(this).addClass('liClear');
            }
        })
    })
    $('.Solution_05').find('li').each(function (i) {
        $(this).find('.btn').find('a').toggle(
            function () {
                $('.Solution_05').find('li').eq(i).find('.content-1').hide();
                $('.Solution_05').find('li').eq(i).find('.content-2').show();
                $(this).addClass('on');
            },
            function () {
                $('.Solution_05').find('li').eq(i).find('.content-1').show();
                $('.Solution_05').find('li').eq(i).find('.content-2').hide();
                $(this).removeClass('on');
            }
        )
    })
    //--
    $('.amlPart2').each(function (i) {
        $(this).find('li').each(function (ii) {
            if (ii % 3 == 0) {
                $(this).addClass('liClear');
            }
        })
    })
    //--
    $('.caseShow_03').find('li:odd').addClass('liOdd');
    //--
    $('.jobList').find('li').each(function (i) {
        $(this).find('.name').click(function () {
            $('.jobList').find('li').removeClass('on');
            $('.jobList').find('li').eq(i).addClass('on');
        })
    })
    //--
    $('.product').find('li').each(function (i) {
        $(this).find('.name').find('a').click(function () {
            if ($('.product').find('li').eq(i).hasClass('on')) {
                $('.product').find('li').removeClass('on');
                $('.product').find('li').removeClass('on-1');
            } else {
                $('.product').find('li').removeClass('on');
                $('.product').find('li').removeClass('on-1');
                if (i % 2 == 0) {
                    $('.product').find('li').eq(i).next().addClass('on-1');
                } else {
                    $('.product').find('li').eq(i).prev().addClass('on-1');
                }
                $('.product').find('li').eq(i).addClass('on');
            }
        })
    })
    //--
    slideFun();
    $(window).scroll(function () {
        slideFun();
    })
    //
})