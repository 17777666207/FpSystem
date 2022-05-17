<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/31
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../../include/index_header.jsp" %>
<html>
<head>
    <title>认证申请</title>

    <script>
        $(function () {/*菜单栏选中*/
            document.getElementById("attestation_apple").style.backgroundColor = "#ff6565";
        })
    </script>
    <style>
        .tr_body:hover { /*我的捐赠表格*/
            background-color: #ddd;
        }

        .headline {
            background-color: #ff6565;
        }

        .table {
            /*width: 1000px;*/
            margin-left: 13px;
            table-layout: fixed;
            text-align: center;
            width: 340px;

        }

        /*table tr{*/
        /*    height: 40px;*/
        /*}*/

        .myTitle {
            margin: 30px 0px 30px 40px;
            width: 1020px;
            /*border-left: #ff6565 solid 3px;*/
            border-bottom: #ddd solid 1px;
        }

        .border_left {
            width: 4px;
            height: 40px;
            float: left;
            margin-right: 20px;
            /*background: #f47306;*/
            background: #ff6565;
            margin-top: 30px;
            margin-left: 30px;
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
<div class="user_info" style="width: 1150px;">


    <div class="border_left"></div>
    <div class="myTitle">
        <h1 class="">认证申请</h1>
    </div>

    <form action="${pageContext.request.contextPath}/admin/show_attestation_apply.do" method="post">
        <div class="search" style="margin-right: 28px;display: inline-block;float: right;margin-bottom: 30px">

            <select style="height: 32px;border: 1px solid #ccc;" name="status" id="status">

                <option value="0">未审核</option>
                <option value="">全部</option>
                <option value="0">未审核</option>
                <option value="1">审核通过</option>
                <option value="2">审核不通过</option>
            </select>

            <input type="text" style="height: 24px" name="user_account" value="${account_select}"
                   placeholder="请输入项目所属人账号">
            <input type="submit" class="bt" value="搜 素">
        </div>


        <div style="height: 420px">
            <table class="table">
                <!--表头-->
                <tr class="headline">
                    <td width="80" align="center">账号</td>
                    <td width="80" align="center">姓名</td>
                    <td width="180" align="center">户籍地址</td>
                    <td width="100" align="center">身份证号</td>
                    <td width="100" align="center">认证相片</td>
                    <td width="150" align="center">情况说明</td>
                    <td width="80" align="center">状态</td>
                    <td width="100" align="center">时间</td>
                    <td width="60" align="center">操作</td>

                </tr>
                <%--            <c:forEach items="${order.list}" var="order">--%>
                <c:forEach items="${att.list}" var="att">
                    <tr class="tr_body">
                        <!--在表格中显示会员的信息-->

                        <c:forEach items="${users}" var="users">
                            <c:if test="${users.id == att.u_id}">
                                <td align="center">
                                    <div class="td_hidden_div">${users.account}</div>
                                </td>
                            </c:if>
                        </c:forEach>
                        <td align="center">
                            <div class="td_hidden_div">${att.real_name}</div>
                        </td>
                        <td align="center">
                            <div class="td_hidden_div">${att.address}</div>
                        </td>
                        <td align="center">
                            <div class="td_hidden_div">${att.p_id}</div>
                        </td>

                        <td align="center">
                            <img width="60px" height="40px" src="${att.img_att}">
                        </td>
                        <td align="center">
                            <div class="td_hidden_div">${att.state}</div>
                        </td>
                        <c:choose>
                            <c:when test="${att.status==0}">
                                <td class="address" align="center">
                                    <div class="td_hidden_div">审核中</div>
                                </td>
                            </c:when>
                            <c:when test="${att.status==1}">
                                <td class="address" align="center">
                                    <div class="td_hidden_div">审核通过</div>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td class="address" align="center">
                                    <div class="td_hidden_div">审核未通过</div>
                                </td>
                            </c:otherwise>
                        </c:choose>
                        <td class="address" align="center">
                            <div class="td_hidden_div">${att.addTime}</div>
                        </td>
                        <td align="center"><a
                                href="${pageContext.request.contextPath}/admin/show_attestation_more.do?id=${att.id}">审核</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <!--分页-->
        <nav aria-label="Page navigation">
            <div id="pages" style="margin-left: 480px">

                <ul class="pagination">
                    <li><a href="#" class="current_page">当前页码：${att.pageNum} 总页数: ${att.pages}  </a></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/show_attestation_apply.do?pageNum=1&user_account=${user_account}&status=${status}">首页</a>
                    </li>
                    <c:if test="${att.pageNum > 1}">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/show_attestation_apply.do?pageNum=${att.prePage}&user_account=${user_account}&status=${status}">上一页</a>
                        </li>
                    </c:if>
                    <c:if test="${att.pageNum != att.pages}">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/show_attestation_apply.do?pageNum=${att.nextPage}&user_account=${user_account}&status=${status}">下一页</a>
                        </li>
                    </c:if>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/show_attestation_apply.do?pageNum=${att.pages}&user_account=${user_account}&status=${status}">尾页</a>
                    </li>
                </ul>
            </div>
        </nav>
    </form>
</div>


</body>
</html>
