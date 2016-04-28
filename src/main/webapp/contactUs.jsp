<%@ page language="java" import="com.trs.model.User"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<title>联系我们</title>
<!--js-->

<script type="text/javascript" src="js/javascript1.js"></script>
<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/common.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/ddsmoothmenu.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.elastislide.js"></script>
<script src="js/jquery.jcarousel.min.js"></script>
<script src="js/jquery.accordion.js"></script>
<script src="js/light_box.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".inline").colorbox({
			inline : true,
			width : "50%"
		});
	});
</script>
<!--end js-->

<!-- Mobile Specific Metas ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS ================================================== -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/colors.css">
<link rel="stylesheet" href="css/skeleton.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" href="css/elastislide.css" />
<link rel="stylesheet" href="css/home_flexslider.css" />

<link rel="stylesheet" href="css/light_box.css" />
<script src="js/html5.js"></script>

<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->



<script type="text/javascript">
	//跳转注册页面
	function gotoRegister() {
		document.getElementById("username").value = "";
		document.getElementById("pwd").value = "";
		document.getElementById("number").value = "";
		//跳转完再回来要实现清空
		window.location.href = "register.jsp";
	}

	function refresh(obj) {
		obj.src = "ImageServlet?" + Math.random();
	}
</script>
</head>
<body>
	<div class="mainContainer sixteen container">
		<!--头部-->
		<div class="header-wrapper">
			<header class="container">
				<div class="head-right">
					<ul class="top-nav">
						<!-- 判断登录状态设置头部 -->
						<c:if test="${empty currentUser }">
							<li class="checkout"><a href="login.jsp" title="登录">登录</a></li>
							<li class="log-in"><a href="register.jsp" title="注册">注册</a></li>
						</c:if>

						<c:if test="${not empty currentUser }">
							<li class=""><a href="PersonInformation?method=gotoPerson"
								title="个人中心">个人中心</a></li>
							<li class=""><a href="exitUser" title="网站首页">退出帐号</a></li>
						</c:if>

					</ul>


					<section class="header-bottom">
						<!--  购物车 -->
						<div class="cart-block">
							<ul>
								<li><a href="cart.html" title="Cart"></a></li>
								<li>我的关注</li>
							</ul>
						</div>
						<!-- cart-block 结尾 -->


						<div class="search-block">
							<form action="Taskearch?method=simple">
								<input type="text" value="" /> <input type="submit" value="搜索"
									title="搜索" />
							</form>
						</div>

					</section>
				</div>
				<h1 class="logo">
					<a href="main.jsp" title="Logo" style="display: block;"> <img
						title="Logo" alt="Logo" src="images/logo.png" />
					</a>
				</h1>
				<nav id="smoothmenu1" class="ddsmoothmenu mainMenu">
					<ul id="nav">
						<li class=""><a href="main.jsp" title="网站首页">网站首页</a></li>
						<li class=""><a href="TaskSearch?method=simple&taskName="
						title="需求分类">需求分类</a>
						<ul>
							<li><a href="TaskSearch?method=type&type=1">求购</a>
								<ul>
									<li><a href="TaskSearch?method=type2&type=1&type2=1">衣着服饰</a></li>
									<li><a href="TaskSearch?method=type2&type=1&type2=2">数码配件</a></li>
									<li><a href="TaskSearch?method=type2&type=1&type2=3">宿舍电器</a></li>
									<li><a href="TaskSearch?method=type2&type=1&type2=4">学习资料</a></li>
									<li><a href="TaskSearch?method=type2&type=1&type2=5">其他</a></li>
								</ul></li>
							<li><a href="TaskSearch?method=type&type=2">求租</a>
								<ul>
									<li><a href="TaskSearch?method=type2&type=2&type2=1">代步工具</a></li>
									<li><a href="TaskSearch?method=type2&type=2&type2=2">通讯账号</a></li>
									<li><a href="TaskSearch?method=type2&type=2&type2=3">****</a></li>
									<li><a href="TaskSearch?method=type2&type=2&type2=4">****</a></li>
									<li><a href="TaskSearch?method=type2&type=2&type2=5">其他</a></li>
								</ul></li>
							<li><a href="TaskSearch?method=type&type=3">兼职</a>
								<ul>
									<li><a href="TaskSearch?method=type2&type=3&type2=1">传单类</a></li>
									<li><a href="TaskSearch?method=type2&type=3&type2=2">派送类</a></li>
									<li><a href="TaskSearch?method=type2&type=3&type2=3">代理类</a></li>
									<li><a href="TaskSearch?method=type2&type=3&type2=4">其他</a></li>
								</ul></li>
							<li><a href="TaskSearch?method=type&type=4">其他</a>
								<ul>
									<li><a href="TaskSearch?method=type2&type=4&type2=1">快递代领</a></li>
									<li><a href="TaskSearch?method=type2&type=4&type2=2">顺风车</a></li>
									<li><a href="TaskSearch?method=type2&type=4&type2=3">****</a></li>
									<li><a href="TaskSearch?method=type2&type=4&type2=4">其他</a></li>
								</ul></li>
						</ul></li>
						<li class=""><a href="addTask.jsp" title="我要出售">我要出售</a></li>
						<!--<li class=""><a href="login.jsp" title="登录网站">登录网站</a></li>-->
						<li class=""><a href="personPage.jsp" title="个人中心">个人中心</a></li>
						<li class="active"><a href="contactUs.jsp" title="联系我们">联系我们</a></li>

					</ul>
				</nav>
			</header>
		</div>
		<!-- 头部div结尾 -->
	</div>
	<br>
	<br>
	<br>
	<p align="center">
		<font size=4px>请扫描以下二维码，获取更多校友帮官方消息</font>
	</p>
	<table border="10" cellpadding="10"
		style="wdith: 670px; height: 260px; margin: 0px auto;">

		<tr>
		</tr>
		<tr>
		</tr>

		<tr>

			<td align="center">官方新浪微博</td>

			<td align="center">官方客服QQ</td>

			<td align="center">官方微信</td>
		</tr>

		<tr>
			<td width=33%><img src="imgs/weibo.jpg"
				style="width: 200px; height:200px;" /></td>

			<td width=33%><img src="imgs/qq.jpg"
				style="width: 200px; height:200px;" /></td>

			<td width=33%><img src="imgs/weibo.jpg"
				style="width: 200px; height:200px;" /></td>
	</table>
	<%@include file="end.jsp" %>
</body>