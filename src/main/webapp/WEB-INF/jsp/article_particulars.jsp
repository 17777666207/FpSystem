<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/30
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>

<%@ include file="../../header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>详情</title>
    <script>
        function sub() {

            if (${sessionScope.user.id ==null}) {
                alert("温馨提示：未登录进行捐赠时，您将无法获取本次捐赠记录");
                location.href = '${pageContext.request.contextPath }/pay/show_pay.do?id=5&article_id=${ac.id}&title=${ac.title}';
            } else {
                location.href = '${pageContext.request.contextPath }/pay/show_pay.do?article_id=${ac.id}&title=${ac.title}';
            }
        }

        $(function () {
            $(".pt").on("click", function () {
                layer.photos({
                    type: 1,
                    photos: '.img_box_p',
                    // anim:0,
                    shade: 0.6,
                    closeBtn: true,
                    area: ["500px"],
                    shadeClose: true,
                })
            })
        })

    </script>
    <style>
        .title {

            width: 200px;
            height: 55px;

            flex-wrap: wrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }


        .body_p {
            flex-wrap: wrap;
            text-overflow: ellipsis;
            overflow: hidden;
            height: 340px;
        }

        .log_div {
            height: 36px;
            width: 80%;
            margin: auto;
        }

        .ul_help { /*帮扶记录ul字体*/
            font-size: 8px;
            padding-top: 10px;
        }

        .img_log { /*帮扶记录头像div*/
            float: left;

        }

        .img_log img {
            height: 35px;
            width: 45px;
            border-radius: 80%;
        }

        .article_m a, .help_log a {
            text-decoration: none;
        }

        .article_m a:hover, .help_log a:hover {
            color: #f47306;
        }

        .pagination li a {
            text-decoration: none;
            color: #999;
            border: 1px solid #e3e0df;
        }

        .pagination li a:hover {
            color: #f47306;
        }

        .pages {
            margin-left: 196px;
            /*margin-top: 205px;*/

        }

    </style>

</head>
<body>
<div class="f_box">
    <div class="border_left_p"></div>
    <div class="return_article">
        <a href="${pageContext.request.contextPath}/admin/pkAbout.do"><< 返回上一页</a>
    </div>


    <div class="content_p">
        <div class="img_box_p">
            <img class="pt" src="${ac.img}" alt="logo"/>
        </div>

        <div class="ac_content_p">
            <li class="title">${ac.title}</li>
            <li>目标金额：${ac.target}</li>
            <li>已帮扶：${total}</li>

            <div class="progress" style="width: 283px;float: left">
                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin=""
                     aria-valuemax="100" style="width: ${plan}%;background-color:#f47306;">
                    <span class="sr-only"> ${plan}%完成</span>
                </div>
                <%--                    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="50" aria-valuemax="100" style="width: ${plan}%;background-color:#f47306">--%>
                <%--                        ${plan}%完成--%>
                <%--                    </div>--%>
            </div>
            <span style="margin-left: 5px">${plan}%完成</span>

            <img onclick="sub();" style="margin-top: 0px"
                 src="${pageContext.request.contextPath }/style/imags/help.PNG">
        </div>

        <div class="logo_p">
            <img alt="logo" src="${pageContext.request.contextPath }/style/imags/blackfplogo.png" class="logo">
        </div>

        <div class="article_m" id="article_m">
            <div>
                <ul class="title_head">
                    <li class="one" style="border-top: 4px solid #f47306;"><a href="javascript:void(0)">需求详情</a></li>
                    <li class="two" onclick="help_log();"
                        style="width: 730px;background-color: #ececec;text-align: left;padding-left: 10px"><a
                            onclick="help_log()" href="javascript:void(0)">帮扶记录</a></li>
                </ul>
            </div>

            <div class="body_p">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${ac.content}

            </div>
        </div>

        <div class="help_log" style="display: none" id="help_log">
            <div>
                <ul class="title_head">
                    <li class="one" id="more" onclick="article_more();" style="border-top: 4px solid #f47306;"><a
                            href="javascript:void(0)">需求详情</a></li>
                    <li class="two" id="log"
                        style="width: 730px;background-color: #ececec;text-align: left;padding-left: 10px"><a
                            href="javascript:void(0)">帮扶记录</a></li>
                    <li style="width: 730px;background-color: #ececec;"></li>
                </ul>
            </div>

            <div class="body_p">
                <div style="height: 280px;">
                    <c:forEach items="${order.list}" var="order">
                        <c:if test="${order.article_id == ac.id && order.pay_status==1}">
                            <div class="log_div">
                                <div class="img_log">
                                    <img src="${pageContext.request.contextPath }/style/imags/fplogo.png">
                                </div>
                                <div>
                                    <ul class="ul_help">
                                        <li style="float:left">
                                            &nbsp&nbsp${order.user_account}
                                        </li>
                                        <li style="text-align: right">
                                            帮扶${order.total_amount}元 &nbsp&nbsp&nbsp${order.addTime}
                                        </li>

                                    </ul>
                                </div>
                            </div>
                            <div class="log_div">
                                <ul class="ul_help" style="float: none">
                                    <li>
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${order.body}
                                    </li>
                                </ul>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <!--分页-->
                <c:if test="${order.pages != 0}">
                    <nav class="f_y" aria-label="Page navigation">
                        <div id="pages" class="pages">

                            <ul class="pagination">
                                <li><a href="#" class="current_page">当前页码：${order.pageNum}&nbsp&nbsp&nbsp&nbsp
                                    共&nbsp&nbsp${order.pages}&nbsp&nbsp页 </a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/show_particulars.do?id=${ac.id}&pageNum=1&fen_ye=1">首页</a>
                                </li>
                                <c:if test="${order.pageNum > 1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/show_particulars.do?pageNum=${order.prePage}&id=${ac.id}&fen_ye=1">上一页</a>
                                    </li>
                                </c:if>
                                <c:if test="${order.pageNum != order.pages}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/show_particulars.do?pageNum=${order.nextPage}&id=${ac.id}&fen_ye=1">下一页</a>
                                    </li>
                                </c:if>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/show_particulars.do?pageNum=${order.pages}&id=${ac.id}&fen_ye=1">尾页</a>
                                </li>
                            </ul>
                        </div>


                    </nav>
                </c:if>
            </div>

        </div>
    </div>
</div>

</body>
</html>
<script>
    function article_more() {/*block显示，none隐藏*/
        document.getElementById("article_m").style.display = "block";
        document.getElementById("help_log").style.display = "none";
    }

    function help_log() {
        document.getElementById("article_m").style.display = "none";
        document.getElementById("more").removeAttribute("style");
        document.getElementById("more").style.backgroundColor = "#ececec";
        document.getElementById("log").style = "border-top: 4px solid #f47306";
        document.getElementById("help_log").style.display = "block";
    }

    $(function () {
        if (${p_n != null}) {
            document.getElementById("article_m").style.display = "none";
            document.getElementById("more").removeAttribute("style");
            document.getElementById("more").style.backgroundColor = "#ececec";
            document.getElementById("log").style = "border-top: 4px solid #f47306";
            document.getElementById("help_log").style.display = "block";

        }
    })
</script>