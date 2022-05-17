<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link href="${pageContext.request.contextPath}/style/css/index01.css" rel="stylesheet" type="text/css"/>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/core.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/home.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/login_user.css">

    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/style/js/layer/mobile/need/layer.css">
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/style/js/layer/theme/default/layer.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery-2.0.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/layer/layer.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/index01.css">
    <script language="javascript" type="text/javascript">

        /*

                $(function(){
                    if ($User.id!=null && $User.id != "") {
                        $('.login_off').hide();
                    }
                })
        */
    </script>

</head>

<body>

<div class="headDiv">

    <img alt="logo" src="${pageContext.request.contextPath }/style/imags/blackfplogo.png" class="logo">
    <a href="${pageContext.request.contextPath }/index.jsp" class="logo"></a>

    <div class="nav">
        <ul>
            <%--         <li><a href="${pageContext.request.contextPath }/admin/index.do" >首页</a></li>--%>


            <%--         <li><a href="${pageContext.request.contextPath }/zixun.jsp" >扶贫资讯</a></li>
                     <li><a href="${pageContext.request.contextPath }/pkInfo.jsp" >贫困信息</a></li>
                     <li><a href="${pageContext.request.contextPath }/we.jsp" >我们在路上</a></li>
                     <li><a href="${pageContext.request.contextPath }/pkSale.jsp" >贫困电商</a></li>
                     <li><a href="${pageContext.request.contextPath }/pay/show_pay.do" >公益捐赠</a></li>--%>
            <li><a href="${pageContext.request.contextPath }/admin/pkAbout.do">首页</a></li>
            <li><a href="${pageContext.request.contextPath }/admin/connect.do">扶贫对接</a></li>
            <li><a href="${pageContext.request.contextPath }/admin/public_donation.do">抚平公募</a></li>


        </ul>
    </div>
    <div class="user">
        <c:choose>
            <c:when test="${user.id != null}">
                <div class="login_off">
                    <a href="${pageContext.request.contextPath}/admin/login_user.do" style="padding: 0px">个人中心&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</a><a
                        href="${pageContext.request.contextPath}/admin/exit.do" style="padding: 0px"> [退出]</a>
                        <%--               <a href= "${pageContext.request.contextPath}/admin/login_index.do" >个人中心 |</a><a href="${pageContext.request.contextPath}/admin/exit.do"> [退出]</a>--%>
                        <%--    <li>欢迎登录:${sessionScope.user.account} <a href="${pageContext.request.contextPath}/admin/exit.do"?url="${requestScope['javax.servlet.forward.request_uri']}">[退出]</a></li>--%>
                </div>
            </c:when>
            <c:otherwise>
                <div class="login">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/admin/login.do">登录</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/register.do">注册</a></li>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>