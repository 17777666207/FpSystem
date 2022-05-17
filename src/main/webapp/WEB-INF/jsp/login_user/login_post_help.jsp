<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/4/1
  Time: 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../include/index_header.jsp" %>
<html>
<head>
    <title>需求发布</title>

    <script>
        $(function () {/*菜单栏选中*/
            document.getElementById("my_help").style.backgroundColor = "#ff6565";
        })

        function sub() {
            var title = document.getElementById("title").value;
            var target = document.getElementById("target").value;
            var articleClass = document.getElementById("articleClass").value
            var imgFile = document.getElementById("imgFile").value;
            var content = document.getElementById("content").value;

            if (title.length > 0 && target.length > 0 && articleClass.length > 0 && imgFile.length > 0 && content.length > 0) {
                $('.main_form').submit();
            } else {
                alert("请将信息填写完整");
            }

        }
    </script>
    <style>
        ul {
            margin-bottom: 10px;
        }

        .btn_save {
            width: 125px;
            height: 42px;
            border-radius: 25px;
            font-size: 18px;
            font-weight: 500;
            background: #F45B4B;
        }

        .user_info li {
            font-size: 16px;
        }

    </style>
</head>
<body>

<div class="user_info">

    <div class="border_left"></div>
    <div class="myTitle">
        <h1 class="">需求发布</h1>
    </div>


    <div id="info" class="center_box">
        <form class="main_form" action="${pageContext.request.contextPath}/admin/help_save.do" method="post"
              enctype="multipart/form-data">

            <div class="setcont">
                <ul class="set1">
                    <li><strong class="orange fontsize20">*</strong>文章标题</li>
                    <li><span>
                      <input name="title" class="ip_text" type="text" id="title" value="${obj.title}" size="40"/>
                      </span></li>
                </ul>

                <ul class="set1">
                    <li><strong class="orange fontsize20">*</strong>目标金额</li>
                    <li><span>
                      <input name="target" id="target" class="ip_text" type="text" id="" size="40"/>
                      </span></li>
                </ul>

                <ul class="set1">
                    <li><strong class="orange fontsize20">*</strong>文章分类</li>

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
                    <li>
                      <span>
                         <input name="imgFile" style="border: 1px solid #ccc;" type="file" id="imgFile" size="40"/>
                      </span>
                    </li>

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
                      <textarea name="content" id="content" style="border: 1px solid #ccc;" cols="100" rows="9"
                                id="content"></textarea>
                      </span></li>
                </ul>

                <ul>
                    <input type="button" onclick="sub();" class="btn_save" value="保 存"/>
                </ul>
            </div>

        </form>
    </div>
</div>

</body>
</html>
