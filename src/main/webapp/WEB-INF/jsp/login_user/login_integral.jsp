<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/3/8
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/index_header.jsp" %>
<html>
<head>
    <script>
        $(function () {/*菜单栏选中*/
            document.getElementById("info_manage").style.backgroundColor = "#ff6565";
        })
    </script>
</head>
<body>
<div class="user_info">
    <%--

    <table width="990" border="0" cellspacing="0" cellpadding="0" id="opertable" >
        <!--表头-->
        <tr id="opertitle">
            <td width="100"  align="center">编号</td>
            <td width="300" align="center">商铺名称</td>
            <td width="100" align="center">会员编号</td>
            <td width="300" align="center">积分类型</td>
            <td width="100" align="center">积分值</td>
            <td width="220" align="center">状态</td>
            <!--<td width="110" align="center">操作</td>-->
        </tr>
        <!--遍历表的内容-->
        #foreach($obj in $objs)
        <!--表的内容-->
        <tr class="opertr">
            <!--在表格中显示会员的信息-->
            <td  class="address" align="center">$!{velocityCount}</td>
            <td  class="address" align="center">$!obj.store.store_name</td>
            <td  class="address" align="center">$!obj.member.vipCode</td>
            <td  class="address" align="center">$!obj.typeName</td>
            <td  class="address" align="center">$!obj.intergral</td>
            <td align="center">
                #if($!obj.status==1)
                可用
                #end
                #if($!obj.status==2)
                禁用
                #end
            </td></tr>
        #end
    </table>
    --%>

    <table width="990" border="0" cellspacing="0" cellpadding="0" id="opertable">
        <!--表头-->
        <tr id="opertitle">
            <td width="100" align="center">编号</td>
            <td width="300" align="center">商铺名称</td>
            <td width="100" align="center">会员编号</td>
            <td width="300" align="center">积分类型</td>
            <td width="100" align="center">积分值</td>
            <td width="220" align="center">状态</td>

        </tr>
        <tr class="opertr">
            <!--在表格中显示会员的信息-->
            <td class="address" align="center">$!{velocityCount}</td>
            <td class="address" align="center">$!obj.store.store_name</td>
            <td class="address" align="center">$!obj.member.vipCode</td>
            <td class="address" align="center">$!obj.typeName</td>
            <td class="address" align="center">$!obj.intergral</td>
            <td align="center">
            </td>
        </tr>

    </table>
    <a onclick="window.open('${pageContext.request.contextPath}/index.jsp')">点击</a>
</div>
</body>
</html>
