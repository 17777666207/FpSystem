<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/13
  Time: 15:51
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
            document.getElementById("Article_manager").style.backgroundColor = "#ff6565";
        })

        function select_article(id) {
            console.log("123")
            alert("进入")
        }

        function delete_article(id) {
            var b = window.confirm("确认删除?")
            if (eval(b)) {
                location.href = '${pageContext.request.contextPath}/admin/show_article_delete.do?id=' + id
            }
        }
    </script>

    <style>
        .tr_body:hover { /*我的捐赠表格*/
            background-color: #ddd;
        }

        .headline {
            background-color: #ff6565;
            /*height: 10px;*/
        }

        .table {
            margin-left: -45px;
        }

        .bt {
            width: 60px;
            height: 32px;
            /*background-color: #e4e4e5;*/
            border: 0 none;
            border-radius: 0 4px 4px 0;
            background: #e4e4e5;;

        }

        .search {
            margin-right: 45px;
        }

    </style>


</head>
<body>
<div class="user_info">

    <div class="border_left"></div>
    <div class="myTitle">
        <h1 class="">文章管理</h1>
    </div>

    <FORM name="" id="ListForm" action="${pageContext.request.contextPath}/admin/test01.do" method="post">

        <div id="info" class="center_box">
            <div class="search" style="display: inline-block;float: right;margin-bottom: 30px">

                <select name="articleClass_id" id="articleClass" style="height: 30px">
                    <option value="">请选择文章分类</option>
                    <c:forEach items="${acc}" var="acc">
                        <option value="${acc.id}" onkeyup="select_article(${acc.id});">${acc.className}</option>
                    </c:forEach>
                </select>

                <input type="text" style="height: 24px" name="title" value="${title_select}" placeholder="请输入文章标题">
                <input class="bt" type="submit" value="搜 素">
            </div>


            <div style="margin-top: 30px; height: 520px">
                <table class="table">
                    <tr class="headline">
                        <td width="100" height="40px">文章标题</td>
                        <td width="200" height="40px">文章内容</td>
                        <td width="80" height="40px">封面相片</td>
                        <%--                    <td width="50"  height="40px">排序</td>--%>
                        <td width="120" height="40px">开始时间</td>
                        <td width="100" height="40px">文章分类</td>
                        <td width="100" height="40px">操作</td>
                    </tr>
                    <c:forEach items="${ac.list}" var="ac">
                        <tr class="tr_body">
                            <td>
                                <div class="td_hidden_div">${ac.title}</div>
                            </td>
                            <td>
                                <div class="td_hidden_div">${ac.content}</div>
                            </td>
                            <td><img src="${ac.img}" width="60px" height="40px"></td>
                                <%--                        <td ><div class="td_hidden_div">${ac.sequence}</div></td>--%>
                            <td>
                                <div class="td_hidden_div">${ac.addTime}</div>
                            </td>

                            <c:forEach items="${acc}" var="acc">
                                <c:if test="${ac.articleClass_id == acc.id}">
                                    <td>
                                        <div class="td_hidden_div">${acc.className}</div>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/show_article_edit.do?id=${ac.id}">编辑</a>|<a
                                    onclick="delete_article(${ac.id});">删除</a></td>
                        </tr>
                    </c:forEach>

                </table>
            </div>

            <!--分页-->
            <nav aria-label="Page navigation">
                <div id="pages" style="margin-left: 200px">

                    <ul class="pagination">
                        <li><a href="#" class="current_page">当前页码：${ac.pageNum}
                            &nbsp&nbsp&nbsp&nbsp共&nbsp&nbsp${ac.pages}&nbsp&nbsp页 </a></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/test01.do?pageNum=1&title=${title_select}&ArticleClass_id=${c_id_select}">首页</a>
                        </li>
                        <c:if test="${ac.pageNum > 1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/test01.do?pageNum=${ac.prePage}&title=${title_select}&ArticleClass_id=${c_id_select}">上一页</a>
                            </li>
                        </c:if>
                        <c:if test="${ac.pageNum != ac.pages}">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/test01.do?pageNum=${ac.nextPage}&title=${title_select}&ArticleClass_id=${c_id_select}">下一页</a>
                            </li>
                        </c:if>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/test01.do?pageNum=${ac.pages}&title=${title_select}&ArticleClass_id=${c_id_select}">尾页</a>
                        </li>
                    </ul>
                </div>
            </nav>

        </div>
    </FORM>


</div>

</body>
</html>
