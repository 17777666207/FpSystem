<%@ include file="../include/index_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    /*菜单栏选中*/
    $(function () {
        document.getElementById("info_index").style.backgroundColor = "#ff6565";
    })

    $(function () {
        $('#sub').click(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/login_info.do",
                data: $('#myform').serialize(),
                type: 'post',
                success: function (result) {
                    // console.log(result)
                    var b = eval(result);
                    if (b) {
                        alert("修改成功");
                        location.href = "${pageContext.request.contextPath}/admin/show_login_info.do";
                    } else {
                        alert("修改失败");
                        location.href = "${pageContext.request.contextPath}/admin/login_index.do";
                    }
                }
            })
        })
    })

</script>
<style>
    table {
        height: 100px;
    }

    table td {
        width: 136px;
        height: 20px;
    }

    table tr {
        height: 10px;
    }
</style>

<div class="user_info">
    <%--<div id="info">
        <form action="${pageContext.request.contextPath}/admin/login_info.do" id="myform" method="get">
        <table align="center">
            <tr >
                <td><img src="" title="头像"></td>
                <td>修改头像</td>
            </tr>
            <tr >
                <td>账号：</td>
                <td><input name="account" type="text" value="${sessionScope.user.account}" /></td>
            </tr>
            <tr >
                <td>邮箱：</td>
                <td><input name="email" type="text" value="${sessionScope.user.email}" /></td>
            </tr>
            <tr >
                <td>电话：</td>
                <td><input name="tel" type="text" value="${sessionScope.user.tel}" /></td>
            </tr>
            <tr align="center">
                <td colspan="2" ><input type="button" value="确认修改" id="sub" align="center"/></td>
            </tr>
        </table>
        </form>
    </div>--%>
    <div id="info" class="center_box">
        <div class="logo_img">
            <img sizes="250px 250px" src="${pageContext.request.contextPath }/style/imags/blackfplogo.png" title="扶贫有你">
        </div>
        <div class="content">
            <table class="tab" style="border-spacing:30px 30px;">
                <%--            <tr>--%>
                <%--                <img src="${pageContext.request.contextPath }/style/imags/blackfplogo.png" title="扶贫有你">--%>
                <%--            </tr>--%>
                <tr>
                    <td><font style="color:#999999">账&nbsp&nbsp&nbsp号：</font></td>
                    <td>${sessionScope.user.account}</td>

                    <td><font style="color:#999999">账&nbsp 号&nbsp 状&nbsp 态：</font></td>
                    <c:if test="${sessionScope.user.status ==2}">
                        <td>爱心人士</td>
                    </c:if>

                    <c:if test="${sessionScope.user.status ==1}">
                        <td>认证通过：加油</td>
                    </c:if>

                    <c:if test="${sessionScope.user.status ==0}">
                        <td>管理员</td>
                    </c:if>

                </tr>

                <tr>
                    <td><font style="color:#999999">邮&nbsp&nbsp箱：</font></td>
                    <td>${sessionScope.user.email}</td>

                    <td><font style="color:#999999">电&nbsp&nbsp话：</font></td>
                    <td>${sessionScope.user.tel}</td>

                </tr>

                <tr>
                    <td><font style="color:#999999">累 计 参 与 项 目：</font></td>
                    <td>${sum}</td>

                </tr>

            </table>
        </div>
    </div>
</div>

</body>
</html>