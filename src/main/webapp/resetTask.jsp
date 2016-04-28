<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="com.trs.model.User"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
	//下拉联动
	function Change() {
		var two = new Array();
		two[0] = new Array();
		two[1] = new Array();
		two[2] = new Array();
		two[3] = new Array();
		two[4] = new Array();

		two[1][0] = "--请选择--";
		two[1][1] = "衣着服饰";
		two[1][2] = "数码配件";
		two[1][3] = "宿舍电器";
		two[1][4] = "学习资料";
		two[1][5] = "其他";

		two[2][0] = "--请选择--";
		two[2][1] = "代步工具";
		two[2][2] = "通讯账号";
		two[2][3] = "****";
		two[2][4] = "****";
		two[2][5] = "其他";

		two[3][0] = "--请选择--";
		two[3][1] = "传单类";
		two[3][2] = "派送类";
		two[3][3] = "代理类";
		two[3][4] = "其他";

		two[4][0] = "--请选择--";
		two[4][1] = "快递代领";
		two[4][2] = "顺风车";
		two[4][3] = "****";
		two[4][4] = "其他";

		var i, Index;
		Index = document.form.taskType.selectedIndex;
		iCount = 0;
		while (two[Index][iCount] != null)
			//计算选定一级分类的二级分类个数
			iCount++;
		document.form.goodsType2.length = iCount;//改变下拉菜单选项数
		for (i = 0; i <= iCount - 1; i++) {
			document.form.taskType2[i] = new Option(two[Index][i]);
			document.form.taskType2[i].value = i;
			document.form.taskType2.focus();
		}

	}

	//重置
	function resetGoodsInfo() {
		document.getElementById("taskDiscount").value = "";
		document.getElementById("taskName").value = "";
		document.getElementById("taskPrice").value = "";
		document.getElementById("ownerId").value = "";
		document.getElementById("isRent").value = "";
		document.getElementById("taskNew").value = "";
		document.getElementById("taskDesc").value = "";
		document.getElementById("taskTypeId").value = "";
		document.getElementById("taskTypeId2").value = "";
	}

	//获取radio

	function getRadio() {
		var value = document.getElementsByName("radiobutton");
		var radiovalue;
		for (var i = 0; i < value.length; i++) {
			if (value[i].checked)
				radiovalue = i;
		}

		value = document.getElementsByName("radiobutton2");
		var radiovalue2;
		for (var i = 0; i < value.length; i++) {
			if (value[i].checked)
				radiovalue2 = i;
		}

		document.form.action = "ResetTask?method=resetInfo&radiovalue=" + radiovalue
				+ "&radiovalue2=" + radiovalue2 + "&taskId=${taskId}";
		document.form.method = "post";
		document.form.submit();
	}
	
	
	//初始化设置
	function start()
	{
		var discount = "${taskDiscount}";
		var taskType = "${taskTypeId}";
		var demandType2 = "${taskTypeId2}";
		var isRent = "${isRent}" ;
		//radio1
		if(discount=="0")
			document.getElementById("discount0").checked = true;
		else
			document.getElementById("discount1").checked = true;
		
		//selsect
		var type1 = parseInt(taskType);
		document.getElementById("taskType").options[type1].selected = "true";
		var type2 = parseInt(taskType2);
		Change();
		document.getElementById("taskType2").options[type2].selected ="true";
		
		//radio2
		if(isRent == "0")
			document.getElementById("isRent0").checked = "true";
		else
			document.getElementById("isRent1").checked = "true";		
			
		
		//taskDesc
		document.getElementById("taskDesc").value = "${taskDesc}";
	}
</script>
</head>
<body onload="start()">
	<div class="mainContainer sixteen container">
		<!--头部-->
		<div class="header-wrapper">
			<header class="container">
				<div class="head-right">
					<ul class="top-nav">
						<c:if test="${empty currentUser}">
							<script>
								alert("登录超时，请重新登录！");
								window.location.href = "login.jsp";
							</script>
						</c:if>
						<c:if test="${not empty currentUser }">
							<li class=""><a href="PersonInformation?method=gotoPerson"
							title="个人中心">个人中心</a></li>
						<li class=""><a href="exitUser" title="网站首页">退出帐号</a></li>
						</c:if>
					</ul>

					<section class="header-bottom">
						<!-- <input type="hidden" id="ownerId" value= /> -->


					<!--  购物车 -->
						<div class="cart-block">
							<ul>
								<li><a href="cart.html" title="Cart">我的关注</a></li>
							</ul>
						</div>
						<!-- cart-block 结尾 -->
						<div class="search-block">
							<form action="TaskSearch?method=simple" method="post">
								<input type="text" value="" name="taskName"/> <input type="submit" value="搜索"
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
						<li class="active"><a href="addTask	.jsp" title="我要发布需求">我要发布需求</a></li>
						<!--<li class=""><a href="login.jsp" title="登录网站">登录网站</a></li>-->
						<li class=""><a href="PersonInformation?method=gotoPerson" title="个人中心">个人中心</a></li>
						<li class=""><a href="contactUs.jsp" title="联系我们">联系我们</a></li>

					</ul>
				</nav>
			</header>
		</div>
		<!-- 头部div结尾 -->
	</div>




<!-- 开始 -->

	<div style="margin: 20px auto; width: 600px;">
		<form name="form" action="TaskAdd" method="post">
			<table style="margin: 0px auto; width: 600px; height: 380px;">
				<tr height="10">
					<td colspan="4"></td>
				</tr>

				<tr height="10">
					<td width="20%"></td>
					<td width="12%">需求名：</td>
					<td><input type="text" value="${taskName }" name="taskName"
						id="taskName" /></td>
					<td width="30%"><font color="red">&nbsp;&nbsp;&nbsp;${errorId }</font></td>
				</tr>

				<tr height="10">
					<td width="20%"></td>
					<td width="12%">需求报酬：</td>
					<td><input type="text" value="${taskPrice }"
						name="taskPrice" id="taskPrice" /></td>
					<td width="30%"><font color="red">&nbsp;&nbsp;&nbsp;${errorPrice }</font></td>
				</tr>


				<tr height="10">
					<td width="20%"></td>
					<td width="8%">可小刀：</td>
					<td><input type="radio" value="radiobutton" name="radiobutton"
						value=0 id="discount0" />否</td>
					<td><input type="radio" value="radiobutton" name="radiobutton"
						value=1 id="discount1"/>是</td>
					<td width="30%"><font color="red">&nbsp;&nbsp;&nbsp;${errorPassword }</font></td>
				</tr>


				<tr height="10">
					<td width="20%"></td>
					<td width="12%">有效时长：</td>
					<td><input type="text" value="${taskNew }" name="taskNew"
						id="taskNew" /></td>
					<td width="30%"><font color="red">&nbsp;&nbsp;&nbsp;${errorId }</font></td>
				</tr>

				<tr height="10">
					<td width="20%"></td>
					<td width="12%">需求类型：</td>
					<td><select name="taskType" id="taskType" onchange=Change() >
							<option selected="selected">--请选择--</option>
							<option value="1">求购</option>
							<option value="2">求租</option>
							<option value="3">兼职</option>
							<option value="4">其他</option>
					</select></td>
					<td><select name="taskType2" id="taskType2"
						style="text-align:center">
							<option selected="selected">--请选择--</option>
					</select></td>
					<td width="30%"></td>
				</tr>

				<tr height="10">
					<td width="20%"></td>
					<td width="8%">出租：</td>
					<td><input type="radio" value="radiobutton"
						name="radiobutton2" value=0 id="isRent0" />否</td>
					<td><input type="radio" value="radiobutton"
						name="radiobutton2" value=1 id="isRent1"/>是</td>
					<td width="30%"><font color="red">&nbsp;&nbsp;&nbsp;${errorPassword }</font></td>
				</tr>

				<tr height="10">
					<td width="20%"></td>
					<td width="28%">需求描述：</td>
			</table>
			<div style="width: 660px; margin: 0px auto; height:200px;">
				<div style="margin: 0px auto 10px; width: 500px;">
					<textarea name="taskDesc" cols="60" rows="10" id="taskDesc"></textarea>
				</div>
				<div id="login">
					<input type="submit" onclick="getRadio()" value="确认" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="button" id="btn" value="重置" onclick="reset()" />
				</div>
			</div>
		</form>
	</div>
	<%@include file="end.jsp"%>
</body>
</html>
