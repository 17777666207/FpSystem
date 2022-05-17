<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script>
    /*    $(function () {
           document.getElementById("select").style.backgroundColor="#ff6565";
        })*/
    /*function hover() {
        document.getElementsByClassName("ydc-menu-item").style.backgroundColor="#ff6565";
    }*/


</script>


<div class="daohang">
    <div class="ydc-menu">
        <ul>
            <li class="ydc-menu-item">
                <a href="${pageContext.request.contextPath }/admin/pkAbout.do" class="active"><i
                        class="ydc-icon ydc-icon-home fl"></i>首页</a>
            </li>
            <li class="ydc-menu-item" id="info_index">
                <a href="${pageContext.request.contextPath }/admin/show_login_index.do"><i
                        class="ydc-icon ydc-icon-find fl"></i>个人中心首页</a>
            </li>
            <c:if test="${sessionScope.user.att_status != 3}"><%--3为正在审核--%>
            <li class="ydc-menu-item" id="login_attestation">
                <a href="${pageContext.request.contextPath }/admin/show_attestation.do"><i
                        class="ydc-icon ydc-icon-find fl"></i>认证中心</a>
            </li>
            </c:if>

            <c:if test="${sessionScope.user.status == 2 or sessionScope.user.status == 0}"><%--2为爱心人士--%>
            <li class="ydc-menu-item" id="attestation_plan">
                <a href="${pageContext.request.contextPath }/admin/attestation_plan.do"><i
                        class="ydc-icon ydc-icon-find fl"></i>认证进度</a>
            </li>
            </c:if>

            <c:if test="${sessionScope.user.status == 1 }"><%--1为受助人士，此时att_status=3认证通过显示--%>
            <li class="ydc-menu-item" id="login_attestation">
                <a href="${pageContext.request.contextPath }/admin/show_pass.do"><i
                        class="ydc-icon ydc-icon-find fl"></i>认证中心</a>
            </li>
            </c:if>

            <li class="ydc-menu-item">
			<span class="ydc-menu-sub-title">
				<i class="ydc-icon ydc-icon-file fl"></i>设置
			</span>
                <ul>
                    <li id="info_manage">
                        <a href="${pageContext.request.contextPath}/admin/show_login_info.do">个人信息管理</a>
                    </li>
                    <li id="update_pwd">
                        <a href="${pageContext.request.contextPath}/admin/show_update_pwd.do">修改密码</a>
                    </li>
                </ul>
            </li>
            <li class="ydc-menu-item">
			<span class="ydc-menu-sub-title">
				<i class="ydc-icon ydc-icon-record fl"></i>项目管理
			</span>
                <ul>
                    <%--					<li  >--%>
                    <%--					    <a href="${pageContext.request.contextPath}/admin/show_donation.do">参与项目</a>--%>
                    <%--					</li>--%>
                    <li id="my_join">
                        <a href="${pageContext.request.contextPath}/admin/show_join.do">我的捐赠</a>
                    </li>
                    <c:if test="${sessionScope.user.status == 1}">
                        <li id="my_help">
                            <a href="${pageContext.request.contextPath}/admin/show_post_help.do">发布需求</a>
                        </li>
                        <li id="my_plan">
                            <a href="${pageContext.request.contextPath}/admin/my_plan.do">需求进度</a>
                        </li>
                        <li id="att_plan">
                            <a href="${pageContext.request.contextPath}/admin/att_plan.do">需求审核</a>
                        </li>
                    </c:if>

                </ul>
            </li>


            <c:if test="${sessionScope.user.status==0}">
            <li class="ydc-menu-item">
				<span class="ydc-menu-sub-title">
					<i class="ydc-icon ydc-icon-record fl"></i>项目管理(管理员)
				</span>
                <ul>
                    <li id="help_attestation">
                        <a href="${pageContext.request.contextPath}/admin/show_help_apply.do">需求审核</a>
                    </li>
                    <li id="post_SystemArticle">
                        <a href="${pageContext.request.contextPath}/admin/test.do">发布项目</a>
                    </li>
                    <li id="post_ArticleClass">
                        <a href="${pageContext.request.contextPath}/admin/show_post_articleClass.do">发布文章分类</a>
                    </li>
                    <li id="Article_manager">
                        <a href="${pageContext.request.contextPath}/admin/test01.do">文章管理</a>
                    </li>
                    <li id="ArticleClass_manager">
                        <a href="${pageContext.request.contextPath}/admin/test02.do">文章分类管理</a>
                    </li>

                </ul>
            </li>
            </c:if>

            <c:if test="${sessionScope.user.status==0}">
            <li class="ydc-menu-item">
					<span class="ydc-menu-sub-title">
						<i class="ydc-icon ydc-icon-record fl"></i>捐赠管理(管理员)
					</span>
                <ul>
                    <li id="donations_manage">
                        <a href="${pageContext.request.contextPath}/admin/donations_manage.do">捐赠管理</a>
                    </li>
                    <li id="donations_plan">
                        <a href="${pageContext.request.contextPath}/admin/donation_plan.do">爱心进度</a>
                    </li>
                </ul>
            </li>
            </c:if>


            <c:if test="${sessionScope.user.status==0}">
            <li class="ydc-menu-item">
			<span class="ydc-menu-sub-title">
				<i class="ydc-icon ydc-icon-record fl"></i>人员管理(管理员)
			</span>
                <ul>
                    <li id="attestation_apple">
                        <a href="${pageContext.request.contextPath}/admin/show_attestation_apply.do">认证申请</a>
                    </li>
                </ul>
                    <%--			  <ul>--%>
                    <%--				  <li id="test_table">--%>
                    <%--					  <a href="${pageContext.request.contextPath}/admin/test_table.do">test</a>--%>
                    <%--				  </li>--%>

                    <%--				  <li id="nigjinhuan">--%>
                    <%--					  <a href="${pageContext.request.contextPath}/admin/ningjinhuan.do">宁金环</a>--%>
                    <%--				  </li>--%>
                    <%--			  </ul>--%>

            </li>
            </c:if>

            <%--	  <li class="ydc-menu-item">
                        <span class="ydc-menu-sub-title">
                            <i class="ydc-icon ydc-icon-record fl"></i>积分管理
                        </span>
                          <ul>
                              <li>
                                  <a href="${pageContext.request.contextPath}/admin/show_integral.do" >积分管理</a>
                              </li>
                          </ul>
                     </li>
               </ul>--%>
    </div>
</div>
