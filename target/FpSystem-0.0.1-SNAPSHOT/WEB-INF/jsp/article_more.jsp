<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/27
  Time: 18:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../../header.jsp" %>
<html>
<head>
    <title>更多</title>

    <script>

        function more(id) {
            location.href = '${pageContext.request.contextPath }/admin/show_particulars.do?id=' + id;
        }
    </script>

    <style>


        .article_box {
            margin-left: -220px;
        }

        <%--     .article{/*父盒子*/
                 margin:100px 300px 100px 400px;
             }
             .article_box{/*遍历盒*/
                 padding: 40px 20px 0px 20px;
                 margin-bottom: 35px;
                 width: 1000px;
                 background: #FFFFFF;
                 box-shadow: 0 0 17px 0 rgb(0 0 0 / 6%);
                 /*float: right;*/
             }
             .a_content{/*内容遍历盒子*/
                 background-color: #c7254e;
                 margin: 30px 20px 20px 60px;
                 width: 240px;
             }

             .acc_title{/*文章分类盒子*/
                 margin-bottom: 20px;
                 font-size: 40px;
                 color: #e35114;
                 height: 40px;
                 border-bottom: 3px solid #c7254e;
             }


             .ac_title{/*文章标题*/
                 width: 100%;
                 font-size: 18px;
                 letter-spacing: 1.44px;
                 padding: 0px 20px;
                 box-sizing: border-box;
                 font-family: PingFangSC-Medium, PingFang SC;
                 font-weight: 500;
                 color: #3b3b3b;
                 line-height: 25px;
                 text-overflow: -o-ellipsis-lastline;
                 overflow: hidden;
                 text-overflow: ellipsis;
                 display: -webkit-box;
                 -webkit-line-clamp: 2;
                 line-clamp: 2;
                 -webkit-box-orient: vertical;
             }
             .img_box{/*文章图片盒子*/
                 float: left;
                 cursor: pointer;
                 width: 240px;
                 height: 216px;
                 background: #ffffff;
             }

             .img_box img{/*文章图片*/
                 width: 100%;
                 object-fit: cover;/*居中自动剪裁图片*/
                 height: 216px;
                 display: block;

             }

             .flex_box{/*弹性布局*/
                 display: flex;
                 justify-content: flex-start;
                 overflow: hidden;
                 flex-wrap: wrap;
                 width: 1100px;
                 margin: 0 auto;

                 padding-bottom: 30px;

             }--%>
        .flex_box {
            flex-wrap: wrap;
        }

        .a_content {
            margin: 0px 20px 50px 20px;
            width: 21%;
            height: 350px;
            flex-shrink: 0;
            border: #9d9d9d solid 1px;
        }

        .img_box {
            float: left;
            cursor: pointer;
            /* width: 240px; */
            width: 100%;
            height: 216px;
            background: #ffffff;
        }

        .ac_title {

            height: 62px;
            width: 100%;
            font-size: 18px;
            letter-spacing: 1.44px;
            padding: 0px 20px;
            box-sizing: border-box;
            margin: 8px 0;
            font-family: PingFangSC-Medium, PingFang SC;
            font-weight: 500;
            color: #3b3b3b;
            line-height: 25px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }


    </style>


</head>

<body>


<div class="article">

    <div class="article_box" style="width: 1350px">

        <div class="acc_title">
            <ul style="height: 50px;line-height: 50px;margin-left: 15px">
                <li style="float: left;font-size: 25px;">${acc.className}</li>
            </ul>

        </div>

        <div class="flex_box" style="width: 100%"><%--弹性布局--%>
            <c:forEach items="${ac.list}" var="ac">
                <c:if test="${ ac.status==1 and ac.display==0}">
                    <div class="a_content" onclick="more(${ac.id});">
                        <div class="img_box">

                                <%--                                <a href="${pageContext.request.contextPath }/pay/show_pay.do?className=${acc.className}&article_id=${ac.id}&title=${ac.title}">--%>
                            <img src="${ac.img}" alt="logo"/>
                                <%--                                </a>--%>

                        </div>

                        <div class="ac_title">
                            <ul style="margin-top: 18px">
                                <li>${ac.title}</li>
                            </ul>
                        </div>

                            <%--金额--%>
                        <div style="margin: 0px 25px">

                            <ul>
                                <li style="float: left;">目标：</li>
                                <li style="color:#e35114;float: left;">${ac.target}</li>
                                <li style="float: left;">元</li>
                            </ul>
                            <ul style="float: right;">

                                <li style="float: left;">已有：</li>
                                <li style="color:#e35114;float: left;">${ac.total}</li>
                                <li style="float: left;">元</li>
                            </ul>
                        </div>
                        <div style="margin-top:5px;float: right">
                            <a href="javascript:void(0);"> <img
                                    src="${pageContext.request.contextPath }/style/imags/go.PNG"></a>
                        </div>

                    </div>
                </c:if>
            </c:forEach>
        </div>

    </div>
    <!--分页-->
    <nav aria-label="Page navigation">
        <div id="pages" style="margin-left: 350px">

            <ul class="pagination">
                <li><a href="#" class="current_page">当前页码：${ac.pageNum} 总页数: ${ac.pages}  </a></li>
                <li><a href="${pageContext.request.contextPath}/admin/show_article_more.do?id=${acc.id}">首页</a></li>
                <c:if test="${ac.pageNum > 1}">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/show_article_more.do?pageNum=${ac.prePage}&id=${acc.id}">上一页</a>
                    </li>
                </c:if>
                <c:if test="${ac.pageNum != ac.pages}">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/show_article_more.do?pageNum=${ac.nextPage}&id=${acc.id}">下一页</a>
                    </li>
                </c:if>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/show_article_more.do?pageNum=${ac.pages}&id=${acc.id}">尾页</a>
                </li>
                <%--                <li>总页数${pageInfo.pages}</li>--%>
                <%--                <li>总记录数${pageInfo.total}</li>--%>
            </ul>
        </div>
    </nav>
</div>
</body>
</html>
