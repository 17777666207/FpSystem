<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/4/23
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<%@include file="../include/index_header.jsp"%>--%>
<head>
    <title>test表格</title>
    <script>
        $(function () {/*菜单栏选中*/
            document.getElementById("test_table").style.backgroundColor = "#ff6565";
        })
    </script>
    <style>
        .headline {
            background-color: #ff6565;
        }

        table {
            table-layout: fixed;
            text-align: center;
            background-color: red;
            /*height: 450px;*/
            /*width: 340px;*/
            width: 1000px;

        }

        table td {
            height: 60px;
            /*float-wrap: wrap;*/
            /*overflow: hidden;*/
            /*text-overflow:ellipsis;*/
            /*white-space: nowrap;*/

        }

        .c {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box; /* 弹性伸缩盒子模型显示 */
            -webkit-box-orient: vertical; /* 设置或检索伸缩盒对象的子元素的排列方式 */
            -webkit-line-clamp: 3; /* 限制在一个块元素显示的文本的行数 */

        }

    </style>
</head>
<body>
<div class="user_info" style="width: 1300px;">

    <table>
        <tr class="headline">
            <td width="150" align="center">账号</td>
            <td width="100" align="center">姓名</td>
            <td width="200" align="center">户籍地址</td>
            <td width="150" align="center">身份证号</td>
            <td width="100" align="center">认证相片</td>
            <td width="200" align="center">情况说明</td>
            <td width="130" align="center">时间</td>
            <td width="100" align="center">操作</td>
        </tr>

        <tr class="b">
            <td class="b" align="center">
                <div class="c">情况说明情况说明情况说明情况说明情况说明情况说明情况说明情况说明情况说明情况说</div>
            </td>
            <td class="a" align="center">
                <div class="c">情况说明情况说明情况说明情况说明情况说明情况说明情况说明情况说明情况说明情况说</div>
            </td>
            <td class="a" align="center">
                <div class="c">情况说明情况说明情况说明情况说明情况说明情况说明情况说明情况说明情况说明情况说</div>
            </td>
            <td class="a" align="center">
                <div class="c">情况说明情况说明情况说明情况说明情况说明情况说明情况说明情况说明情况说明情况说</div>
            </td>
            <td class="a" align="center">1</td>
            <td class="a" align="center">1</td>
            <td class="a" align="center">1</td>
            <td class="a" align="center">1</td>
        </tr>
        <tr>
            <td class="a" align="center">1</td>
            <td class="a" align="center">1</td>
            <td class="a" align="center">1</td>
            <td class="a" align="center">1</td>
            <td class="a" align="center">1</td>
            <td class="a" align="center">1</td>
            <td class="a" align="center">1</td>
            <td class="a" align="center">1</td>
        </tr>

    </table>


</div>
</body>
</html>
