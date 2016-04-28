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
<meta charset="utf-8">

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

	//拒绝重复登录
	function refuseLogin() {
		alert("您已登录，请勿重复操作！");
		window.location.href = "main.jsp";
	}

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


	//确认密码是否符合规则
	function checkPassword() {
		var pas1 = document.getElementById("password1").value;
		var pas2 = document.getElementById("password2").value;
		var pasNow = document.getElementById("passNow").value;

		if (pasNow != ${currentUser.userPassword}!"") {
			alert("当前密码不正确!请重新输入");
			return false;
		}

		if (pas1 !== pas2) {
			alert("两次输入密码不一致，请重新输入！");
			document.getElementById("password1").value = "";
			document.getElementById("password2").value = "";
			return false;
		}

		if (pas1.length<6||pas1.length>15) {
			alert("密码长度不能小于6位大于15位！");
			//reset(); 同
			return false;
		}

		return true;
	}

	//修改密码重填
	function reset() {
		document.getElementsByName("passNow").value = "";
		document.getElementsByName("password1").value = "";
		document.getElementsByName("password2").value = "";
	}


	function reset(){
		document.getElementById("userId").value = "";
		document.getElementById("userEmail").value = "";
	}

	function check_null(){
		var val1 =  document.getElementById("userId").value;
		var val2 =  document.getElementById("userEmail").value;

		if(val1=="")
		{
			alert("用户名不能为空！");
			return false;
		}
		else if(val2 =="")
		{
			alert("邮箱不能为空！");
			return false;
		}
		else
			return true;
	}


	//设置页面跳转记时
	function clock() {
		setTimeout(gotoLogin,5000);
	}

	function gotoLogin(){
		window.location.href = "login.jsp";
	}



	//注册页面
	//重置
	function resetRegister() {

		document.getElementById("userid").value = "";
		document.getElementById("usernick").value = "";
		document.getElementById("userSex").value = "";
		document.getElementById("userno").value = "";
		document.getElementById("useridentity").value = "";
		document.getElementById("userrealname").value = "";
		document.getElementById("userlocation").value = "";
		document.getElementById("usertel").value = "";
		document.getElementById("userpassword").value = "";
		document.getElementById("email").value = "";
		document.getElementById("userqq").value = "";
		document.getElementById("number").value = "";

	}

	function refresh(obj) {
		obj.src = "ImageServlet?" + Math.random();
	}
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

<!-- 不允许重复登录 -->
<c:if test="${not empty currentUser }">
<script>
	refuseLogin();
</script>
</c:if>

<div class="mainContainer sixteen container">
	<!--头部-->
	<div class="header-wrapper">
		<header class="container">
			<div class="head-right">
				<ul class="top-nav">

					<!-- 判断是否为空设置头部 -->
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
					<div class="cart-block">
						<ul>
							<li><a href="cart.html" title="Cart">我的关注</a></li>
						</ul>
					</div>
					<div class="search-block">
						<form action="TaskSearch?method=simple" method="post"
							  name="form1">
							<input type="text" value="${taskName}" name="taskName" /> <input
								type="submit" value="搜索" title="搜索" />
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
					<li class=""><a href="addTask.jsp" title="我要发布需求">我要发布需求</a></li>
					<!--<li class=""><a href="login.jsp" title="登录网站">登录网站</a></li>-->
					<li class=""><a href="PersonInformation?method=gotoPerson"
									title="个人中心">个人中心</a></li>
					<li class=""><a href="contactUs.jsp" title="联系我们">联系我们</a></li>
				</ul>
			</nav>



		</header>
	</div>
	<!-- 头部div结尾 -->
</div>