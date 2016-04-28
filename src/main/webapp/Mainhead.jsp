<%@ page language="java" import="java.util.*,com.trs.model.User"
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

<!--js-->
<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/common.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/ddsmoothmenu.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.elastislide.js"></script>
<script src="js/jquery.jcarousel.min.js"></script>
<script src="js/jquery.accordion.js"></script>
<script src="js/light_box.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".inline").colorbox({
			inline : true,
			width : "50%"
		});
	});
	
	
	//ajax
	//参数val用于确定我是选择了哪个需求 用于获取信息
	function loadXMLDoc(val) {
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		var taskId = val;
		xmlhttp.onreadystatechange = function() {
			// 状态4， 200 发送成功
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var returntext = xmlhttp.responseText;
				var strs = new Array();
				//回写的是一串很长的字符，所以分开
				strs = returntext.split("$");

				var caseHtml = "<img src=\"imgs/"+strs[1]+"\" /><div class='hiddBg'></div>";
				$(".casehtml").html(caseHtml);
				$(".smallImg03").click(function() {
					$(".casehtml").html($(this).find(".hidden").html());

					$(".caselayBox").fadeIn(300)
				});

				$(".casehtml").hover(function() {
					$(this).find(".hiddBg").stop(true, true).fadeToggle();
				});
				//现在已经得到后台传过来的值了，可以进行相应的JS操作
				document.getElementById("taskName").innerHTML = strs[0];
				document.getElementsByName("img2")[0].src = "imgs/" + strs[1];
				document.getElementsByName("img2")[1].src = "imgs/" + strs[1];
				document.getElementsByName("img3")[0].src = "imgs/" + strs[2];
				document.getElementsByName("img3")[1].src = "imgs/" + strs[2];
				document.getElementsByName("img4")[0].src = "imgs/" + strs[3];
				document.getElementsByName("img4")[1].src = "imgs/" + strs[3];
				//需求的描述
				document.getElementById("tabDes").innerHTML = strs[4];
				//需求的具体信息
				document.getElementById("taskPrice").innerHTML = strs[5];
				if(strs[6] == "0"){
					document.getElementById("taskDiscount").innerHTML = "否";
				}else{
					document.getElementById("taskDiscount").innerHTML = "是";
				}
				if(strs[7] == "0"){
					document.getElementById("taskIsrent").innerHTML = "否";
				}else{
					document.getElementById("taskIsrent").innerHTML = "是";
				}
				document.getElementById("taskNew").innerHTML = strs[8];
				document.getElementById("taskDate").innerHTML = strs[9];
				//获取联系方式
				document.getElementById("ownerName").innerHTML = "对方昵称: "
						+ strs[10];
				if (strs[11] != "")
					document.getElementById("ownerRealName").innerHTML = "对方称呼"
							+ strs[11];
				if (strs[12] != "")
					document.getElementById("ownerTel").innerHTML = "对方电话: "
							+ strs[12];
				if (strs[13] != "")
					document.getElementById("ownerLocation").innerHTML = "对方住址: "
							+ strs[13];
				document.getElementById("ownerQQ").href = "http://wpa.qq.com/msgrd?v=3&uin="
						+ strs[14] + "&site=oicqzone.com&menu=yes";
			}
		}

		xmlhttp.open("get", "getCurrentTask?method=add&taskId=" + taskId, true);
		xmlhttp.send();
	}


//用于关注商品
	//参数val用于确定我是选择了哪个商品 用于获取商品信息
	function loadXMLAttention(val) {
		var xmlhttp;
		var taskId = val;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange = function() {
			// 状态4， 200 发送成功
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				alert("关注成功!");
			}
		}

		xmlhttp.open("get", "AddAttention?method=add&taskId=" + taskId, true);
		xmlhttp.send();
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

</head>

<body>


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
	<!--Banner Block-->
	<section class="banner-wrapper">
		<div class="banner-block container">
			<div class="flexslider">
				<ul class="slides">
					<li><img title="Banner" alt="Banner"
						src="imgs/1424832433276.jpg" /></li>
					<li><img title="Banner" alt="Banner"
						src="imgs/1424963092261.jpg" /></li>
					<li><img title="Banner" alt="Banner"
						src="imgs/1424962955340.jpg" /></li>
					<li><img title="Banner" alt="Banner"
						src="imgs/1424961290665.jpg" /></li>
					<li><img title="Banner" alt="Banner"
						src="imgs/1424961130407.jpg" /></li>
				</ul>
			</div>
			<ul class="banner-add">
				<li class="add1"><a href="siteAnnounce.jsp" title=""><img
						title="add1" alt="add1" src="images/static1.jpg" /></a></li>
				<li class="add2"><img title="add2" alt="add2"
					src="images/static2.jpg" /></li>
			</ul>
		</div>
	</section>