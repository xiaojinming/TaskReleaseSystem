<%@ page language="java"
	
import="java.util.*,com.trs.model.User,com.trs.model.Task"
	
contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>

<head>

<jsp:include page="Searchhead.jsp" flush="true"></jsp:include>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>搜索任务</title>

</head>

<body onload="judgeShow()">

	
<!-- 如果搜索结果为0即taskResult[0] == null 跳转回首页 -->

	<c:if test="${empty taskResult[0].taskName}">
	
	<script>
alert("没有搜索到相关任务，请重新输入！");
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
		
	<h1>搜索结果</h1>
	
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
					
<div class="pro-price">￥${taskResult[0].taskPrice }
</div>
					
<div class="pro-btn-block">
						
<a class="add-cart left" href="javascript:void(0)" title="关注该任务" name=9> 关注该任务 </a>
 <a
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
					
<div class="pro-price">￥${taskResult[1].taskPrice }
</div>
				
	<div class="pro-btn-block">
						
<a class="add-cart left" href="javascript:void(0)" title="关注该任务" name=10>关注该任务</a>
<a
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

				<div class="pro-price">￥${taskResult[2].taskPrice }
				</div>

				<div class="pro-btn-block">

					<a class="add-cart left" href="javascript:void(0)" title="关注该任务" name=11>关注该任务</a>
					<a
							class="add-cart right quickCart inline"
							href="#quick-view-container" title="查看详情" name=3>查看详情</a>

				</div>
			</li>
				
<li id="3">
	<div class="pro-img">
	<img title="分类二图片名称" alt="分类二图片名称" src="imgs/${taskResult[3].taskImag}" />

</div>
<div class="pro-content">
<p>${taskResult[3].taskName}</p>
		
</div>

<div class="pro-price">￥${taskResult[3].taskPrice }
</div>

<div class="pro-btn-block">
<a class="add-cart left" href="javascript:void(0)" title="关注该任务" name=12>关注该任务</a> 
<a
 class="add-cart right quickCart inline" href="#quick-view-container" title="查看详情" name=4>查看详情</a>

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

			<div class="pro-price">￥${taskResult[4].taskPrice }
			</div>

			<div class="pro-btn-block">

				<a class="add-cart left" href="javascript:void(0)" title="关注该任务" name=13> 关注该任务 </a>
				<a
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

			<div class="pro-price">￥${taskResult[5].taskPrice }
			</div>

			<div class="pro-btn-block">

				<a class="add-cart left" href="javascript:void(0)" title="关注该任务" name=14>关注该任务</a>
				<a
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

			<div class="pro-price">￥${taskResult[6].taskPrice }
			</div>

			<div class="pro-btn-block">

				<a class="add-cart left" href="javascript:void(0)" title="关注该任务" name=15>关注该任务</a>
				<a
						class="add-cart right quickCart inline"
						href="#quick-view-container" title="查看详情" name=7>查看详情</a>

			</div>
		</li>

		<li id="7">
			<div class="pro-img">
				<img title="分类二图片名称" alt="分类二图片名称" src="imgs/${taskResult[7].taskImag}" />

			</div>
			<div class="pro-content">
				<p>${taskResult[7].taskName}</p>

			</div>

			<div class="pro-price">￥${taskResult[7].taskPrice }
			</div>

			<div class="pro-btn-block">
				<a class="add-cart left" href="javascript:void(0)" title="关注该任务" name=16>关注该任务</a>
				<a
						class="add-cart right quickCart inline" href="#quick-view-container" title="查看详情" name=8>查看详情</a>

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
			
}
).filter(':first').click();
		
});


//获取超链接
		
$('document').ready(function() {
			
$("a").click(function() {
				
var id = $(this).attr('name');
				
var taskId = 0;
				
if (parseInt(id) <= 8 && parseInt(id) >= 1) {
					
//获取taskId
					
switch(id)
{
						
case '1':
						
taskId = "${taskResult[0].taskId}";
						
break;
						
case '2':
						
taskId = "${taskResult[1].taskId}";
						
break;
						
case '3':
						
taskId = "${taskResult[2].taskId}";
						
break;
						
case '4':
						
taskId = "${taskResult[3].taskId}";
						
break;
						
case '5':
						
taskId = "${taskResult[4].taskId}";
					
break;
						
case '6':
						
taskId = "${taskResult[5].taskId}";
						
break;
						
case '7':
						
taskId = "${taskResult[6].taskId}";
						
break;
						
case '8':
						
taskId = "${taskResult[7].taskId}";
						
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
					
 alert("您还未登录，无法关注任务!");
					
}
					
else{
					
switch(id)
					
{
						
case '8':
						
taskId = "${taskResult[0].taskId}";
						
break;
						
case '9':
						
taskId = "${taskResult[1].taskId}";
					
break;
						
case '10':
						
taskId = "${taskResult[2].taskId}";
						
break;
						
case '11':
						
taskId = "${taskResult[3].taskId}";
						
break;
						
case '12':
						
taskId = "${taskResult[4].taskId}";
						
break;
						
case '13':
						
taskId = "${taskResult[5].taskId}";
						
break;
						
case '14':
						
taskId = "${taskResult[6].taskId}";
						
break;
						
case '15':
						
taskId = "${taskResult[7].taskId}";
						
break;
						
default:
							
break;
					
}
					
loadXMLAttention(taskId);
					
}
				
}
				
			
}
);
		
}
);
	
</script>




	
<article style="display:none;"> 
<section
 id="quick-view-container" class="quick-view-wrapper">
	
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
				
<li><a class="selected" title="基本信息" href="#tabDetail">基本信息</a></li>
				
<li><a title="任务简介" href="#tabDes">任务简介</a></li>
				
<li><a title="联系对方" href="#getChat">联系对方</a></li>
			
</ul>
			
<div id="tabDetail" class="tabDetail">
				
<!-- 此处放商品信息 -->
			
<br>
需求报酬：<div id="taskPrice"></div>
				
<br> 可否小刀：<div id="taskDiscount"></div>
				
<br> 是否出租<div id="taskIsrent"></div>
				
<br> 有效时长：<div id="taskNew"></div>
				
<br> 上架日期：
<div id="taskDate"></div>
			
</div>

			
<div id="tabDes" class="tabDes">
				
<!-- 此处已放任务描述 -->
	
</div>


			
<div id="getChat" class="tabDetail">
				
<!-- 此处放联系信息 -->
				
<div id="ownerName"></div>
				
<br>
<div id="ownerRealName"></div>
				
<br>
<div id="ownerTel"></div>
				
<br>
				
<div id="ownerLocation"></div>
				
<br>
<div>
					
<a href="#" id="ownerQQ">与对方进行QQ聊天</a>
				
</div>
				
<br>
			
</div>

		
</div>
		
<div class="clearfix"></div>
	
</div>
	</section> </article>



	
<!-- 分页 -->
	
<div style="width:400px; margin-left:auto; margin-right:auto ;height:30px">
		
<ul id="pagination-flickr" >
		
			
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
