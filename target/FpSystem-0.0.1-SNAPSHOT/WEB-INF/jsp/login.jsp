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
                                alert("登录成功");
                                location.href = "${pageContext.request.contextPath }/admin/login_user.do"

                            } else if (!b) {
                                alert("登录失败，请重新登录");
                                location.href = "${pageContext.request.contextPath }/admin/login.do"
                            } else {
                                alert("验证码错误,请重新登录");
                                location.href = "${pageContext.request.contextPath }/admin/login.do"
                            }
                        }
                    })
                } else {
                    alert("账号、密码或验证码未输入")
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
            <li><a href="${pageContext.request.contextPath }/admin/index.do">首页</a></li>
            <%--         <li><a href="${pageContext.request.contextPath }/zixun.jsp" >扶贫资讯</a></li>
                     <li><a href="${pageContext.request.contextPath }/pkInfo.jsp" >贫困信息</a></li>
                     <li><a href="${pageContext.request.contextPath }/we.jsp" >我们在路上</a></li>
                     <li><a href="${pageContext.request.contextPath }/pkSale.jsp" >贫困电商</a></li>
                     <li><a href="${pageContext.request.contextPath }/pay/show_pay.do" >公益捐赠</a></li>--%>
            <li><a href="${pageContext.request.contextPath }/admin/pkAbout.do">公益捐赠</a></li>
            <li><a href="${pageContext.request.contextPath }/admin/connect.do">扶贫对接</a></li>
            <li><a href="${pageContext.request.contextPath }/admin/public_donation.do">抚平公募</a></li>
        </ul>
    </div>
</div>


<div class="login_rg">

    <div class="login-top">
        <div class="log_reg">
            <div class="login_info">${loginInfo}</div>
            <h1>
                <a href="${pageContext.request.contextPath}/admin/login.do">登 入</a>|
                <a href="${pageContext.request.contextPath}/admin/register.do">注 册</a>
            </h1>
        </div>
        <form action="${pageContext.request.contextPath}/admin/" id="login_form" method="get">
            <div class="loginTab_box">
                <table>
                    <tr>
                        <td><input align="center" id="account" name="account" class="userName" type="text"
                                   placeholder='用 户 名'></td>
                    </tr>

                    <tr>
                        <td><input class="pwd" id="pwd" name="pwd" type="password" placeholder="******"></td>
                        <!-- "if (this.value == '') {this.value = 'password';} -->
                    </tr>

                    <tr>
                        <td><input class="check" name="check" id="check" type="text" placeholder="验 证 码">
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
                <input type="button" class="login_ajax" value="登   录">
            </div>
        </form>
    </div>

    </form>
</div>
</body>
</html>