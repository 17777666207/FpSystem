<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/2
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/index01.css">
    <link href="${pageContext.request.contextPath}/style/css/login.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery-2.0.0.min.js"></script>
    <style>
        .login_error_info {
            padding-left: 25px;
            width: 350px;
        }

        .t_reg td {
            margin: 0px 0px 16px 0px;
        }


    </style>
    <script>

        /*
            需求：
                1.新建一个表单
                2.当鼠标进入输入框，提示规则
                3.用户输入完毕(keyup,blur),验证是否满足规律
        */

        // Email框部分
        // 2. 注册 focus 事件

        // var accountInput = document.querySelector('#acc');
        /* emailInput.onfocus = function () {
            var value = emailInput.value.trim()
            var next = this.nextElementSibling
            // 只有当用户没有输入的时候，提示规则
            if (value.length !== 0) return;
            // 显示提示
            next.innerHTML = '请输入6-18位的数字、字母、_,需要以字母开头'
        }*/

        /*账号*/
        function account_check() {

            var value = document.getElementById("acc").value;
            // var next = this.nextElementSibling
            // 验证长度
            if ((value.length > 0 && value.length < 4) || value.length > 10) {//错误
                // next.innerHTML = '<span style="color:red">用户名长度为6~18</span>'
                document.getElementById("acc_info").style.color = "#ff0000";
                document.getElementById("acc_info").textContent = "4-10位的字母、数字和下划线";
            } else if (value.length >= 4 && value.length <= 10) {//正确
                // document.getElementById("acc_info").style.color="#000000";
                document.getElementById("acc_info").removeAttribute("style");
                document.getElementById("acc_info").textContent = "✔";
            } else {//清空输入
                document.getElementById("acc_info").removeAttribute("style");
            }
        }

        /*密码*/
        function pwd_check() {

            var value = document.getElementById("pwd").value;
            // 验证长度
            if (/^[a-zA-Z]/.test(value)) {//以字母开头
                if ((value.length > 0 && value.length < 4) || value.length > 20) {//错误
                    // next.innerHTML = '<span style="color:red">用户名长度为6~18</span>'
                    document.getElementById("pwd_info").style.color = "#ff0000";
                    document.getElementById("pwd_info").textContent = "4位以上的字母开头，数字、下划线";
                } else if (value.length >= 4 && value.length <= 20) {//正确
                    // document.getElementById("acc_info").style.color="#000000";
                    document.getElementById("pwd_info").removeAttribute("style");
                    document.getElementById("pwd_info").textContent = "✔";
                } else {//清空输入
                    document.getElementById("pwd_info").removeAttribute("style");
                }
            } else if (!/^[a-zA-Z]/.test(value)) {//不以字母开头
                document.getElementById("pwd_info").style.color = "#ff0000";
                document.getElementById("pwd_info").textContent = "4位以上的字母开头，数字、下划线";
            } else {
                document.getElementById("pwd_info").removeAttribute("style");
            }
        }

        function tel_check() {
            var value = document.getElementById("tel").value;
            // 验证 以1开头，第2位是3，5，8，总共11位数字

            if (value.length > 0 && !/^[1]+[3,5,7,8]3578+\d{9}$/.test(value) && value.length !== 11) {
                console.log("couwu")
                console.log(value.length)
                document.getElementById("tel_info").style.color = "#ff0000";
                document.getElementById("tel_info").textContent = "长度为11位的纯数字";
            } else if (/^[1][3,4,5,7,8][0-9]{9}$/.test(value) & value.length == 11) {//正确
                console.log(value.length)
                document.getElementById("tel_info").removeAttribute("style");
                document.getElementById("tel_info").textContent = "✔";
            } else {

                document.getElementById("tel_info").removeAttribute("style");
            }
        }

        function email_check() {
            var value = document.getElementById("email").value;
            // 验证 以1开头，第2位是3，5，8，总共11位数字
            if (value.length > 0 && !/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value)) {
                // if (value.length>0 && !/^[a-z0-9]+([._\\\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]$/.test(value)) {

                console.log("1")
                document.getElementById("email_info").style.color = "#ff0000";
                document.getElementById("email_info").textContent = "长度为11位的纯数字";
            } else if (/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value)) {//正确
                console.log("2")
                document.getElementById("email_info").removeAttribute("style");
                document.getElementById("email_info").textContent = "✔";
            } else {
                console.log("3")
                document.getElementById("email_info").removeAttribute("style");
            }
        }

        //
        //     /*// 验证字母开头
        //     if (!/^[a-zA-Z]/.test(value)) {
        //         next.innerHTML = '<span style="color:red">要以字母开头</span>'
        //         return
        //     }*/
        //
        //     // 验证是否数字、字母、_组成
        //     if (!/\w{2,9}/.test(value)) {
        //         // next.innerHTML = '<span style="color:red">用户名由数字、字母、_组成</span>'
        //         /*hender*/
        //         return
        //     }
        //
        //
        //     next.innerHTML = '验证通过'
        // }
        //
        //
        // // Password框部分
        //
        // var pwdInput = document.querySelector('#pwd');
        // pwdInput.onfocus = function () {
        //     var value = pwdInput.value.trim()
        //     var next = this.nextElementSibling
        //     // 只有当用户没有输入的时候，提示规则
        //     if (value.length !== 0) return;
        //     // 显示提示
        //     next.innerHTML = '请输入不少于6位的密码'
        // }
        //
        //
        // // 验证长度
        // pwdInput.onkeyup = function () {
        //     var value = pwdInput.value.trim()
        //     var next = this.nextElementSibling
        //
        //     if (value.length < 6) {
        //         next.innerHTML = '<span style="color:red">密码长度小于6位!</span>'
        //         return
        //     }
        //     next.innerHTML = '验证通过'
        //
        // }
        //
        //
        // // phone框部分
        // var phoneInput = document.querySelector('#phone');
        // phoneInput.onfocus = function () {
        //     var value = phoneInput.value.trim()
        //     var next = this.nextElementSibling
        //     // 只有当用户没有输入的时候，提示规则
        //     if (value.length !== 0) return;
        //     // 显示提示
        //     next.innerHTML = '请输入11位的手机号码'
        // }
        //
        // phoneInput.onkeyup = function () {
        //     var value = phoneInput.value.trim()
        //     var next = this.nextElementSibling
        //     // 验证 以1开头，第2位是3，5，8，总共11位数字
        //     if (!/^[1]+[3,5,8]+\d{9}$/.test(value)) {
        //         next.innerHTML = '<span style="color:red">手机号码格式错误</span>'
        //         return
        //     }
        //     next.innerHTML = '验证通过'

        // }

        $(function () {
            $(".login_ajax").click(function () {
                var a = document.getElementById("acc").value;
                var p = document.getElementById("pwd").value;
                var e = document.getElementById("email").value;
                var t = document.getElementById("tel").value;
                if (a.length > 0 && p.length > 0 && e.length > 0 && t.length > 0) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/admin/registerUser.do",
                        data: $('.register_form').serialize(),
                        type: 'post',
                        success: function (result) {
                            var b = eval(result);
                            if (b) {
                                alert("注册成功，请返回登录");
                                location.href = "${pageContext.request.contextPath }/admin/login.do"
                            } else {
                                alert("注册失败，请重新注册");
                                location.href = "${pageContext.request.contextPath }/admin/register.do"
                            }
                        }
                    })
                } else {
                    alert("请输入全部信息")
                }
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

    <%--        <div class="lg_img" >--%>
    <%--            <img style="object-fit: cover;width: 100%;height: 100%" src="${pageContext.request.contextPath }/style/imags/pkhouse.jpg">--%>
    <%--        </div>--%>


    <div class="register-top">
        <div class="log_reg">
            <h1>
                <a href="${pageContext.request.contextPath}/admin/login.do">登 入</a>|
                <a href="${pageContext.request.contextPath}/admin/register.do">注 册</a>
            </h1>
        </div>
        <form action="${pageContext.request.contextPath}/admin/registerUser.do" class="register_form" method="get">
            <table class="t_reg" align="center">
                <tr>
                    <%--<td class="login_info">账 号：</td>
                    <td ><input  class= "userName_reg" name="account" type="text" placeholder = "20长度的字母、数字和下划线"/></td>
                    <td class="login_error_info">20长度的字母、数字和下划线</td>&ndash;%&gt;--%>
                    <td class="login_info">账 号：</td>
                    <td><input name="account" id="acc" onkeyup="account_check();" placeholder="10长度字母、数字和下划线"/></td>
                    <td class="login_error_info" id="acc_info">4-10位的字母、数字和下划线</td>
                </tr>

                <tr>
                    <td class="login_info">密 码：</td>
                    <td><input class="pwd_reg" name="pwd" id="pwd" type="password" onkeyup="pwd_check();"
                               placeholder="***"/></td>
                    <td class="login_error_info" id="pwd_info">4位以上的字母开头，数字、下划线</td>
                </tr>

                <tr>
                    <td class="login_info">邮 箱：</td>
                    <td><input class="email" name="email" type="text" id="email" onkeyup="email_check();"
                               placeholder="邮 箱"/></td>
                    <td class="login_error_info" id="email_info">请输入正确邮箱格式</td>
                </tr>

                <tr>
                    <td class="login_info">电 话：</td>
                    <td><input class="tel" name="tel" id="tel" type="text" onkeyup="tel_check()"
                               placeholder="长度为11位的纯数字"></td>
                    <td class="login_error_info" id="tel_info">长度为11位的纯数字</td>
                </tr>
            </table>
        </form>
        <div>
            <input type="button" style="margin-left:180px " class="login_ajax" value="注 册">
        </div>
    </div>
</div>

<%-- <div class="lg_bottom"></div>--%>

</body>
</html>
