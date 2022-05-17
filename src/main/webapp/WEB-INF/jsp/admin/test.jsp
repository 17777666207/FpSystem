<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/10
  Time: 21:01
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
            document.getElementById("post_SystemArticle").style.backgroundColor = "#ff6565";
        })

        $(function () {
            console.log("123")
            if (eval(${success})) {
                alert("添加成功");
                location.href = "${pageContext.request.contextPath}/admin/test01.do";
            }
            if (eval(${fal})) {
                alert("添加失败");
                location.href = "${pageContext.request.contextPath}/admin/test.do";
            }

        })


        $(function () {
            $('.btn_save').click(function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/admin/article_save.do",
                    data: $('.main_form').serialize(),
                    type: 'post',
                    success: function (result) {
                        var i = eval(result);
                        if (i) {
                            alert("添加成功");
                            location.href = "${pageContext.request.contextPath}/admin/test01.do";
                        } else
                            alert("添加失败");
                    }
                })
            })
        })
    </script>
    <style>
        ul {
            margin-bottom: 15px;
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
        <h1 class="">发布项目</h1>
    </div>

    <div id="info" class="center_box">
        <form class="main_form" action="${pageContext.request.contextPath}/admin/article_save.do" method="post"
              enctype="multipart/form-data">

            <div class="setcont">
                <ul class="">
                    <li><strong class="orange fontsize20">*</strong>文章标题</li>
                    <li><span>
                      <input name="title" class="ip_text" type="text" id="title" value="${obj.title}" size="40"/>
                      </span></li>
                </ul>

                <ul class="set1">
                    <li><strong class="orange fontsize20">*</strong>目标金额</li>
                    <li><span>
                      <input name="target" class="ip_text" type="text" id="" size="40"/>
                      </span></li>
                </ul>

                <ul class="set1">
                    <li><strong class="orange fontsize20">*</strong>文章分类</li>
                    <li><span class="webnamesec sizese">

                      <select style="height: 32px;border: 1px solid #ccc;" name="articleClass" id="articleClass">

                        <option value="1">请选择...</option>
                           <c:forEach items="${acc}" var="acc">
                               <option value="${acc.id}">${acc.className}</option>
                           </c:forEach>
                      </select>

                      </span></li>
                </ul>
                <ul class="">
                    <li>*封面相片</li>
                    <li><span class="">
                      <input name="imgFile" type="file" id="imgFile" size="40"/>
                      </span></li>

                    <%--                    <li>*命名封面相片（可不填）</li>--%>
                    <%--                    <li><span class="">--%>
                    <%--                       <input name="fileName" type="text" size="40">--%>
                    <%--                      </span></li>--%>
                </ul>
                <%--                <ul class="set1">--%>
                <%--                    <li>*序号</li>--%>
                <%--                    <li><span class="">--%>
                <%--                      <input name="sequence" class="ip_text" type="text" id="sequence" size="40" />--%>
                <%--                      </span></li>--%>
                <%--                </ul>--%>
                <ul class="set1">
                    <li><strong class="orange fontsize20">*</strong>内容</li>
                    <li><span class="">
                      <textarea name="content" style="border: 1px solid #ccc;" cols="80" rows="8"
                                id="content"></textarea>
                      </span></li>
                </ul>

                <ul>
                    <%--                    <input type="button"  class="btn_save" value="保存"/>--%>
                    <input type="submit" class="btn_save" value="保  存"/>
                </ul>
            </div>

        </form>
    </div>
</div>
</body>
</html>
