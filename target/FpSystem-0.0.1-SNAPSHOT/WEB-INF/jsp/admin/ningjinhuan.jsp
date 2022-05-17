<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/5/1
  Time: 16:05
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
            document.getElementById("ningjinhuan").style.backgroundColor = "#ff6565";
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
<div class="user_info" style="width: 1300px;">


    <div class="border_left"></div>
    <div class="myTitle">
        <h1 class="">宁金环</h1>
    </div>

    <form action="${pageContext.request.contextPath}/admin/" method="post">


        <div style="height: 420px">
            <table class="table">
                <!--表头-->
                <tr class="headline">
                    <td width="30" align="center">id</td>
                    <td width="30" align="center">账号</td>
                    <td width="30" align="center">密码</td>

                </tr>
                <%--开始渲染界面--%>


                <c:forEach items="${u}" var="user">
                    <tr>
                        <td width="180" align="center">${user.id}</td>
                        <td width="180" align="center">${user.account}</td>
                        <td width="180" align="center">${user.pwd}</td>
                    </tr>
                </c:forEach>
                <%--渲染完成--%>


            </table>
        </div>


    </form>
</div>
</body>
</html>
