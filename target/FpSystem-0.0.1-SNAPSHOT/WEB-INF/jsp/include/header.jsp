<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link href="${pageContext.request.contextPath}/style/css/index01.css" rel="stylesheet" type="text/css"/>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>

    <!--  <link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed"> -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/home.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/login_user.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/index01.css">
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/style/js/layer/mobile/need/layer.css">
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/style/js/layer/theme/default/layer.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/layer/layer.js"></script>

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
            <%--        <li><a href="${pageContext.request.contextPath }/admin/index.do" >首页</a></li>--%>
            <li><a href="${pageContext.request.contextPath }/admin/pkAbout.do">首页</a></li>
            <li><a href="${pageContext.request.contextPath }/admin/connect.do">扶贫对接</a></li>
            <li><a href="${pageContext.request.contextPath }/admin/public_donation.do">抚平公募</a></li>

        </ul>
    </div>
    <div class="user">
        <%--   <div class= "login" >--%>
        <%--        <ul>--%>
        <%--            <li><a href= "${pageContext.request.contextPath}/login.jsp" >登录</a></li>--%>
        <%--            <li><a href= "${pageContext.request.contextPath}/register.jsp" >注册</a></li>--%>
        <%--        </ul>--%>
        <%--   </div>--%>
        <div class="login_off">
            <ul>
                <li><span>欢迎登录:${sessionScope.user.account} &nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp</span><a style=""
                                                                                                     href="${pageContext.request.contextPath}/admin/exit.do">[退
                    出]</a></li>
                <%--    <li>欢迎登录:${sessionScope.user.account} <a href="${pageContext.request.contextPath}/admin/exit.do"?url="${requestScope['javax.servlet.forward.request_uri']}">[退出]</a></li>--%>

            </ul>
        </div>
    </div>
</div>