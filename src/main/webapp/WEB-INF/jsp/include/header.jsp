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
            <%--        <li><a href="${pageContext.request.contextPath }/admin/index.do" >??????</a></li>--%>
            <li><a href="${pageContext.request.contextPath }/admin/pkAbout.do">??????</a></li>
            <li><a href="${pageContext.request.contextPath }/admin/connect.do">????????????</a></li>
            <li><a href="${pageContext.request.contextPath }/admin/public_donation.do">????????????</a></li>

        </ul>
    </div>
    <div class="user">
        <%--   <div class= "login" >--%>
        <%--        <ul>--%>
        <%--            <li><a href= "${pageContext.request.contextPath}/login.jsp" >??????</a></li>--%>
        <%--            <li><a href= "${pageContext.request.contextPath}/register.jsp" >??????</a></li>--%>
        <%--        </ul>--%>
        <%--   </div>--%>
        <div class="login_off">
            <ul>
                <li><span>????????????:${sessionScope.user.account} &nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp</span><a style=""
                                                                                                     href="${pageContext.request.contextPath}/admin/exit.do">[???
                    ???]</a></li>
                <%--    <li>????????????:${sessionScope.user.account} <a href="${pageContext.request.contextPath}/admin/exit.do"?url="${requestScope['javax.servlet.forward.request_uri']}">[??????]</a></li>--%>

            </ul>
        </div>
    </div>
</div>