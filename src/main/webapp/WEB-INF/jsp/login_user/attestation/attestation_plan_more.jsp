<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/5/2
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../../include/index_header.jsp" %>
<html>
<head>
    <title>申请详情</title>
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

        $(function () {/*菜单栏选中*/
            document.getElementById("attestation_plan").style.backgroundColor = "#ff6565";
        })

        $(function () {
            $('.att_pt').on("click", function () {
                layer.photos({
                    type: 1,
                    photos: '.layer_pt',
                    shade: 0.6,//遮罩透明度
                    anim: 0,//动画，0不开启
                    closeBtn: 1,//关闭按钮
                    area: ['600px'],  // 调节寬width height  ['600px','500px']
                    shadeClose: true,//遮罩点击关闭

                })
            })
        })


    </script>


</head>
<body>
<div class="user_info">

    <div class="border_left_a"></div>
    <div class="myTitle_a">
        <h1 class="">申请详情</h1>
    </div>

    <div class="border_left_p" style="margin-top: 0px;margin-left: 20px"></div>
    <div style="margin-left: 33px">
        <a href="${pageContext.request.contextPath}/admin/attestation_plan.do"><<-返回上一页</a>
    </div>


    <form action="${pageContext.request.contextPath}/admin/.do" class="my_form" enctype="multipart/form-data"
          method="post">
        <div class="f_box_am">
            <ul>

                <li><span style="font-size: 18px">
                    *真 实 姓 名: ${att.real_name}
                    </span>
                </li>
            </ul>

            <ul>
                <li><span style="font-size: 18px">
                          *户 籍 地 址: ${att.address}
                    </span>
                </li>
            </ul>

            <ul>

                <li><span style="font-size: 18px">
                          *身 份 证 号: ${att.p_id}
                    </span>
                </li>
            </ul>

            <ul class="layer_pt">
                <li style="font-size: 18px">*认 证 相 片:</li>
                <li><span style="font-size: 18px">
                            <img class="att_pt" width="60px" height="40px" src="${att.img_att}">
                    </span>
                </li>
            </ul>

            <ul>
                <li>*情 况 说 明:</li>
                <li><span>
                          <textarea style="height:110px;width: 500px" name="state" cols="40">${att.state}</textarea>
                    </span>
                </li>
            </ul>
            <ul>
                <li>*审 核 意 见:</li>
                <li><span>
                          <textarea style="height:110px;width: 500px" name="result" cols="40">${att.result}</textarea>
                    </span>
                </li>
            </ul>

        </div>
    </form>

</div>
</body>
</html>
