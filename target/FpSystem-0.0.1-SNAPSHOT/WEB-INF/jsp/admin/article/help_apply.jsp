<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/4/1
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../../include/index_header.jsp" %>
<html>

<head>
    <title>需求审核</title>
    <script>
        $(function () {/*菜单栏选中*/
            document.getElementById("help_attestation").style.backgroundColor = "#ff6565";
        })
    </script>
    <style>
        .tr_body:hover { /*我的捐赠表格*/
            background-color: #ddd;
        }

        .table {
            width: 1000px;
            margin-left: 50px;

            table-layout: fixed;
            text-align: center;
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

        table tr {
            height: 40px;
        }

        .search {
            margin-right: 45px;
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
<div class="user_info">


    <div class="border_left"></div>
    <div class="myTitle">
        <h1 class="">需求审核</h1>
    </div>

    <form action="${pageContext.request.contextPath}/admin/show_help_apply.do" method="post">
        <div class="search" style="display: inline-block;float: right;margin-bottom: 30px">
            <input type="text" style="height: 27px" name="s_title" value="${s_title}" placeholder="请输入项目标题">
            <input class="bt" type="submit" value="搜 素">

        </div>

        <div style="height: 520px">
            <table class="table">
                <!--表头-->
                <tr class="headline">

                    <td width="60" align="center">账号</td>
                    <td width="100" align="center">标题</td>
                    <td width="100" align="center">目标金额</td>
                    <td width="130" align="center">分类</td>
                    <td width="70" align="center">认证相片</td>
                    <td width="200" align="center">情况说明</td>
                    <td width="100" align="center">时间</td>
                    <td width="100" align="center">操作</td>

                </tr>
                <%--            <c:forEach items="${order.list}" var="order">--%>
                <c:forEach items="${ac.list}" var="ac">
                    <tr class="tr_body">
                        <!--在表格中显示会员的信息-->
                        <c:forEach items="${users}" var="users">
                            <c:if test="${users.id == ac.user_id}">
                                <td align="center">
                                    <div class="td_hidden_div">${users.account}</div>
                                </td>
                            </c:if>
                        </c:forEach>
                        <td align="center">
                            <div class="td_hidden_div">${ac.title}</div>
                        </td>
                        <td align="center">
                            <div class="td_hidden_div">${ac.target}</div>
                        </td>
                        <c:forEach items="${acc}" var="acc">
                            <c:if test="${ac.articleClass_id == acc.id}">
                                <td>
                                    <div class="td_hidden_div">${acc.className}</div>
                                </td>
                            </c:if>
                        </c:forEach>
                        <td align="center">
                            <img width="60px" height="40px" src="${ac.img}">
                        </td>
                        <td align="center">
                            <div class="td_hidden_div">${ac.content}</div>
                        </td>

                        <td class="address" align="center">
                            <div class="td_hidden_div">${ac.addTime}</div>
                        </td>
                        <td align="center"><a
                                href="${pageContext.request.contextPath}/admin/help_article_apply_more.do?id=${ac.id}">审核</a>
                        </td>
                    </tr>

                </c:forEach>
            </table>
        </div>

        <!--分页-->
        <nav aria-label="Page navigation">
            <div id="pages" style="margin-left: 350px">

                <ul class="pagination">
                    <li><a href="#" class="current_page">当前页码：${ac.pageNum} 总页数: ${ac.pages}  </a></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/show_help_apply.do?pageNum=1&s_title=${s_title}">首页</a>
                    </li>
                    <c:if test="${ac.pageNum > 1}">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/show_help_apply.do?pageNum=${ac.prePage}&s_title=${s_title}">上一页</a>
                        </li>
                    </c:if>
                    <c:if test="${ac.pageNum != ac.pages}">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/show_help_apply.do?pageNum=${ac.nextPage}&s_title=${s_title}">下一页</a>
                        </li>
                    </c:if>
                    <c:if test="${ac.pageNum != ac.pages}">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/show_help_apply.do?pageNum=${ac.pages}&s_title=${s_title}">尾页</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>

    </form>
</div>


</body>
</html>
