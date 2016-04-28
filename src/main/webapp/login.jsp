<%@ page language="java" import="com.trs.model.User"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 引入头部 -->
<body>
<jsp:include page="head.jsp" flush="true" ></jsp:include>
<title>登录到校友帮</title>
<form action="LoginServlet" method="post"
	onsubmit="return check_login()">
	<div style="position:relative;">
	<div class="inputstyle1">
		<p>
			账号:&nbsp; <span> <input type="text" value="${userId }"
				name="userId" id="username" /> <span id="username_msg"
				style='font-size: 12px;'></span>
			</span>
		</p>
		<span id="name_msg"></span>
	</div>
	<div class="inputstyle1">
		<p>
			密码:&nbsp; <span> <input type="password" value="${password }"
				name="password" id="pwd" /> <span id="pwd_msg"><a
					href="findPassword.jsp">忘记密码？</a></span>
			</span>
		</p>
	</div>
	<div class="inputstyle2">
		<span style="margin-top: 8px;">验证码:&nbsp;</span> <span
			class="inputstyle2_input"> <input style="margin-top: 8px;"
			value="${code }" name="code" type="text" id="number"></span> <span
			id="imageverify"><img title="点击更换" alt="验证码"
			onclick="javascript:refresh(this);" src="ImageServlet"></span> <span
			id="number_msg" style='font-size: 12px; padding-top: 8px;'></span>
	</div>
	<div id="login">
		<font size=2px color="red">${error }</font> <input type="submit"
			value="登陆" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" id="btn" value="注册" onclick="gotoRegister()" />
	</div>
	</div>
</form>

<!-- 引入尾部 -->
	<%@include file="end.jsp"%>
</body>
</html>