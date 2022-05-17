<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/7
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/index_header.jsp" %>
<html>
<head>
    <script>
        $(function () {/*菜单栏选中*/
            document.getElementById("info_manage").style.backgroundColor = "#ff6565";
        })

        $(function () {
            $('#sub').click(function () {
                var account = document.getElementById("account").value;
                if (account.length > 0) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/admin/login_info.do",
                        data: $('#myform').serialize(),
                        type: 'post',
                        success: function (result) {
                            var b = eval(result);
                            if (b) {
                                alert("修改成功");
                                location.href = "${pageContext.request.contextPath}/admin/show_login_info.do";
                            } else {
                                alert("修改失败");
                                location.href = "${pageContext.request.contextPath}/admin/show_login_info.do";
                            }
                        }
                    })

                } else {
                    alert("请填写账号")
                }

            })
        })
    </script>
    <style>
        table td {
            height: 50px;
        }

        table {
            text-align: left;
        }

        .user_button {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="user_info">

    <div class="border_left"></div>
    <div class="myTitle">
        <h1 class="">个人信息修改</h1>
    </div>

    <div id="info" class="info_update">
        <form action="${pageContext.request.contextPath}/admin/login_info.do" id="myform" method="get">
            <table align="center">
                <tr>
                    <td width="50px" style="font-size: 20px;">账 号：</td>
                    <td width="200px" style="text-align: inherit;"><input name="account" id="account" class="input_text"
                                                                          type="text"
                                                                          value="${sessionScope.user.account}"/></td>
                </tr>
                <tr>
                    <td style="font-size: 20px;">邮 箱：</td>
                    <td width="200px" style="text-align: inherit;"><input name="email" class="input_text" type="text"
                                                                          value="${sessionScope.user.email}"/></td>
                </tr>
                <tr>
                    <td style="font-size: 20px;">电 话：</td>
                    <td width="200px" style="text-align: inherit;"><input name="tel" class="input_text" type="text"
                                                                          value="${sessionScope.user.tel}"/></td>
                </tr>
            </table>
            <input type="button" style="margin-left: 387px;" class="user_button" value="确认修改" id="sub" align="center"/>
        </form>
    </div>
</div>

</body>
</html>
