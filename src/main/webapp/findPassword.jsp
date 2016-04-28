<%@ page language="java" import="com.trs.model.User"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
<meta charset="utf-8">

<title>找回密码</title>

</head>
<body>
<jsp:include page="head.jsp" flush="true"></jsp:include>

	<!--内容部分 -->
	<form action="findPassServlet?method=find" method="post"
		onsubmit="return check_null()">
		<div class="inputstyle1">
			<p>
				帐号:&nbsp; <span> <input type="text" value="${userId }"
					name="userId" id="userId" /> <span id="username_msg"
					style='font-size: 12px;'></span>
				</span>
			</p>
			<span id="name_msg"></span>
		</div>
		<div class="inputstyle1">
			<p>
				邮箱:&nbsp; <span> <input type="text" value="${userEmail }"
					name="userEmail" id="userEmail" /> <span id="pwd_msg"></span>
				</span>
			</p>
		</div>
		
		<div id="login">
			<input type="submit" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="button" id="btn" value="重置" onclick="reset()" />
		</div>

		<p align="center"><font color="red">${error }</font></p>
	</form>

	<!--尾部-->
	<%@include file="end.jsp" %>
</body>
</html>