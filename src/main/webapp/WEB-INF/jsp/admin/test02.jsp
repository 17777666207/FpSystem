<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/13
  Time: 15:52
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

        function delete_articleClass(id) {
            var b = window.confirm("确认删除")
            if (eval(b)) {
                location.href = '${pageContext.request.contextPath}/admin/articleClass_delete.do?id=' + id
            }
        }

    </script>

    <style>
        .tr_body:hover { /*我的捐赠表格*/
            background-color: #ddd;
        }

        .headline {
            background-color: #ff6565;
        }

        .bt {
            width: 60px;
            height: 32px;
            /*background-color: #e4e4e5;*/
            border: 0 none;
            border-radius: 0 4px 4px 0;
            background: #e4e4e5;;

        }


    </style>

</head>
<body>

<div class="user_info">

    <div class="border_left"></div>
    <div class="myTitle">
        <h1 class="">文章分类</h1>
    </div>

    <form name="" id="ListForm" action="${pageContext.request.contextPath}/admin/test02.do" method="post">
        <div id="info" class="center_box">

            <div class="search" style="display: inline-block;float: right;margin-bottom: 30px">
                <input type="text" style="height: 24px" name="className" value="${className_select}"
                       placeholder="请输入文章分类标题">
                <input class="bt" type="submit" value="搜 素">
            </div>

            <div style="height: 400px">
                <table class="table" align="center">
                    <tr class="headline">
                        <%-- 全选<td width="71">&nbsp;</td>--%>
                        <%--                    <td whith="">待定</td>--%>
                        <td whith="">分类名称</td>
                        <%--                    <td whith="">排序</td>--%>
                        <td whith="">开始时间</td>
                        <td>操作</td>
                    </tr>

                    <c:forEach items="${acc.list}" var="acc">
                        <tr class="tr_body">
                                <%--                    <td>功能暂定</td>--%>

                            <td>
                                <div class="td_hidden_div">${acc.className}</div>
                            </td>

                                <%--                    <td><div class="td_hidden_div">${acc.sequence}</div></td>--%>

                            <td>
                                <div class="td_hidden_div">${acc.addTime}</div>
                            </td>

                            <td>
                                <a href="${pageContext.request.contextPath}/admin/show_articleClass_edit.do?id=${acc.id}">编辑</a>|<a
                                    onclick="delete_articleClass(${acc.id});">删除</a></td>

                        </tr>
                    </c:forEach>


                    <%-- <tr>
                         <td align="left" class="ac8"><a href="$!webPath/admin/articleclass_edit.htm?id=$!obj.id&currentPage=$!currentPage">编辑</a>#if(!$!obj.sysClass)|<a href="javascript:void(0);" onclick="if(confirm('删除分类会同时删除该分类的所有下级，是否继续?'))window.location.href='$!webPath/admin/articleclass_del.htm?mulitId=$!obj.id&currentPage=$!currentPage'">删除</a>#end</td>
                     </tr>--%>
                </table>
            </div>

            <!--分页-->
            <nav aria-label="Page navigation">
                <div id="pages" style="margin-left: 240px">

                    <ul class="pagination">
                        <li><a href="#" class="current_page">当前页码：${acc.pageNum}</a></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/test02.do?pageNum=1&className=${className_select}">首页</a>
                        </li>
                        <c:if test="${acc.pageNum > 1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/test02.do?pageNum=${acc.prePage}&className=${className_select}">上一页</a>
                            </li>
                        </c:if>
                        <c:if test="${acc.pageNum != acc.pages}">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/test02.do?pageNum=${acc.nextPage}&className=${className_select}">下一页</a>
                            </li>
                        </c:if>
                        <c:if test="${acc.pageNum != acc.pages}">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/test02.do?pageNum=${acc.pages}&className=${className_select}">尾页</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </nav>

        </div>
    </form>


</div>

</body>
</html>
