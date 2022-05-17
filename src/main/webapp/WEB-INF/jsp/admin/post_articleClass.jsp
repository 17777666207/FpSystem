<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/21
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../include/index_header.jsp" %>
<html>
<head>
    <script>
        $(function () {/*菜单栏选中*/
            document.getElementById("post_ArticleClass").style.backgroundColor = "#ff6565";
        })


        $(function () {
            $('.btn_save').click(function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/admin/add_post_articleClass_save.do",
                    data: $('.main_form').serialize(),
                    type: 'post',
                    success: function (result) {
                        var i = eval(result);
                        if (i) {
                            alert("添加成功");
                            location.href = "${pageContext.request.contextPath}/admin/test02.do";
                        } else
                            alert("添加失败");
                        location.href = "${pageContext.request.contextPath}/admin/show_post_articleClass.do";
                    }
                })
            })
        })
    </script>

    <style>
        ul {
            margin-bottom: 20px;
        }

        li {
            font-size: 16px;
        }
    </style>

</head>
<body>

<div class="user_info">

    <div class="border_left"></div>
    <div class="myTitle">
        <h1 class="">分类发布</h1>
    </div>

    <div id="info" class="center_box">
        <form class="main_form" action="${pageContext.request.contextPath}" method="post">

            <div class="">
                <ul class="">
                    <li><strong class="orange fontsize20">*</strong>文章分类标题</li>
                    <li><span>
                      <input name="className" class="ip_text" type="text" size="40"/>
                      </span></li>
                </ul>


                <%--                <ul class="">--%>
                <%--                    <li>*排序</li>--%>
                <%--                    <li>--%>
                <%--                        <input name="sequence" class="ip_text" type="text" value="" >--%>
                <%--                    </li>--%>
                <%--                </ul>--%>

                <ul>
                    <input type="button" class="btn_save" value="保存"/>
                </ul>
            </div>

        </form>
    </div>
</div>

</body>
</html>
