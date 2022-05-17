<%--
  Created by IntelliJ IDEA.
  User: 潘海
  Date: 2021/5/2
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../../include/index_header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>认证中心</title>


    <script>

        $(function () {/*菜单栏选中*/
            document.getElementById("attestation_plan").style.backgroundColor = "#ff6565";
        })

        $(function () {
            $(".btn_save").click(function () {
                var real_name = document.getElementById("real_name").value;
                var address = document.getElementById("address").value;
                var p_id = document.getElementById("p_id").value;
                var imgFile = document.getElementById("imgFile").value;
                var state = document.getElementById("state").value;
                if (real_name.length > 0 && address.length > 0 && p_id.length > 0 && imgFile.length > 0 && state.length > 0) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/admin/attestation_save.do",
                        data: $('.my_form').submit(),
                        type: 'post',
                        success: function (result) {
                            var b = eval(result);
                            if (b) {
                                alert("提交成功，请等待管理员审核");
                                location.href = "${pageContext.request.contextPath}/admin/show_attestation.do"
                            } else {
                                alert("提交失败，请重新提交");
                                location.href = "${pageContext.request.contextPath }/admin/show_attestation.do"
                            }
                        }
                    })
                } else {
                    alert("请输入全部信息");
                }
            })
        })

        $(function () {
            if (${message == true}) {
                window.confirm("上传成功，请等待审核")
            } else if (${message == false}) {
                window.confirm("上传失败，请重新上传")
            }
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

        .f_box_a {
            margin: 20px 50px 50px 150px;
        }

        .f_box_a ul {
            margin-bottom: 15px;
        }


    </style>
</head>
<body>
<div class="user_info">

    <div class="border_left_a"></div>
    <div class="myTitle_a">
        <h1 class="">贫困认证中心</h1>
    </div>


    <form action="${pageContext.request.contextPath}/admin/attestation_save.do" class="my_form"
          enctype="multipart/form-data" method="post">
        <div class="f_box_a">
            <ul>
                <li><strong class="orange fontsize20">*</strong>真实姓名</li>
                <li><span>
                          <input name="real_name" class="ip_text" id="real_name" type="text" size="40"
                                 value="${att.real_name}"/>
                    </span>
                </li>
            </ul>

            <ul>
                <li><strong class="orange fontsize20">*</strong>户籍地址</li>
                <li><span>
                          <input name="address" class="ip_text" id="address" type="text" size="40"
                                 value="${att.address}"/>
                    </span>
                </li>
            </ul>

            <ul>
                <li><strong class="orange fontsize20">*</strong>身份证号</li>
                <li><span>
                          <input name="p_id" class="ip_text" id="p_id" type="text" size="40" value="${att.p_id}"/>
                    </span>
                </li>
            </ul>

            <ul class="">
                <li>*认证相片（最多一张）</li>
                <li><span class="">
                          <input name="imgFile" id="imgFile" type="file" size="40"/>
                    </span>
                </li>
            </ul>

            <ul>
                <li><strong>*</strong>情况说明</li>
                <li><span>
                          <textarea style="height:110px;width: 500px;border: 1px solid #ccc" id="state" name="state"
                                    cols="40">${att.state}</textarea>
                    </span>
                </li>
            </ul>

            <ul>
                <input type="button" class="btn_save" value="保  存"/>
            </ul>
        </div>
    </form>

</div>
</body>
</html>
