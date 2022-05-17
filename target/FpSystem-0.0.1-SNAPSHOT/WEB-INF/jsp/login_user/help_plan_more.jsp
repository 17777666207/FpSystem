<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/5/10
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../include/index_header.jsp" %>
<html>
<head>
    <title>需求审核详情</title>
    <script>
        function check() {
            var title = document.getElementById("title").value;
            var articleClass = document.getElementById("articleClass").value;
            var imgFile = document.getElementById("imgFile").value;
            var content = document.getElementById("content").value;
            if (title.length > 0 && articleClass.length > 0 && imgFile.length > 0 && content.length > 0) {
                $('.my_form').submit();
            } else {
                alert("请将信息填写完整");
            }
        }
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
    <div class="return_article" style="margin-left: 10px">
        <a href="${pageContext.request.contextPath}/admin/att_plan.do"><< 返回上一页</a>
    </div>


    <div style="margin:30px 0px 0px 200px">
        <form action="${pageContext.request.contextPath}/admin/article_apply.do?${ac.id}" class="my_form" method="post"
              enctype="multipart/form-data">

            <div class="">
                <ul class="">
                    <li><strong class="">*</strong>文章标题</li>
                    <li>
                            <span>
                                <input name="id" type="hidden" class="ip_text" id="id" value="${ac.id}" size="80"/>
                                <input name="title" type="text" id="title" class="ip_text" value="${ac.title}"
                                       size="40"/>
                             </span>
                    </li>
                </ul>

                <ul class="">
                    <li><strong class="">*</strong>文章分类</li>
                    <li><span class="">

                          <select style="height: 26px;border: 1px solid #ccc;" name="articleClass_id" id="articleClass">

                            <option value="${acc_id}">${acc_firstName}</option>
                               <c:forEach items="${acc}" var="acc">
                                   <option value="${acc.id}">${acc.className}</option>
                               </c:forEach>
                          </select>

                          </span></li>
                </ul>

                <ul class="">
                    <li>*封面相片</li>
                    <li><span class="">
                          <input name="imgFile" type="file" id="imgFile" size=""/>
                          </span></li>
                </ul>
                <ul class="">
                    <li><strong class="">*</strong>内容</li>
                    <li><span class="">
                          <textarea name="content" style="height:110px;width: 500px" cols="40" rows="10"
                                    id="content">${ac.content}</textarea>
                          </span></li>
                </ul>

                <ul>
                    <input type="button" class="btn_save" onclick="check();" value="保存"/>
                </ul>
            </div>

        </form>

    </div>
</div>
</body>
</html>
