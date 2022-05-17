<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">

    <link href="${pageContext.request.contextPath}/style/css/login.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery-2.0.0.min.js"></script>
    <%--<script language="javascript" type="text/javascript">
            $(function(){
                $(".login_ajax").click(function(){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/admin/login_index.do",
                        data:$(".login_form").serialize(),
                        type:"post",
                        success:function(result){
                            //console.log(result)
                            //var b = eval(result);
                            if (result){
                                alert("登录成功");
                                console.log("123")
                                location.href= "${pageContext.request.contextPath }/index.jsp"
                                console.log("456")
                            }else {
                                alert("登录失败，请重新登录");
                                location.href= "${pageContext.request.contextPath }/index01.jsp"
                            }
                        }
                    })
                })
            })
        </script>--%>
    <script language="javascript" type="text/javascript">

        $
    </script>

</head>
<body>

<div class="login">

    <div class="login-top">
        <div class="log_reg">
            <div class="login_info">${loginInfo}</div>
            <h1>
                <a href="login.jsp">登 入</a>|
                <a href="register.jsp">注 册</a>
            </h1>
        </div>
        <form action="${pageContext.request.contextPath}/admin/login_index.do" class="login_form" method="get">
            <table>
                <tr>
                    <%--  <td><input align="center" class = "userName" type="text" value="用户名" onFocus="this.value = '';" onBlur="this.value = '用户名'"></td>--%>
                    <td><input align="center" name="account" class="userName" type="text" placeholder='用 户 名'></td>
                </tr>

                <tr>
                    <td><input class="pwd" name="pwd" type="password" placeholder="******"></td>
                    <!-- "if (this.value == '') {this.value = 'password';} -->
                </tr>

                <tr>
                    <td><input class="check" type="text" placeholder="验 证 码">
                        <div class="ckpt">
                            <%--							 <img width="100px" height="50px" src="${pageContext.request.contextPath}/admin/code.do"  title="img" alt="img"/>--%>
                        </div>
                        <img src="" alt="asd"/>
                    </td>
                </tr>


            </table>
            <%--<input align="center" class = "userName" type="text" value="用户名" onFocus="this.value = '';" onBlur="this.value = '用户名'">
            <input  class = "pwd" type="password" value="密码123" onFocus="this.value = '';" onBlur="this.value = '密码123'">
            <input  class = "check" type = "text" value = "验证码" onFocus="this.value = '';" onblur="this.value = '验证码'" >
            <div class = "ckpt"></div>--%>

            <div class="forgot">
                <a href="#">忘记密码？</a>
                <input type="submit" class="login_ajax" value="登 录">
            </div>
    </div>

    <div class="return"><a href="${pageContext.request.contextPath}/index.jsp">返 回</a></div>

    </form>
</div>
</body>
</html>