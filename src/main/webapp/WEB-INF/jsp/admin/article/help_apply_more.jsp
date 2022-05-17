<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/4/1
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../../include/index_header.jsp" %>
<html>
<head>
    <title>需求申请详情</title>

    <script>
        $(function () {/*菜单栏选中*/
            document.getElementById("help_attestation").style.backgroundColor = "#ff6565";
        })
    </script>
    <style>

        .border_left_a {
            width: 4px;
            height: 40px;
            float: left;
            margin-right: 20px;
            /* background: #f47306; */
            background: #ff6565;
            margin-top: 30px;
            margin-left: 30px;
        }

        .myTitle_a {
            margin: 30px 0px 30px 40px;
            width: 1020px;
            /*border-left: #ff6565 solid 3px;*/
            border-bottom: #ddd solid 1px;
        }

        .f_box_am {
            margin: 20px 50px 50px 150px;
        }

        .f_box_am ul {
            margin-bottom: 15px;
        }
    </style>
    <script>
        $(function () {
            $(".btn_save").click(function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/admin/article_apply.do",
                    data: $('.my_form').serialize(),
                    type: 'post',
                    success: function (result) {
                        var b = eval(result);
                        if (b) {
                            alert("审核成功");
                            location.href = "${pageContext.request.contextPath }/admin/test01.do"
                        } else {
                            alert("审核失败，请重新审核");
                            location.href = "${pageContext.request.contextPath }/admin/show_help_apply.do"
                        }
                    }
                })
            })
        })
    </script>


</head>
<body>
<div class="user_info" style="height: 810px">

    <div class="border_left_a"></div>
    <div class="myTitle_a">
        <h1 class="">需求申请详情</h1>
    </div>
    <div class="return_article" style="margin-left: 20px">
        <a href="${pageContext.request.contextPath}/admin/show_help_apply.do"><< 返回上一页</a>
    </div>

    <form action="${pageContext.request.contextPath}/admin/.do" class="my_form" enctype="multipart/form-data"
          method="post">
        <div class="f_box_am">

            <ul>
                <li><span style="font-size: 18px">
                          *标 题: ${ac.title}
                    </span>
                </li>
            </ul>

            <ul>

                <li><span style="font-size: 18px">
                          *目 标 金 额: ${ac.target}
                    </span>
                </li>
            </ul>

            <ul>

                <li><span style="font-size: 18px">
                          *分 类: ${className}
                    </span>
                </li>
            </ul>

            <ul class="">
                <li style="font-size: 18px">*封 面 相 片:</li>
                <li><span style="font-size: 18px">
                             <img width="260px" height="216px" src="${ac.img}">
                    </span>
                </li>
            </ul>

            <ul>
                <li>*情 况 说 明:</li>
                <li><span>
                          <textarea style="height:110px;width: 500px" name="state" cols="40">${ac.content}</textarea>
                    </span>
                </li>
            </ul>

            <ul>
                <input class="apply" type="radio" name="apply_status" value="1">通过&nbsp&nbsp&nbsp&nbsp
                <input class="apply" type="radio" name="apply_status" value="2">不通过&nbsp&nbsp&nbsp&nbsp
                <input class="apply" type="radio" name="apply_status" checked="checked" value="0">待审核
            </ul>
            <ul>
                <input type="hidden" name="id" value="${ac.id}">
                <input type="button" class="btn_save" value="确认审核"/>
            </ul>
        </div>
    </form>

</div>
</body>
</html>

