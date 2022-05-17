<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/4/1
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/index_header.jsp" %>
<html>
<head>
    <title>认证审核</title>
    <script>
        $(function () {/*菜单栏选中*/
            document.getElementById("login_attestation").style.backgroundColor = "#ff6565";
        })
    </script>
    <style>

        .border_left_a {
            width: 4px;
            height: 40px;
            float: left;
            margin-right: 20px;
            /* background: #f47306; */
            background: #ff6565;
            margin-top: 30px;
            margin-left: 30px;
        }

        .myTitle_a {
            margin: 30px 0px 30px 40px;
            width: 1020px;
            /*border-left: #ff6565 solid 3px;*/
            border-bottom: #ddd solid 1px;
        }

        .f_box_a {
            margin: 20px 50px 50px 150px;
        }

        .f_box_a ul {
            margin-bottom: 15px;
        }


    </style>
</head>
<body>

<div class="user_info">

    <div class="border_left_a"></div>
    <div class="myTitle_a">
        <h1 class="">贫困认证中心</h1>
    </div>

    <div style="margin-left: 40px">
        <span style="font-size: 18px">
            审核通过
        </span>
    </div>

</div>


</body>
</html>
