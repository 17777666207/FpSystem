<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/8
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/index_header.jsp" %>
<html>
<head>
    <style>

        .tr_body:hover { /*我的捐赠表格*/
            background-color: #ddd;
        }

        .table {
            width: 1000px;
            margin-left: 50px;
        }

        .headline {
            background-color: #ff6565;
        }

        .myTitle {
            margin: 30px 0px 30px 40px;
            width: 1020px;
            /*border-left: #ff6565 solid 3px;*/
            border-bottom: #ddd solid 1px;
        }

        .border_left {
            width: 4px;
            height: 40px;
            float: left;
            margin-right: 20px;
            /*background: #f47306;*/
            background: #ff6565;
            margin-top: 30px;
            margin-left: 30px;
        }
    </style>
    <script>
        $(function () {/*菜单栏选中*/
            document.getElementById("my_join").style.backgroundColor = "#ff6565";
        })
    </script>
</head>
<body>
<div class="user_info">

    <div class="border_left"></div>
    <div class="myTitle">
        <h1 class="">我的捐赠</h1>
    </div>

    <div style="height: 420px">
        <table class="table">
            <!--表头-->
            <tr class="headline">
                <td width="200" align="center">订单编号</td>
                <td width="130" align="center">项目名称</td>
                <td width="100" align="center">支持金额</td>
                <td width="200" align="center">寄语</td>
                <td width="70" align="center">状态</td>
                <td width="140" align="center">时间</td>

            </tr>
            <c:forEach items="${order.list}" var="order">
                <tr class="tr_body">
                    <!--在表格中显示会员的信息-->
                    <td class="address" align="center">
                        <div class="td_hidden_div">${order.out_trade_no}</div>
                    </td>
                    <td class="address" align="center">
                        <div class="td_hidden_div">${order.subject}</div>
                    </td>
                    <td class="address" align="center">
                        <div class="td_hidden_div">${order.total_amount}</div>
                    </td>
                    <td class="address" align="center">
                        <div class="td_hidden_div">${order.body}</div>
                    </td>
                    <c:if test="${order.pay_status == 0}">
                        <td class="address" align="center">未支付</td>
                    </c:if>
                    <c:if test="${order.pay_status == 1}">
                        <td class="address" align="center">已支付</td>
                    </c:if>
                    <td class="address" align="center">
                        <div class="td_hidden_div">${order.addTime}</div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <!--分页-->
    <nav aria-label="Page navigation">
        <div id="pages" style="margin-left: 350px">

            <ul class="pagination">
                <li><a href="#" class="current_page">当前页码：${order.pageNum} 总页数: ${order.pages}  </a></li>
                <li><a href="${pageContext.request.contextPath}/admin/show_join.do?">首页</a></li>
                <c:if test="${order.pageNum > 1}">
                    <li><a href="${pageContext.request.contextPath}/admin/show_join.do?pageNum=${order.prePage}">上一页</a>
                    </li>
                </c:if>
                <c:if test="${order.pageNum != order.pages}">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/show_join.do?pageNum=${order.nextPage}">下一页</a>
                    </li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/admin/show_join.do?pageNum=${order.pages}">尾页</a></li>
            </ul>
        </div>
    </nav>

</div>
</body>
</html>
