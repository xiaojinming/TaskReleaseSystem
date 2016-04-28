<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java"
	import="java.util.*,com.trs.dao.UserDao,com.trs.model.*"
	pageEncoding="utf-8"%>

<meta charset="utf-8">

<body onload="setVisible()">

	<jsp:include page="Personhead.jsp" flush="true"></jsp:include>

	<div class="personpage-place">
		<div class="myinfo-place">
			<div class="resetpwd-title">
				<span>基本信息</span>
			</div>
			<div class="resetpwd-title-dec"></div>
			<div class="myinfo">
				<form action="PersonInformation?method=userInfo" method="post">
					<div class="inputstyle1">
						<p>
							账号:&nbsp; <span>${currentUser.userId }</span>
						</p>
					</div>
					<div class="inputstyle1">
						<p>
							昵称:&nbsp; <span>${currentUser.userName}</span>
						</p>
					</div>
					<div class="inputstyle1">
						<p>
							性别:&nbsp; <span> <select name="userSex" id="userSex"
								style="text-align:center">
									<option value="男">男</option>
									<option value="女">女</option>
							</select><span style='font-size: 12px;'></span>
							</span>
						</p>
						<span id="name_msg"></span>
					</div>
					<div class="inputstyle1">
						<p>
							真实姓名:&nbsp; <span><input type="text"
								value=" ${currentUser.userRealName}" name="userRealName" /> </span>
						</p>
					</div>
					<div class="inputstyle1">
						<p>
							居住地址:&nbsp; <span> <input type="text"
								value=" ${currentUser.userLocation}" name="userLocation" />
							</span>
						</p>
					</div>
					<div class="inputstyle1">
						<p>
							联系电话:&nbsp; <span> <input type="text"
								value="${currentUser.userTel }" name="userTel" id="usertel" />
								<span id="usertel_msg" style='font-size: 9px;  color: red;'></span>
							</span>
						</p>
						<span id="name_msg"></span>
					</div>
					<div class="inputstyle1">
						<p>
							QQ:&nbsp; <span> <input type="text"
								value="${currentUser.userQQ }" name="userQQ" id="userqq"
								onblur="check_register_qq();" /><span style="color: red;">*</span>
								<span id="userqq_msg" style='font-size: 9px;  color: red;'></span>
							</span>
						</p>
						<span id="name_msg"></span>
					</div>
					<div id="login">
						<input type="submit" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" id="btn" value="重置" onclick="reset()" />
					</div>

					<div align="center">
						<span style="color: red;">${result} </span>
					</div>
				</form>
			</div>
		</div>
		<div class="myinfo-place">
			<div class="resetpwd-place">
				<div class="resetpwd-title">
					<span>修改密码</span>
				</div>
				<div class="resetpwd-title-dec"></div>
				<div align="center" style="height: 140px;">

					<form name="form1" action="findPassServlet?method=reset"
						style="margin-top:80px; display: block; height: 120px;"
						method="post" onSubmit="javascript:return (checkPassword());">
						<input type="hidden" name="userid" value=${currentUser.userId } />

						<div class="inputstyle1" align="left">
							<p>
								新密码:&nbsp;&nbsp;&nbsp;&nbsp; <span> <input
									type="password" value="${password1 }" name="password1"
									id="password1" /> <span id="username_msg"
									style='font-size: 12px;'></span>
								</span>
							</p>
							<span id="name_msg"></span>
						</div>
						<div class="inputstyle1" align="left">
							<p>
								确认密码:&nbsp; <span> <input type="password"
									value="${password2 }" name="password2" id="password2" /> <span
									id="pwd_msg"></span>
								</span>
							</p>
						</div>

						<div id="login" align="center">
							<input type="submit" value="修改" />
						</div>

						<br> <br> <br> <br>

					</form>
				</div>
			</div>

			<%
				Task[] taskResult = (Task[]) session.getAttribute("taskResult");
			%>
			<div class="myattention-place">
				<div class="resetpwd-title">
					<span>我的关注</span>
					<div class="myattention-content">
						<div class="myattention-content-divide">
							<a href="#quick-view-container" id="1"><img
								src="imgs/${taskResult[0].taskImag}" id="1"
								style="width: 178px; height: 178px;" /></a>
						</div>
						<div class="myattention-content-divide">
							<a href="#quick-view-container" id="2"><img
								src="imgs/${taskResult[1].taskImag}" id="1"
								style="width: 178px; height: 178px;" /></a>
						</div>
						<div class="myattention-content-divide">
							<a href="#quick-view-container" id="3"><img
								src="imgs/${taskResult[2].taskImag}" id="1"
								style="width: 178px; height: 178px;" /></a>
						</div>
						<div class="myattention-content-divide">
							<a href="#quick-view-container" id="4"><img
								src="imgs/${taskResult[3].taskImag}" id="1"
								style="width: 178px; height: 178px;" /></a>
						</div>
					</div>
					<a href="AddAttention?method=getAtt">更多关注需求</a>
				</div>
				<div class="resetpwd-title-dec"></div>
			</div>
		</div>
		<section class="content-wrapper">
			<div class="content-container container">
				<div class="resetpwd-title">
					<span>我的发布</span>
				</div>


				<div class="feature-block">
					<ul id="mix" class="product-grid">
						<li id="100">
							<div class="pro-img">
								<img width=200 height=200 title="分类一图片名称" alt="分类一图片名称"
									src="imgs/${myTask[0].taskImag}" />
							</div>
							<div class="pro-hover-block">
								<h4 class="pro-name">${myTask[0].taskName }</h4>
								<div class="link-block">
									<a href="#quick-view-container" class="quickllook inline"
										title="查看详情" id=1>查看详情</a> <a href="#" class="quickproLink"
										title="更改需求信息" id=9>更改需求信息</a>
								</div>
								<div class="pro-price">￥ ${myTask[0].taskPrice }</div>
							</div>
						</li>
						<li id="101">
							<div class="pro-img">
								<img title="分类一图片名称" alt="分类一图片名称"
									src="imgs/${myTask[1].taskImag}" />
							</div>
							<div class="pro-hover-block">
								<h4 class="pro-name">${myTask[1].taskName }</h4>
								<div class="link-block">
									<a href="#quick-view-container" class="quickllook inline"
										title="查看详情" id=2>查看详情</a> <a href="#" class="quickproLink"
										title="更改需求信息" id=10>更改需求信息</a>
								</div>
								<div class="pro-price">￥ ${myTask[1].taskPrice }</div>
							</div>
						</li>
						<li id="102">
							<div class="pro-img">
								<img title="分类一图片名称" alt="分类一图片名称"
									src="imgs/${myTask[2].taskImag}" />
							</div>
							<div class="pro-hover-block">
								<h4 class="pro-name">${myTask[2].taskName }</h4>
								<div class="link-block">
									<a href="#quick-view-container" class="quickllook inline"
										title="查看详情" id=3>查看详情</a> <a href="#" class="quickproLink"
										title="更改需求信息" id=11>更改需求信息</a>
								</div>
								<div class="pro-price">￥ ${myTask[2].taskPrice }</div>
							</div>
						</li>
						<li id="103">
							<div class="pro-img">
								<img title="分类一图片名称" alt="分类一图片名称"
									src="imgs/${myTask[3].taskImag}" />
							</div>
							<div class="pro-hover-block">
								<h4 class="pro-name">${myTask[3].taskName }</h4>
								<div class="link-block">
									<a href="#quick-view-container" class="quickllook inline"
										title="查看详情" id=4>查看详情</a> <a href="#" class="quickproLink"
										title="更改需求信息" id=12>更改需求信息</a>
								</div>
								<div class="pro-price">￥ ${myTask[3].taskPrice }</div>
							</div>
						</li>
						<li id="104">
							<div class="pro-img">
								<img title="分类一图片名称" alt="分类一图片名称"
									src="imgs/${myTask[4].taskImag}" />
							</div>
							<div class="pro-hover-block">
								<h4 class="pro-name">${myTask[4].taskName }</h4>
								<div class="link-block">
									<a href="#quick-view-container" class="quickllook inline"
										title="查看详情" id=5>查看详情</a> <a href="#" class="quickproLink"
										title="更改需求信息" id=13>更改需求信息</a>
								</div>
								<div class="pro-price">￥ ${myTask[4].taskPrice }</div>
							</div>
						</li>

						<li id="105">
							<div class="pro-img">
								<img title="分类一图片名称" alt="分类一图片名称"
									src="imgs/${myTask[5].taskImag}" />
							</div>
							<div class="pro-hover-block">
								<h4 class="pro-name">${myTask[5].taskName }</h4>
								<div class="link-block">
									<a href="#quick-view-container" class="quickllook inline"
										title="查看详情" id=6>查看详情</a> <a href="#" class="quickproLink"
										title="更改需求信息" id=14>更改需求信息</a>
								</div>
								<div class="pro-price">￥ ${myTask[5].taskPrice }</div>
							</div>
						</li>

						<li id="106">
							<div class="pro-img">
								<img title="分类一图片名称" alt="分类一图片名称" src="imgs/${myTask[6].taskImag}" />
							</div>
							<div class="pro-hover-block">
								<h4 class="pro-name">${myTask[6].taskName }</h4>
								<div class="link-block">
									<a href="#quick-view-container" class="quickllook inline"
										title="查看详情" id=7>查看详情</a> <a href="#" class="quickproLink"
										title="更改需求信息" id=15>更改需求信息</a>
								</div>
								<div class="pro-price">￥ ${myTask[6].taskPrice }</div>
							</div>
						</li>

						<li id="107">
							<div class="pro-img">
								<img title="分类一图片名称" alt="分类一图片名称"
									src="imgs/${myTask[7].taskImag }" />
							</div>
							<div class="pro-hover-block">
								<h4 class="pro-name">${myTask[7].taskName }</h4>
								<div class="link-block">
									<a href="#quick-view-container" class="quickllook inline"
										title="查看详情" id=8>查看详情</a> <a href="#" class="quickproLink"
										title="更改需求信息" id=16>更改需求信息</a>
								</div>
								<div class="pro-price">￥ ${myTask[7].taskPrice }</div>
							</div>
						</li>




					</ul>

					<p>
						<a href="PersonInformation?method=mytask">查看所有我需求</a>
					</p>
				</div>
			</div>

		</section>
	</div>



	<!--商品详情展示块-->
	<script type="text/javascript">
		jQuery(function() {
			var tabContainers = jQuery('div.tabs > div');
			tabContainers.hide().filter(':first').show();
			jQuery('div.tabs ul.tabNavigation a').click(function() {
				tabContainers.hide();
				tabContainers.filter(this.hash).show();
				jQuery('div.tabs ul.tabNavigation a').removeClass('selected');
				jQuery(this).addClass('selected');
				return false;
			}).filter(':first').click();
		});


		//获取超链接
		$('document').ready(function() {
			$("a").click(function() {
				var id = $(this).attr('id');
				var taskId = 0;
				if (parseInt(id) <= 8 && parseInt(id) >= 1) {
					//获取goodsId
					//switch 记得加' '
					switch(id)
					{
						case '1':
						taskId = "${myTask[0].taskId}";
						break;
						case '2':
						taskId = "${myTask[1].taskId}";
						break;
						case '3':
						taskId = "${myTask[2].taskId}";
						break;
						case '4':
						taskId = "${myTask[3].taskId}";
						break;
						case '5':						
						taskId = "${myTask[4].taskId}";
						break;
						case '6':
						taskId = "${myTask[5].taskId}";
						break;
						case '7':
						taskId = "${myTask[6].taskId}";
						break;
						case '8':
						taskId = "${myTask[7].taskId}";
						break;
						default:
							break;
					}
					loadXMLDoc(taskId);
				} 
				else if(parseInt(id) <= 16 && parseInt(id) >= 9)
				{
					var user = "${currentUser.userId}";
					if(user == "")
					{
					 alert("您还未登录，无法关注需求!");
					}
					else{
					switch(id)
					{
						case '9':
						taskId = "${myTask[0].taskId}";
						break;
						case '10':
						taskId = "${myTask[1].taskId}";
						break;
						case '11':
						taskId = "${myTask[2].taskId}";
						break;
						case '12':
						taskId = "${myTask[3].taskId}";
						break;
						case '13':						
						taskId = "${myTask[4].taskId}";
						break;
						case '14':
						taskId = "${myTask[5].taskId}";
						break;
						case '15':
						taskId = "${myTask[6].taskId}";
						break;
						case '16':
						taskId = "${myTask[7].taskId}";
						break;
						default:
							break;
					}
					loadXMLAttention(taskId)
				}}
				
			});
		});
	</script>





	<article style="display:none;">
		<section id="quick-view-container" class="quick-view-wrapper">
			<div class="quick-view-container">
				<div class="quick-view-left">

					<div id="taskName"></div>

					<div class="caseImg03 w1002">
						<div class="slideCase03">
							<div class="caselayBox">
								<div class="casehtml"></div>
							</div>
							<div class="bd03">
								<ul>
									<li class="clearfix">
										<div id="img1" class="smallImg03">
											<img name="img2" src="" />
											<div class="hidden">
												<img name="img2" src="" />
											</div>
										</div>
										<div class="smallImg03">
											<img name="img3" src="" />
											<div class="hidden">
												<img name="img3" src="" />
											</div>
										</div>
										<div class="smallImg03">
											<img name="img4" src="" />
											<div class="hidden">
												<img name="img4" src="" />
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>


					<!--  <div class="product-img-box">
						<p class="product-image">
							<img src="imgs/noimg.jpg" title="需求名称" alt="需求名称" />
						</p>
						<ul class="thum-img">
							<li><img src="images/quick_thum_img.png" title="" alt="" /></li>
							<li><img src="images/quick_thum_img.png" title="" alt="" /></li>
						</ul>
					</div>-->
				</div>
				<div class="quick-view-right tabs">
					<ul class="tab-block tabNavigation">
						<li><a class="selected" title="基本信息" href="#tabDetail">基本信息</a></li>
						<li><a title="联系对方" href="#getChat">联系对方</a></li>
					</ul>
					<div id="tabDetail" class="tabDetail">
						<!-- 此处放需求信息 -->
						<div style="float:left;width: 60px; margin-left: 10px;">需求报酬：</div>
						<div id="taskPrice" style="width:70px; float: left;"></div>
						<div style="float:left;width: 60px;">可否小刀：</div>
						<div id="taskDiscount" style="width:90px; float: left;"></div>
						<div style="float:left;width: 60px;">是否出租：</div>
						<div id="taskIsrent" style="width:25px; float: left;"></div>
						<br />
						<div
							style="float:left;width: 60px; margin-left: 10px; margin-top: 10px;">需求时长：</div>
						<div id="taskNew"
							style="width:70px; float: left; margin-top: 10px;"></div>
						<div style="float:left;width: 60px; margin-top: 10px;">上架日期：</div>
						<div id="taskDate"
							style="width:70px; float: left; margin-top: 10px;"></div>
						<br />
						<div
							style="float:left; width: 260px; margin-left: 10px; margin-top: 10px;">需求简介：</div>
						<div id="tabDes"
							style="word-break:break-all; float: left; margin: 5px 0px 0px 10px; width: 360px; height: 240px; color: gray; text-indent: 2em;">
						</div>
					</div>



					<div id="getChat" class="tabDetail">
						<!-- 此处放联系信息 -->
						<div id="ownerName" style="margin-left: 10px;"></div>
						<br>
						<div id="ownerRealName" style="margin-left: 10px;"></div>
						<br>
						<div id="ownerTel" style="margin-left: 10px;"></div>
						<br>
						<div id="ownerLocation" style="margin-left: 10px;"></div>
						<br>
						<div>
							<a href="#" target="_blank" id="ownerQQ"
								style="margin-left: 10px;">与对方进行QQ聊天</a>
						</div>
						<br>
					</div>

				</div>
				<div class="clearfix"></div>
			</div>
		</section>
	</article>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>



	<!--尾部  -->
	<%@include file="end.jsp"%>
</ body>
</ html>
