<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script>


    // $(function() {
    //     $('.show').on('click', function () {
    //         var filename =$(this).attr("data")
    //         var img = "<img src='"+filename+"'>"
    //         layer.open({
    //             type: 1,//Page层类型
    //             // area: ['500px', '300px'],
    //             title: '你好，layer。',
    //             shade: 0.6,//遮罩透明度
    //             maxmin: true,//允许全屏最小化
    //             anim: 1,//0-6的动画形式，-1不开启
    //             content: img
    //         });
    //     });
    // })

    $(function () {
        $('.test').on('click', function () {
            <%--alert("123")--%>
            <%--// layer.alert("123")--%>
            <%--var img = '<img src="${pageContext.request.contextPath }/upload/7f566157-259d-4491-8d88-443eb24aeeb1254542c348e0401b7133784724f50cea.jpg">'--%>
            <%--layer.open({--%>
            <%--    type: 2,//Page层类型--%>
            <%--    area: ['500px', '300px'],--%>
            <%--    title: '你好，layer。',--%>
            <%--    shade: 0.6 ,//遮罩透明度--%>
            <%--    maxmin: true ,//允许全屏最小化--%>
            <%--    anim: 1 ,//0-6的动画形式，-1不开启--%>
            <%--    content: img--%>
            <%--})--%>

            layer.photos({
                type: 1,
                photos: '.fp',
                shade: 0.6,//遮罩透明度
                anim: 0,//-6的动画形式，-1不启
                closeBtn: 1, // 是否显示关闭按钮 默认为0 不显示 1/2 2种风格
                area: ['500px'],  // 调节寬width height  ['600px','500px']
                shadeClose: true,//点击遮罩关闭
            })
        })
    })
</script>

<div class="bg">


    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <%--            <li data-target="#carousel-example-generic" data-slide-to="2"></li>--%>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <div style="width: 100%;height: 100%">
                    <img src="${pageContext.request.contextPath }/style/imags/pkhouse.jpg" alt="..." width="100%"
                         height="100%">
                </div>

            </div>
            <div class="item">
                <div style="width: 100%;height: 100%">
                    <img src="${pageContext.request.contextPath }/style/imags/pkbg.jpg" alt="..." width="100%"
                         height="100%">
                </div>

            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

</div>
</body>
</html>


