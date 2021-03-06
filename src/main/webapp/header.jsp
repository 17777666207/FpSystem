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
            <%--         <li><a href="${pageContext.request.contextPath }/admin/index.do" >??????</a></li>--%>


            <%--         <li><a href="${pageContext.request.contextPath }/zixun.jsp" >????????????</a></li>
                     <li><a href="${pageContext.request.contextPath }/pkInfo.jsp" >????????????</a></li>
                     <li><a href="${pageContext.request.contextPath }/we.jsp" >???????????????</a></li>
                     <li><a href="${pageContext.request.contextPath }/pkSale.jsp" >????????????</a></li>
                     <li><a href="${pageContext.request.contextPath }/pay/show_pay.do" >????????????</a></li>--%>
            <li><a href="${pageContext.request.contextPath }/admin/pkAbout.do">??????</a></li>
            <li><a href="${pageContext.request.contextPath }/admin/connect.do">????????????</a></li>
            <li><a href="${pageContext.request.contextPath }/admin/public_donation.do">????????????</a></li>


        </ul>
    </div>
    <div class="user">
        <c:choose>
            <c:when test="${user.id != null}">
                <div class="login_off">
                    <a href="${pageContext.request.contextPath}/admin/login_user.do" style="padding: 0px">????????????&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</a><a
                        href="${pageContext.request.contextPath}/admin/exit.do" style="padding: 0px"> [??????]</a>
                        <%--               <a href= "${pageContext.request.contextPath}/admin/login_index.do" >???????????? |</a><a href="${pageContext.request.contextPath}/admin/exit.do"> [??????]</a>--%>
                        <%--    <li>????????????:${sessionScope.user.account} <a href="${pageContext.request.contextPath}/admin/exit.do"?url="${requestScope['javax.servlet.forward.request_uri']}">[??????]</a></li>--%>
                </div>
            </c:when>
            <c:otherwise>
                <div class="login">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/admin/login.do">??????</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/register.do">??????</a></li>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>