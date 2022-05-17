<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/29
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/index_header.jsp" %>
<html>
<head>
    <title>捐赠管理</title>

    <script>
        $(function () {/*菜单栏选中*/
            document.getElementById("donations_manage").style.backgroundColor = "#ff6565";
        })
    </script>
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

        .bt {
            width: 60px;
            height: 32px;
            /*background-color: #e4e4e5;*/
            border: 0 none;
            border-radius: 0 4px 4px 0;
            background: #e4e4e5;;

        }
    </style>
</head>
<body>
<div class="user_info" style="width: 1255px;">


    <div class="border_left"></div>
    <div class="myTitle">
        <h1 class="">捐赠管理</h1>
    </div>

    <form action="${pageContext.request.contextPath}/admin/donations_manage_search.do" method="post">
        <div class="search" style="display: inline-block;float: right; margin-right: 87px;margin-bottom: 30px">

            <select name="articleClass" id="articleClass" style="height: 32px">
                <option value="">请选择文章分类</option>
                <c:forEach items="${acc}" var="acc">
                    <option value="${acc.className}">${acc.className}</option>
                </c:forEach>
            </select>

            <input type="text" style="height: 24px" name="subject" value="${subject_select}" placeholder="请输入项目名称">
            <input type="text" style="height: 24px" name="user_account" value="${account_select}"
                   placeholder="请输入项目所属人账号">
            <input type="submit" class="bt" value="搜 素">
        </div>


        <div style="height: 420px">
            <table class="table">
                <!--表头-->
                <tr class="headline">
                    <td width="170" align="center">订单编号</td>
                    <td width="270" align="center">项目名称</td>
                    <td width="100" align="center">支持金额</td>
                    <td width="100" align="center">类别</td>
                    <td width="100" align="center">捐赠人</td>
                    <td width="80" align="center">状态</td>
                    <td width="180" align="center">时间</td>

                </tr>
                <%--            <c:forEach items="${order.list}" var="order">--%>
                <c:forEach items="${order.list}" var="order">
                    <tr class="tr_body">
                        <!--在表格中显示会员的信息-->
                        <td align="center">
                            <div class="td_hidden_div">${order.out_trade_no}</div>
                        </td>
                        <td align="center">
                            <div class="td_hidden_div"><a
                                    href="${pageContext.request.contextPath}/admin/pkAbout.do">${order.subject}</a>
                            </div>
                        </td>
                        <td align="center">${order.total_amount}</td>

                        <td align="center">
                            <div class="td_hidden_div">${order.articleClass}</div>
                        </td>
                        <td align="center">
                            <div class="td_hidden_div">${order.user_account}</div>
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
                        <td align="center"></td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <!--分页-->
        <nav aria-label="Page navigation">
            <div id="pages" style="margin-left: 350px">

                <ul class="pagination">
                    <li><a href="#" class="current_page">当前页码：${order.pageNum} 总页数: ${order.pages}  </a></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/donations_manage_search.do?pageNum=1&articleClass=${articleClass}&subject=${subject_select}&user_account=${account_select}">首页</a>
                    </li>
                    <c:if test="${order.pageNum > 1}">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/donations_manage_search.do?pageNum=${order.prePage}&articleClass=${articleClass}&subject=${subject_select}&user_account=${account_select}">上一页</a>
                        </li>
                    </c:if>
                    <c:if test="${order.pageNum != order.pages}">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/donations_manage_search.do?pageNum=${order.nextPage}&articleClass=${articleClass}&subject=${subject_select}&user_account=${account_select}">下一页</a>
                        </li>
                    </c:if>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/donations_manage_search.do?pageNum=${order.pages}&articleClass=${articleClass}&subject=${subject_select}&user_account=${account_select}">尾页</a>
                    </li>
                    <%--                <li>总页数${pageInfo.pages}</li>--%>
                    <%--                <li>总记录数${pageInfo.total}</li>--%>
                </ul>
            </div>
        </nav>


    </form>
</div>
</body>
</html>
