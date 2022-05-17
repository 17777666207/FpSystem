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
    <script>
        $(function () {/*菜单栏选中*/
            document.getElementById("info_manage").style.backgroundColor = "#ff6565";
        })
    </script>
</head>
<body>
<div class="user_info">
    <div id="info" class="center_box">
        <table class="table table-hover" align="center">
            <!-- On rows -->
            <tr>
                <td>序号</td>
                <td>项目</td>
                <td>金额</td>
                <td>积分</td>
                <td>时间</td>
                <td>来源</td>
            </tr>

            <!-- On cells (`td` or `th`) -->
            <tr>
                <td class="active">1</td>
                <td class="success">2</td>
                <td class="warning">3</td>
                <td class="danger">4</td>
                <td class="info">5</td>
            </tr>

            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
            </tr>

            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
            </tr>
        </table>
    </div>
    <%--    <a onclick="window.open('${pageContext.request.contextPath}/index.jsp')">点击</a>--%>
</div>
</body>
</html>
