<%@ page language="java" import="java.util.*,com.trs.model.User"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
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

<script type="text/javascript">
	$(function() {
		var caseHtml = "<img src=\"imgs/\" /><div class='hiddBg'></div>";
		$(".casehtml").html(caseHtml);
		$(".smallImg03").click(function() {
			$(".casehtml").html($(this).find(".hidden").html());

			$(".caselayBox").fadeIn(300)
		});

		$(".casehtml").hover(function() {
			$(this).find(".hiddBg").stop(true, true).fadeToggle();
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".inline").colorbox({
			inline : true,
			width : "50%"
		});
	});
	
	
		function gotoPage(i) {
 		var t = i;
 		var met = "${method}";
 		
 		if(met=='simple')
		document.form1.action = "TaskSearch?method=simple&page=" + t;
		
		else if(met=='type')
		{
			var type = "${type}";
			document.form1.action = "TaskSearch?method=type&page=" + t + "&type=" + type;
		}
		
		else if(met=='type2')
		{
			var type = "${type}";
			var type2 = "${type2}";
			document.form1.action = "TaskSearch?method=type2&page=" + t
					+ "&type=" + type + "&type2=" + type2;
		}

		document.form1.method = "post";
		document.form1.submit();
	}

	//判断是否显示

	function judgeShow() {
		var num = "${searchNum}";
		var i = parseInt(num);
		for (; i < 8; i++) {
			var id = i.toString();
			var currentTd = document.getElementById(id).style.visibility = "hidden";
		}
	}

	//ajax异步传值
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
				document.getElementById("goodsName").innerHTML = strs[0];
				document.getElementsByName("img2")[0].src = "imgs/" + strs[1];
				document.getElementsByName("img2")[1].src = "imgs/" + strs[1];
				document.getElementsByName("img3")[0].src = "imgs/" + strs[2];
				document.getElementsByName("img3")[1].src = "imgs/" + strs[2];
				document.getElementsByName("img4")[0].src = "imgs/" + strs[3];
				document.getElementsByName("img4")[1].src = "imgs/" + strs[3];
				//描述
				document.getElementById("tabDes").innerHTML = strs[4];
				//具体信息
				document.getElementById("taskPrice").innerHTML = strs[5];
				if (strs[6] == "0") {
					document.getElementById("taskDiscount").innerHTML = "否";
				} else {
					document.getElementById("taskDiscount").innerHTML = "是";
				}
				if (strs[7] == "0") {
					document.getElementById("taskIsrent").innerHTML = "否";
				} else {
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
		xmlhttp.open("get", "getCurrentTask?method=add&taskId=" + taskId,
				true);
		xmlhttp.send();
	}

	//用于关注商品
	//参数val用于确定我是选择了哪个需求 用于获取信息
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
				alert("关注成功！");
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
<!-- 分页效果 -->
<style>
ul {
	border: 0;
	margin: 0;
	padding: 0;
}

#pagination-flickr li {
	border: 0;
	margin: 0;
	padding: 0;
	font-size: 14px;
	list-style: none;
}



#pagination-flickr .previous-off, #pagination-flickr .next-off {
	color: #666666;
	display: block;
	float: left;
	font-weight: bold;
	padding: 3px 4px;
}

#pagination-flickr .next a, #pagination-flickr .previous a {
	font-weight: bold;
	border: solid 1px #FFFFFF;
}

#pagination-flickr .active {
	color: black;;
	font-weight: bold;
	display: block;
	float: left;
	padding: 4px 6px;
}

#pagination-flickr a:link, #pagination-flickr a:visited {
	color: #0063e3;
	display: block;
	float: left;
	padding: 3px 6px;
	text-decoration: none;
}

#pagination-flickr a:hover {
	color: black;
}
</style>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/colors.css">
<link rel="stylesheet" href="css/skeleton.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" href="css/elastislide.css" />
<link rel="stylesheet" href="css/home_flexslider.css" />

<link rel="stylesheet" href="css/light_box.css" />
<script src="js/html5.js"></script>

<div class="mainContainer sixteen container">
	<!--头部-->
	<div class="header-wrapper">
		<header class="container">
			<div class="head-right">
				<ul class="top-nav">
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


				<!-- 购物车 -->
				<section class="header-bottom">
					<div class="cart-block">
						<ul>
							<li><a href="cart.html" title="Cart">我的关注</a></li>
						</ul>
					</div>
					<!-- cart-block 结尾 -->





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
					<li class=""><a href="PersonInformation?method=gotoPerson" title="个人中心">个人中心</a></li>
					<li class=""><a href="contactUs.jsp" title="联系我们">联系我们</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<!-- 头部div结尾 -->
</div>