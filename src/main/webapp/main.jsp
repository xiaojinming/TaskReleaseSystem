<%@ page language="java"
	import="java.util.*,com.trs.model.User,com.trs.model.Task"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="utf-8">
<head>
<title>欢迎光临校友帮</title>
	<c:if test="${empty lastTech }">
		<script>
			window.location.href = "getLastTask";
		</script>
	</c:if>
</head>


<body>
	<jsp:include page="Mainhead.jsp" flush="true"></jsp:include>

	<!--商品展示块-->
	<!-- 隐藏表单用来获取选择的商品 -->

	<section class="content-wrapper">
		<div class="content-container container">
			<div class="heading-block">
				<h1>最新发布</h1>
			</div>
			<div class="feature-block">
				<ul id="mix" class="product-grid">
					<li>
						<div class="pro-img">
							<img width=200 height=200 title="分类一图片名称" alt="分类一图片名称"
								 src="imgs/${lastTech[0].taskImag }" />
						</div>
						<div class="pro-hover-block">
							<h4 class="pro-name">${lastTech[0].taskName }</h4>
							<div class="link-block">
								<a href="#quick-view-container" class="quickllook inline"
								   title="查看详情" id=1>查看详情</a> <a href="javascript:void(0)"
																 class="quickproLink" title="添加关注" id=9>添加关注</a>
							</div>
							<div class="pro-price">￥ ${lastTech[0].taskPrice }</div>
						</div>
					</li>
					<li>
						<div class="pro-img">
							<img title="分类一图片名称" alt="分类一图片名称"
								 src="imgs/${lastTech[1].taskImag }" />
						</div>
						<div class="pro-hover-block">
							<h4 class="pro-name">${lastTech[1].taskName }</h4>
							<div class="link-block">
								<a href="#quick-view-container" class="quickllook inline"
								   title="查看详情" id=2>查看详情</a> <a href="javascript:void(0)"
																 class="quickproLink" title="添加关注" id=10>添加关注</a>
							</div>
							<div class="pro-price">￥ ${lastTech[1].taskPrice }</div>
						</div>
					</li>
					<li>
						<div class="pro-img">
							<img title="分类一图片名称" alt="分类一图片名称"
								 src="imgs/${lastTech[2].taskImag }" />
						</div>
						<div class="pro-hover-block">
							<h4 class="pro-name">${lastTech[2].taskName }</h4>
							<div class="link-block">
								<a href="#quick-view-container" class="quickllook inline"
								   title="查看详情" id=3>查看详情</a> <a href="javascript:void(0)"
																 class="quickproLink" title="添加关注" id=11>添加关注</a>
							</div>
							<div class="pro-price">￥ ${lastTech[2].taskPrice }</div>
						</div>
					</li>
					<li>
						<div class="pro-img">
							<img title="分类一图片名称" alt="分类一图片名称"
								 src="imgs/${lastTech[3].taskImag }" />
						</div>
						<div class="pro-hover-block">
							<h4 class="pro-name">${lastTech[3].taskName }</h4>
							<div class="link-block">
								<a href="#quick-view-container" class="quickllook inline"
								   title="查看详情" id=4>查看详情</a> <a href="javascript:void(0)"
																 class="quickproLink" title="添加关注" id=12>添加关注</a>
							</div>
							<div class="pro-price">￥ ${lastTech[3].taskPrice }</div>
						</div>
					</li>
					<li>
						<div class="pro-img">
							<img title="分类一图片名称" alt="分类一图片名称"
								 src="imgs/${lastTech[4].taskImag }" />
						</div>
						<div class="pro-hover-block">
							<h4 class="pro-name">${lastTech[4].taskName }</h4>
							<div class="link-block">
								<a href="#quick-view-container" class="quickllook inline"
								   title="查看详情" id=5>查看详情</a> <a href="javascript:void(0)"
																 class="quickproLink" title="添加关注" id=13>添加关注</a>
							</div>
							<div class="pro-price">￥ ${lastTech[4].taskPrice }</div>
						</div>
					</li>
					<li>
						<div class="pro-img">
							<img title="分类一图片名称" alt="分类一图片名称"
								 src="imgs/${lastTech[5].taskImag }" />
						</div>
						<div class="pro-hover-block">
							<h4 class="pro-name">${lastTech[5].taskName }</h4>
							<div class="link-block">
								<a href="#quick-view-container" class="quickllook inline"
								   title="查看详情" id=6>查看详情</a> <a href="javascript:void(0)"
																 class="quickproLink" title="添加关注" id=14>添加关注</a>
							</div>
							<div class="pro-price">￥ ${lastTech[5].taskPrice }</div>
						</div>
					</li>
					<li>
						<div class="pro-img">
							<img title="分类一图片名称" alt="分类一图片名称"
								 src="imgs/${lastTech[6].taskImag }" />
						</div>
						<div class="pro-hover-block">
							<h4 class="pro-name">${lastTech[6].taskName }</h4>
							<div class="link-block">
								<a href="#quick-view-container" class="quickllook inline"
								   title="查看详情" id=7>查看详情</a> <a href="javascript:void(0)"
																 class="quickproLink" title="添加关注" id=15>添加关注</a>
							</div>
							<div class="pro-price">￥ ${lastTech[6].taskPrice }</div>
						</div>
					</li>
					<li>
						<div class="pro-img">
							<img title="分类一图片名称" alt="分类一图片名称"
								 src="imgs/${lastTech[7].taskImag }" />
						</div>
						<div class="pro-hover-block">
							<h4 class="pro-name">${lastTech[7].taskName }</h4>
							<div class="link-block">
								<a href="#quick-view-container" class="quickllook inline"
								   title="查看详情" id=8>查看详情</a> <a href="javascript:void(0)"
																 class="quickproLink" title="添加关注" id=16>添加关注</a>
							</div>
							<div class="pro-price">￥ ${lastTech[7].taskPrice }</div>
						</div>
					</li>
				</ul>

				<p>
					<a href="DemandsSearch?method=simple&taskName=">所有商品</a>
				</p>
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
				var id = $(this).attr('id');
				var taskId = 0;
				if (parseInt(id) <= 8 && parseInt(id) >= 1) {
					//获取taskId
					//switch 记得加' '
					switch(id)
					{
						case '1':
						taskId = "${lastTech[0].taskId}";
						break;
						case '2':
						taskId = "${lastTech[1].taskId}";
						break;
						case '3':
						taskId = "${lastTech[2].taskId}";
						break;
						case '4':
						taskId = "${lastTech[3].taskId}";
						break;
						case '5':						
						taskId = "${lastTech[4].taskId}";
						break;
						case '6':
						taskId = "${lastTech[5].taskId}";
						break;
						case '7':
						taskId = "${lastTech[6].taskId}";
						break;
						case '8':
						taskId = "${lastTech[7].taskId}";
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
						taskId = "${lastTech[0].taskId}";
						break;
						case '10':
						taskId = "${lastTech[1].taskId}";
						break;
						case '11':
						taskId = "${lastTech[2].taskId}";
						break;
						case '12':
						taskId = "${lastTech[3].taskId}";
						break;
						case '13':						
						taskId = "${lastTech[4].taskId}";
						break;
						case '14':
						taskId = "${lastTech[5].taskId}";
						break;
						case '15':
						taskId = "${lastTech[6].taskId}";
						break;
						case '16':
						taskId = "${lastTech[7].taskId}";
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

				</div>
				<div class="quick-view-right tabs">
					<ul class="tab-block tabNavigation">
						<li><a class="selected" title="需求详细描述" href="#tabDetail">需求详细描述</a></li>
						<li><a title="联系对方" href="#getChat">联系对方</a></li>
					</ul>
					
					<div id="tabDetail" class="tabDetail">
						<!-- 此处放需求信息 -->
						<div style="float:left;width: 60px; margin-left: 10px;">需求的报酬：</div>
						<div id="taskPrice" style="width:70px; float: left;"></div>
						<div style="float:left;width: 60px;">可否小刀：</div>
						<div id="taskDiscount" style="width:90px; float: left;"></div>
						<div style="float:left;width: 60px;">可否出租：</div>
						<div id="taskIsrent" style="width:25px; float: left;"></div>
						<br/>  
						<div style="float:left;width: 60px; margin-left: 10px; margin-top: 10px;">有效时长：</div>
						<div id="taskNew" style="width:70px; float: left; margin-top: 10px;"></div>
						<div style="float:left;width: 60px; margin-top: 10px;">上架日期：</div>
						<div id="taskDate" style="width:70px; float: left; margin-top: 10px;"></div>
						<br/>
						<div style="float:left; width: 260px; margin-left: 10px; margin-top: 10px;">需求描述：</div>
						<div id="tabDes" style="word-break:break-all; float: left; margin: 5px 0px 0px 10px; width: 360px; height: 240px; color: gray; text-indent: 2em;">
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
							<a href="javascript:void(0)" target="_blank" id="ownerQQ" style="margin-left: 10px;">与对方进行QQ聊天</a>
						</div>
						<br>
					</div>

				</div>
				<div class="clearfix"></div>
			</div>
		</section>
	</article>
	<!-- 商品详情展示块结尾 -->

	<%@include file="end.jsp"%>

	<script type="text/javascript">
		jQuery(".slideCase03").slide({
			titCell : ".hd03 ul",
			mainCell : ".bd03 ul",
			autoPage : true,
			effect : "top",
			autoPlay : true,
			vis : 3
		});
	</script>
</body>
</html>
