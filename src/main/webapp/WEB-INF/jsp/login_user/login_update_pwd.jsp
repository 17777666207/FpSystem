<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/8
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../include/index_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/home.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/login_user.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery-2.0.0.min.js"></script>
    <%--    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/bootstrap.min.css"/>--%>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <script>
        $('#exampleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var recipient = button.data('whatever') // Extract info from data-* attributes
            var modal = $(this)
            modal.find('.modal-title').text('New message to ' + recipient)
            modal.find('.modal-body input').val(recipient)
        })


        /*菜单栏选中*/
        $(function () {
            document.getElementById("update_pwd").style.backgroundColor = "#ff6565";
        })

        $(function () {
            $('#up_save').click(function () {

                var a = document.getElementById("new_pwd").value;
                var p = document.getElementById("pwd").value;
                if (a.length > 0 && p.length > 0) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/admin/update_pwd.do",
                        data: $('.my_form').serialize(),
                        type: 'post',
                        success: function (result) {
                            var b = eval(result);
                            if (b) {
                                // layer.msg("修改成功、即将返回登录界面",{
                                //     width: '200px',
                                //     height:'200px',
                                //     icon: 1,
                                //     time: 4000
                                // });
                                alert("修改成功、即将返回登录界面");
                                location.href = "${pageContext.request.contextPath }/admin/login.do"
                            }
                            if (!b) {
                                alert("修改失败，请重新修改");
                                location.href = "${pageContext.request.contextPath }/admin/login_index.do"
                            }
                        }
                    })
                } else {
                    alert("请完整输入")
                }
            })
        })

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#exampleModal').modal('show');
        });
    </script>
    <style>
        .form-group {
            margin-left: 80px;
        }

        .modal-content {
            width: 450px;
        }
    </style>

</head>
<body>
<div class="user_info">
    <div class="am-cf admin-main">

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">密码修改</h4>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/admin/update_pwd.do" class="my_form"
                              method="get">
                            <div class="form-group">
                                <input TYPE="hidden" name="id" value="${sessionScope.user.id}">
                                旧密码：
                                <input name="pwd" id="pwd" type="password">
                            </div>
                            <div class="form-group">
                                新密码：
                                <input name="new_pwd" id="new_pwd" type="password">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">离开</button>
                                <button type="button" id="up_save" class="btn btn-primary">确认修改</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
