<%--
  Created by IntelliJ IDEA.
  User: 叭叭叭
  Date: 2021/3/28
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap</title>

    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/html5shiv.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/respond.min.js"></script>
    <%--        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/css/index.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/bootstrap.min.js"></script>

</head>

<body>
<!-- 导航条 -->
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">垃圾分类</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">
                logo位置
                <img src="" alt="" height="100%">
            </a>
        </div>


        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" class="one">首页</a></li>
                <li><a href="#">分类小贴士</a>
                <li><a href="#">常见误区</a>
                <li><a href="#">有趣分享</a>
                <li><a href="#">关于我们</a>
                <li class="last">
                    <a href="./login.html"><img src="${pageContext.request.contextPath}/style/images/user.png">&nbsp;
                        <span>登录</span>
                    </a>
                </li>
                <li><a href="#">注册</a>
            </ul>
        </div>
    </div>
</nav>


<!-- 搜索 -->
<div class="serch">
    <div class="col-lg-6">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="搜索...">
            <span class="input-group-btn">
                    <button class="btn btn-default" type="button">搜索</button>
                </span>
        </div>
    </div>
</div>

<!-- 轮播图 -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="${pageContext.request.contextPath}/style/images/03.png" alt="..." width="100%">
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/style/images/02.png" alt="..." width="100%">
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/style/images/01.png" alt="..." width="100%">
        </div>
    </div>
    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!-- 新闻 -->

<div class="new container">
    <strong>请问:</strong> <a href="#"> 你知道什么是垃圾分类吗？</a>
    <p>其实，垃圾分类就是对垃圾收集处置传统方式的改革，是对垃圾进行有效处置的一种科学管理方法。通过分类投放、分类收集，把有用物资，如纸张、塑料、橡胶、玻璃、瓶罐、金属以及废旧。家用电器等从垃圾中分离出来重新回收、利用，变废为宝。
    </p>
</div>
<!-- 栅栏 -->
<div class="shan container">
    <div class="row">
        <div class=" col-xs-12 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/style/images/con1_01.png" alt="...">
                <h3 class="text-center">可回收垃圾</h3>
                <p>主要包括废纸、塑料、玻璃、金属和布料五大类。 废纸：报纸、图书、各种包装纸等；塑料：各种塑料包装物......
                </p>
            </div>
        </div>
        <div class=" col-xs-12 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/style/images/con1_02.png" alt="...">
                <h3 class="text-center">厨余垃圾</h3>
                <p>厨余垃圾主要包括剩菜剩饭、骨头、菜根菜叶、果皮等食品类废物，经生物技术就地处理堆肥，每吨可生产0.3吨有机肥。
                </p>
            </div>
        </div>
        <div class=" col-xs-12 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/style/images/con1_02.png" alt="...">
                <h3 class="text-center">有害垃圾</h3>
                <p>有害垃圾主要包括废电池、废日光灯管、废水银温度计、过期药品等，这些垃圾需要特殊安全处理。
                </p>
            </div>
        </div>
        <div class=" col-xs-12 col-sm-6 col-md-3">
            <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/style/images/con1_04.png" alt="...">
                <h3 class="text-center">其他垃圾</h3>
                <p>包括除上述几类垃圾之外的砖瓦陶瓷、渣土、卫生间废纸、纸巾等难以回收的废弃物，采取卫生填埋可有效减少......
                </p>
            </div>
        </div>
    </div>
</div>

<!-- 底部 -->
<footer class="text-center">
    <span>给垃圾一个分类的归宿，还我们一个清洁的世界。</span>
    <p>垃圾分类，从我做起，提高公众的环保意识，让我们用自己的行动共同创造一个更好的生活环境!</p>
    <button type="button" class="btn">一起加油</button>
</footer>
<div class="di text-center bg-success">
    <span>百色学院2017级信息学院毕业作品</span>
</div>
>
</body>
</html>