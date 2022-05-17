<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/5/1
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/index_header.jsp" %>
<html>
<head>
    <title>需求进度</title>
    <style>

        .tr_body:hover { /*我的捐赠表格*/
            background-color: #ddd;
        }

        .table {
            width: 894px;
            margin-left: 53px;
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
            document.getElementById("my_plan").style.backgroundColor = "#ff6565";
        })
    </script>
</head>
<body>
<div class="user_info">

    <div class="border_left"></div>
    <div class="myTitle">
        <h1 class="">需求进度</h1>
    </div>

    <form action="${pageContext.request.contextPath}/admin/my_plan.do" method="post">
        <div class="search" style=" margin-right: 44px; display: inline-block;float: right;margin-bottom: 30px">
            <select style="height: 32px;border: 1px solid #ccc;" name="clear" id="clear">
                <option value="">正在进行</option>
                <option value="0">正在进行</option>
                <option value="1">已完成</option>
                <option value="2">已结算</option>
            </select>

            <input type="text" style="height: 24px" name="title" value="${title}" placeholder="请输入项目名称">
            <input type="submit" class="bt" value="搜 素">
        </div>


        <div style="height: 480px">
            <table class="table">
                <!--表头-->
                <tr class="headline">

                    <td width="300" align="center">项目名称</td>
                    <td width="100" align="center">类别</td>
                    <td width="100" align="center">现总金额</td>
                    <td width="100" align="center">目标金额</td>
                    <td width="80" align="center">状&nbsp态</td>
                    <td width="200" align="center">开始时间</td>

                </tr>
                <%--            <c:forEach items="${order.list}" var="order">--%>
                <c:forEach items="${ac.list}" var="ac">
                    <tr class="tr_body">
                        <!--在表格中显示会员的信息-->
                        <td align="center">
                            <div class="td_hidden_div"><a
                                    href="${pageContext.request.contextPath}/admin/pkAbout.do">${ac.title}</a></div>
                        </td>
                        <td align="center">
                            <div class="td_hidden_div">${ac.articleClass_name.className}</div>
                        </td>
                        <td align="center">
                            <div class="td_hidden_div">${ac.total}</div>
                        </td>
                        <td class="address" align="center">
                            <div class="td_hidden_div">${ac.target}</div>
                        </td>
                        <c:choose>
                            <c:when test="${ac.clear==0}">
                                <td align="center">
                                    <div class="td_hidden_div">正在进行</div>
                                </td>
                            </c:when>
                            <c:when test="${ac.clear==1}">
                                <td align="center">
                                    <div class="td_hidden_div">已完成</div>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td align="center">
                                    <div class="td_hidden_div">已结算</div>
                                </td>
                            </c:otherwise>

                        </c:choose>
                        <td class="address" align="center">
                            <div class="td_hidden_div">${ac.addTime}</div>
                        </td>

                    </tr>
                </c:forEach>
            </table>
        </div>

        <!--分页-->
        <nav aria-label="Page navigation">
            <div id="pages" style="margin-left: 350px">

                <ul class="pagination">
                    <li><a href="#" class="current_page">当前页码：${ac.pageNum} 总页数: ${ac.pages} </a></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/my_plan.do?pageNum=1&title=${title}&clear=${c}">首页</a>
                    </li>
                    <c:if test="${ac.pageNum > 1}">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/my_plan.do?pageNum=${ac.prePage}&title=${title}&clear=${c}">上一页</a>
                        </li>
                    </c:if>
                    <c:if test="${ac.pageNum != ac.pages}">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/my_plan.do?pageNum=${ac.nextPage}&title=${title}&clear=${c}">下一页</a>
                        </li>
                    </c:if>
                    <c:if test="${ac.pageNum != ac.pages}">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/my_plan.do?pageNum=${ac.pages}&title=${title}&clear=${c}">尾页</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>


    </form>
</div>
</body>
</html>
