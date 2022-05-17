<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script>

        function more(id) {
            location.href = '${pageContext.request.contextPath }/admin/show_particulars.do?id=' + id;
        }
    </script>

    <style>

        .article {
            margin: 100px 300px 100px 313px;
            /* margin: 25px 300px 100px 400px; */
        }

        /*.article{!*父盒子*!*/
        /*    margin:100px 300px 100px 400px;*/
        /*}*/
        /*.article_box{!*遍历盒*!*/
        /*    padding: 10px 20px 0px 20px;*/
        /*    margin-bottom: 35px;*/
        /*    width: 1100px;*/
        /*    background: #FFFFFF;*/
        /*    box-shadow: 0 0 17px 0 rgb(0 0 0 / 6%);*/
        /*    !*float: right;*!*/
        /*}*/
        /*.a_content{!*内容遍历盒子*!*/
        /*    margin: 0px 20px 0px 20px;*/
        /*    width: 290px;*/
        /*}*/

        /*.acc_title{!*文章分类盒子*!*/
        /*    margin-bottom: 20px;*/
        /*    font-size: 40px;*/
        /*    color: #e35114;*/
        /*    height: 40px;*/
        /*    border-bottom: 3px solid #c7254e;*/

        /*}*/


        /*.ac_title{!*文章标题*!*/
        /*    height: 57px;*/
        /*    width: 121%;*/
        /*    font-size: 18px;*/
        /*    letter-spacing: 1.44px;*/
        /*    padding: 0px 20px;*/
        /*    box-sizing: border-box;*/
        /*    margin: 8px 0;*/
        /*    font-family: PingFangSC-Medium, PingFang SC;*/
        /*    font-weight: 500;*/
        /*    color: #3b3b3b;*/
        /*    line-height: 25px;*/
        /*    text-overflow: -o-ellipsis-lastline;*/
        /*    overflow: hidden;*/
        /*    text-overflow: ellipsis;*/
        /*    display: -webkit-box;*/
        /*    -webkit-line-clamp: 2;*/
        /*    line-clamp: 2;*/
        /*    -webkit-box-orient: vertical;*/
        /*}*/
        /*.img_box{!*文章图片盒子*!*/
        /*    float: left;*/
        /*    cursor: pointer;*/
        /*    width: 240px;*/
        /*    height: 216px;*/
        /*    background: #ffffff;*/
        /*}*/

        /*.img_box img{!*文章图片*!*/
        /*    width: 121%;*/
        /*    object-fit: cover;!*居中自动剪裁图片*!*/
        /*    height: 216px;*/
        /*    display: block;*/
        /*}*/

        /*.flex_box{!*弹性布局*!*/
        /*    display: flex;*/
        /*    justify-content: flex-start;*/
        /*    overflow: hidden;*/

        /*    width: 1100px;*/
        /*    margin: 0 auto;*/

        /*    padding-bottom: 30px;*/

        /*}*/
    </style>

</head>

<body>


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
            <div style="width: 100%;height: 450px">
                <img src="${pageContext.request.contextPath }/style/imags/lunbo1.jpg" alt="..." width="100%"
                     height="100%">
            </div>

        </div>
        <div class="item">
            <div style="width: 100%;height: 450px">
                <img src="${pageContext.request.contextPath }/style/imags/lunbo3.jpg" alt="..." width="100%"
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

<div class="article">
    <c:forEach items="${acc}" var="acc">
        <div class="article_box">

            <div class="acc_title">
                <ul style="height: 50px;line-height: 50px;margin-left: 15px">
                        <%--  <li style="display:inline-block;font-size: 25px;">${acc.className}</li>，横向排列--%>
                    <li style="float: left;font-size: 25px;">${acc.className}</li>
                    <li style="float: right;font-size: 15px;margin-right: 15px">
                        <a href="${pageContext.request.contextPath }/admin/show_article_more.do?id=${acc.id}">更多>></a>
                    </li>
                </ul>
            </div>

            <div class="flex_box"><%--弹性布局--%>
                <c:forEach items="${ac}" var="ac">
                    <c:if test="${ac.articleClass_id == acc.id and ac.status==1 and ac.display==0}"> <%--style="display:inline-block;" --%>
                        <div class="a_content" onclick="more(${ac.id});">
                            <div class="img_box">
                                    <%--<img src="${pageContext.request.contextPath}/style/imags/banner.jpg">--%>
                                    <%--                                            <a href="${pageContext.request.contextPath }/pay/show_pay.do?className=${acc.className}&article_id=${ac.id}&title=${ac.title}">--%>
                                <img src="${ac.img}" alt="logo"/>
                                    <%--                                            </a>--%>

                            </div>

                            <div class="ac_title">
                                <ul style="margin-top: 7px">
                                    <li>${ac.title}</li>
                                </ul>
                                    <%--
                                                                    <ul>
                                                                        <li>${ac.content}</li>
                                                                    </ul>--%>
                            </div>

                        </div>
                    </c:if>
                </c:forEach>
            </div>


        </div>

    </c:forEach>

</div>
</body>
</html>