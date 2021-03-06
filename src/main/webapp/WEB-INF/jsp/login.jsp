<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery-2.0.0.min.js"></script>
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/style/js/layer/mobile/need/layer.css">
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/style/js/layer/theme/default/layer.css">
    <script type="text/javascript" rel="stylesheet"
            src="${pageContext.request.contextPath}/style/js/layer/layer.js"></script>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/index01.css">
    <link href="${pageContext.request.contextPath}/style/css/login.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery-2.0.0.min.js"></script>
    <script language="javascript" type="text/javascript">


        $(function () {
            $(".login_ajax").click(function () {
                var a = document.getElementById("account").value;
                var p = document.getElementById("pwd").value;
                var c = document.getElementById("check").value;
                if (a.length > 0 && p.length > 0 && c.length > 0) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/admin/login_index.do",
                        data: $('#login_form').serialize(),
                        // dataType:'text',
                        type: 'post',
                        success: function (result) {
                            var b = eval(result);
                            if (b == true) {
                                alert("????????????");
                                location.href = "${pageContext.request.contextPath }/admin/login_user.do"

                            } else if (!b) {
                                alert("??????????????????????????????");
                                location.href = "${pageContext.request.contextPath }/admin/login.do"
                            } else {
                                alert("???????????????,???????????????");
                                location.href = "${pageContext.request.contextPath }/admin/login.do"
                            }
                        }
                    })
                } else {
                    alert("????????????????????????????????????")
                    location.href = "${pageContext.request.contextPath }/admin/login.do"
                }
            })
        })


        $(function () {
            $("#code").click(function () {
                $("#code").attr("src", "${pageContext.request.contextPath}/admin/code.do?t=" + new Date().getTime());
            })
        })


    </script>
</head>
<body>


<div class="headDiv">

    <img alt="logo" src="${pageContext.request.contextPath }/style/imags/blackfplogo.png" class="logo">
    <a href="${pageContext.request.contextPath }/index.jsp" class="logo"></a>

    <div class="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath }/admin/index.do">??????</a></li>
            <%--         <li><a href="${pageContext.request.contextPath }/zixun.jsp" >????????????</a></li>
                     <li><a href="${pageContext.request.contextPath }/pkInfo.jsp" >????????????</a></li>
                     <li><a href="${pageContext.request.contextPath }/we.jsp" >???????????????</a></li>
                     <li><a href="${pageContext.request.contextPath }/pkSale.jsp" >????????????</a></li>
                     <li><a href="${pageContext.request.contextPath }/pay/show_pay.do" >????????????</a></li>--%>
            <li><a href="${pageContext.request.contextPath }/admin/pkAbout.do">????????????</a></li>
            <li><a href="${pageContext.request.contextPath }/admin/connect.do">????????????</a></li>
            <li><a href="${pageContext.request.contextPath }/admin/public_donation.do">????????????</a></li>
        </ul>
    </div>
</div>


<div class="login_rg">

    <div class="login-top">
        <div class="log_reg">
            <div class="login_info">${loginInfo}</div>
            <h1>
                <a href="${pageContext.request.contextPath}/admin/login.do">??? ???</a>|
                <a href="${pageContext.request.contextPath}/admin/register.do">??? ???</a>
            </h1>
        </div>
        <form action="${pageContext.request.contextPath}/admin/" id="login_form" method="get">
            <div class="loginTab_box">
                <table>
                    <tr>
                        <td><input align="center" id="account" name="account" class="userName" type="text"
                                   placeholder='??? ??? ???'></td>
                    </tr>

                    <tr>
                        <td><input class="pwd" id="pwd" name="pwd" type="password" placeholder="******"></td>
                        <!-- "if (this.value == '') {this.value = 'password';} -->
                    </tr>

                    <tr>
                        <td><input class="check" name="check" id="check" type="text" placeholder="??? ??? ???">
                            ${cd}
                            <div class="ckpt">
                                <img width="100px" id="code" height="50px"
                                     src="${pageContext.request.contextPath}/admin/code.do" title="img" alt="img"/>
                            </div>
                        </td>
                    </tr>

                </table>
            </div>

            <div class="forgot">
                <input type="button" class="login_ajax" value="???   ???">
            </div>
        </form>
    </div>

    </form>
</div>
</body>
</html>