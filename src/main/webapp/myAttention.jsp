<%@ page language="java"
	import="java.util.*,com.trs.model.User,com.trs.model.Task,com.trs.dao.TaskDao"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>	
	
<jsp:include page="Personhead.jsp" flush="true"></jsp:include>
<!-- js前去分页 -->

<script type="text/javascript">
	function gotoPage(i) {
 		var t = i;
 		//查找我的关注方法
		document.form3.action = "AddAttention?method=getAtt&page=" + t ;
		document.form3.method = "post";
		document.form3.submit();
	}

	function judgeShow() {
		var num = "${attentionNum}";
		var i = parseInt(num);
		for (; i < 8; i++) {
			var id = i.toString();
			var currentTd = document.getElementById(id).style.visibility = "hidden";
		}
	}

	//ajax异步传值
	//参数val用于确定我是选择了哪个商品 用于获取商品信息
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
				//需求描述
				document.getElementById("tabDes").innerHTML = strs[4];
				//需求信息
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
	
	
	
	//用于取消关注
	//这里不用异步刷新所以不用用AJAX
	function loadXMLAttention(val) {
		var res = confirm("您确定要取消关注该需求吗？");
		if(res)
		{
			window.location.href = "AddAttention?method=delete&taskId=" + val;
		}
	}
</script>


</head>

<body onload="judgeShow()">
	<form name="form3"></form>
	<c:if test="${empty taskResult[0].taskName}">
		<script>
			alert("您还未关注任何商品，无法执行该操作！");
			history.back();
		</script>
	</c:if>


	<!-- 获取当前页数 -->
	<c:set var="Formpage" scope="session" value="1" />
	<c:if test="${not empty Formpage}">
		<c:set var="Formpage" scope="session" value="${Formpage}" />
	</c:if>

	<!-- 获取页数 -->
	<c:set var="pageNum" scope="session" value="${pageNumber}" />


	<!-- 搜索结果 -->

	<section class="content-wrapper">
	<div class="content-container container">


		<div class="heading-block">
			<h1>我的关注</h1>
			<a href="#"></a>
		</div>
		<div class="new-product-block">
			<ul class="product-grid">
				<li id="0">
					<div class="pro-img">
						<img title="分类二图片名称" alt="分类二图片名称"
							src="imgs/${taskResult[0].taskImag}" />
					</div>
					<div class="pro-content">
						<p>${taskResult[0].taskName}</p>
					</div>
					<div class="pro-price">￥${taskResult[0].taskPrice }</div>
					<div class="pro-btn-block">
						<a class="add-cart left" href="#" title="取消关注" name=9>取消关注</a> <a
							class="add-cart right quickCart inline"
							href="#quick-view-container" title="查看详情" name=1>查看详情</a>
					</div>
				</li>
				<li id="1">
					<div class="pro-img">
						<img title="分类二图片名称" alt="分类二图片名称"
							src="imgs/${taskResult[1].taskImag}" />
					</div>
					<div class="pro-content">
						<p>${taskResult[1].taskName}</p>
					</div>
					<div class="pro-price">￥${taskResult[1].taskPrice }</div>
					<div class="pro-btn-block">
						<a class="add-cart left" href="#" title="取消关注" name=10>取消关注</a> <a
							class="add-cart right quickCart inline"
							href="#quick-view-container" title="查看详情" name=2>查看详情</a>
					</div>
				</li>
				<li id="2">
					<div class="pro-img">
						<img title="分类二图片名称" alt="分类二图片名称"
							src="imgs/${taskResult[2].taskImag}" />
					</div>
					<div class="pro-content">
						<p>${taskResult[2].taskName}</p>
					</div>
					<div class="pro-price">￥${taskResult[2].taskPrice }</div>
					<div class="pro-btn-block">
						<a class="add-cart left" href="#" title="取消关注" name=11>取消关注</a> <a
							class="add-cart right quickCart inline"
							href="#quick-view-container" title="查看详情" name=3>查看详情</a>
					</div>
				</li>
				<li id="3">
					<div class="pro-img">
						<img title="分类二图片名称" alt="分类二图片名称"
							src="imgs/${taskResult[3].taskImag}" />
					</div>
					<div class="pro-content">
						<p>${taskResult[3].taskName}</p>
					</div>
					<div class="pro-price">￥${taskResult[3].taskPrice }</div>
					<div class="pro-btn-block">
						<a class="add-cart left" href="#" title="取消关注" name=12>取消关注</a> <a
							class="add-cart right quickCart inline"
							href="#quick-view-container" title="查看详情" name=4>查看详情</a>
					</div>
				</li>
			</ul>
			<ul class="product-grid">
				<li id="4">
					<div class="pro-img">
						<img title="分类二图片名称" alt="分类二图片名称"
							src="imgs/${taskResult[4].taskImag}" />
					</div>
					<div class="pro-content">
						<p>${taskResult[4].taskName}</p>
					</div>
					<div class="pro-price">￥${taskResult[4].taskPrice }</div>
					<div class="pro-btn-block">
						<a class="add-cart left" href="#" title="取消关注" name=13>取消关注</a> <a
							class="add-cart right quickCart inline"
							href="#quick-view-container" title="查看详情" name=5>查看详情</a>
					</div>
				</li>
				<li id="5">
					<div class="pro-img">
						<img title="分类二图片名称" alt="分类二图片名称"
							src="imgs/${taskResult[5].taskImag}" />
					</div>
					<div class="pro-content">
						<p>${taskResult[5].taskName}</p>
					</div>
					<div class="pro-price">￥${taskResult[5].taskPrice }</div>
					<div class="pro-btn-block">
						<a class="add-cart left" href="#" title="取消关注" name=14>取消关注</a> <a
							class="add-cart right quickCart inline"
							href="#quick-view-container" title="查看详情" name=6>查看详情</a>
					</div>
				</li>
				<li id="6">
					<div class="pro-img">
						<img title="分类二图片名称" alt="分类二图片名称"
							src="imgs/${taskResult[6].taskImag}" />
					</div>
					<div class="pro-content">
						<p>${taskResult[6].taskName}</p>
					</div>
					<div class="pro-price">￥${taskResult[6].taskPrice }</div>
					<div class="pro-btn-block">
						<a class="add-cart left" href="#" title="取消关注" name=15>取消关注</a> <a
							class="add-cart right quickCart inline"
							href="#quick-view-container" title="查看详情" name=7>查看详情</a>
					</div>
				</li>
				<li id="7">
					<div class="pro-img">
						<img title="分类二图片名称" alt="无法显示该页"
							src="imgs/${taskResult[7].taskImag}" />
					</div>
					<div class="pro-content">
						<p>${taskResult[7].taskName}</p>
					</div>
					<div class="pro-price">￥${taskResult[7].taskPrice }</div>
					<div class="pro-btn-block">
						<a class="add-cart left" href="#" title="取消关注" name=16>取消关注</a> <a
							class="add-cart right quickCart inline"
							href="#quick-view-container" title="查看详情" name=8>查看详情</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	</section>
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
				var id = $(this).attr('name');
				var taskId = 0;
				if (parseInt(id) <= 8 && parseInt(id) >= 1) {
					//获取goodsId
					switch(id)
					{
						case '1':
						goodsId = "${taskResult[0].taskId}";
						break;
						case '2':
						goodsId = "${taskResult[1].taskId}";
						break;
						case '3':
						goodsId = "${taskResult[2].taskId}";
						break;
						case '4':
						goodsId = "${taskResult[3].taskId}";
						break;
						case '5':						
						goodsId = "${taskResult[4].taskId}";
						break;
						case '6':
						goodsId = "${taskResult[5].taskId}";
						break;
						case '7':
						goodsId = "${taskResult[6].taskId}";
						break;
						case '8':
						goodsId = "${goodsResult[7].goodsId}";
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
					 alert("您还未登录，无法关注商品!");
					}
					else{
					switch(id)
					{
						case '9':
						goodsId = "${taskResult[0].taskId}";
						break;
						case '10':
						goodsId = "${taskResult[1].taskId}";
						break;
						case '11':
						goodsId = "${taskResult[2].taskId}";
						break;
						case '12':
						goodsId = "${taskResult[3].taskId}";
						break;
						case '13':						
						goodsId = "${taskResult[4].taskId}";
						break;
						case '14':
						goodsId = "${taskResult[5].taskId}";
						break;
						case '15':
						goodsId = "${goodsResult[6].goodsId}";
						break;
						case '16':
						goodsId = "${goodsResult[7].goodsId}";
						break;
						default:
							break;
					}
					}
					loadXMLAttention(taskId)
				}
				
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
							style="float:left;width: 60px; margin-left: 10px; margin-top: 10px;">商品新旧：</div>
						<div id="taskNew"
							style="width:70px; float: left; margin-top: 10px;"></div>
						<div style="float:left;width: 60px; margin-top: 10px;">上架日期：</div>
						<div id="taskDate"
							style="width:70px; float: left; margin-top: 10px;"></div>
						<br />
						<div
							style="float:left; width: 260px; margin-left: 10px; margin-top: 10px;">商品简介：</div>
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
								style="margin-left: 10px;">与卖家进行QQ聊天</a>
						</div>
						<br>
					</div>

				</div>
				<div class="clearfix"></div>
			</div>
		</section>
	</article>




		<!-- 分页 -->
	<div
		style="width:400px; margin-left:auto; margin-right:auto ;height:30px">
		<ul id="pagination-flickr">
		
			<!-- 上一页 -->
			<c:if test="${page  >= 2}" >
				<li class="previous-off">
				<a href="#" onclick="gotoPage(${page}-1)">上一页</a></li>
			</c:if>
			<c:if test="${page < 2}" >
				<li class=active> 上一页  </li>
			</c:if> 

			<!-- 打印页数 -->
 			<c:forEach var="item" varStatus="status" begin="1" end="${pageNum}">
				<c:if test="${page!=status.count}">
					<li><a href="#" onclick="gotoPage(${status.count})">${status.count}</a></li>
				</c:if>
				<c:if test="${page == status.count }">
					<li class=active>${page}</li>
				</c:if>
			</c:forEach> 
			
			<!-- 下一页 -->
			<c:if test="${page+1 <= pageNum}">
				<li class="next"><a href="#" onclick="gotoPage(${page+1})"> 下一页 </a></li>
			</c:if>
			<c:if test="${page+1 > pageNum}">
				<li class=active> 下一页  </li>
			</c:if>		 
		</ul>
	</div>

	<br>
	<br>
	<br>
	<br>


	<!-- 需求详情展示块结尾 -->
	<%@include file="end.jsp"%>

</body>
</html>