<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/13
  Time: 20:42
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
            document.getElementById("ArticleClass_manager").style.backgroundColor = "#ff6565";
        })

    </script>

</head>
<style>
    ul {
        margin-bottom: 15px;
    }

    li {
        font-size: 16px;
    }

</style>
<body>


<div class="user_info">

    <div class="border_left"></div>
    <div class="myTitle">
        <h1 class="">文章分类</h1>
    </div>
    <div class="return_article" style="margin-left: 20px">
        <a href="${pageContext.request.contextPath}/admin/test02.do"><< 返回上一页</a>
    </div>

    <div style="margin:30px 0px 0px 200px">
        <form action="${pageContext.request.contextPath}/admin/articleClass_update_save.do?${acc.id}" method="get">

            <div class="">

                <ul class="">
                    <ul class="">
                        <li>*文章分类</li>
                        <li>
                            <input name="id" type="hidden" value="${acc.id}" class="ip_text">
                            <input id="" name="className" type="text" value="${acc.className}" class="ip_text">
                        </li>
                    </ul>
                </ul>

                <%--                <ul class="">--%>
                <%--                    <li>*排序</li>--%>
                <%--                    <li>--%>
                <%--                        <input  name="sequence" value="${acc.sequence}" class="ip_text" >--%>
                <%--                    </li>--%>
                <%--                </ul>--%>


                <ul>
                    <input type="submit" class="btn_save" value="保存"/>
                </ul>
            </div>

        </form>
    </div>
</div>


</body>
</html>
