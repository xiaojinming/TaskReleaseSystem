<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<head>
</head>

<body><jsp:include page="head.jsp" flush="true"></jsp:include>

	<!--内容部分 -->


	<form action="RegisterServlet" method="post"
		onsubmit="return check_register()">
		<div class="inputstyle1">
			<p>
				账号:&nbsp; <span> <input type="text" name="userId" id="userid"
					 onblur="check_register_id(); " value="${userId }" /><span
					style="color: red;">*</span> <span id="userid_msg"
					style='font-size: 9px; color: red;'>${errorId }</span>
				</span>
			</p>
		</div>
		<div class="inputstyle1">
			<p>
				昵称:&nbsp; <span> <input type="text" name="userName"
					id="usernick" onblur="check_register_nick();" value="${userName }"/><span
					style="color: red;">*</span> <span id="usernick_msg"
					style='font-size: 9px; color: red;'>${errorName }</span>
				</span>
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
		</div>
		<div class="inputstyle1">
			<p>
				密码:&nbsp; <span> <input type="password" name="userPassword"
					id="userpassword" onblur="check_register_password();" /><span
					style="color: red;">*</span> <span id="userpassword_msg"
					style='font-size: 9px;  color: red;'></span>
				</span>
			</p>
		</div>
		<div class="inputstyle1">
			<p>
				学号:&nbsp; <span> <input type="text" name="userNumber"
					id="userno" onblur="check_register_no();" value="${userNumber }"/><span
					style="color: red;">*</span> <span id="userno_msg"
					style='font-size: 9px;  color: red;'>${errorNumber }</span>
				</span>
			</p>
		</div>
		<div class="inputstyle1">
			<p>
				身份证:&nbsp; <span> <input type="text" name="userIdentity"
					id="useridentity" onblur="check_register_identity();" value="${userIdentity }"/><span
					style="color: red;">*</span> <span id="useridentity_msg"
					style='font-size: 9px;  color: red;'>${errorIdentity }</span>
				</span>
			</p>
		</div>
		<div class="inputstyle1">
			<p>
				真实姓名:&nbsp; <span> <input type="text" name="userRealName"
					id="userrealname" onblur="check_register_realname();" value="${userRealName }"/> <span
					id="userrealname_msg" style='font-size: 9px;  color: red;'></span>
				</span>
			</p>
		</div>
		<div class="inputstyle1">
			<p>
				居住地址:&nbsp; <span> <input type="text" name="userLocation"
					id="userlocation" value="${userLocation }"/> <span id="username_msg" style='font-size: 12px;'></span>
				</span>
			</p>
		</div>
		<div class="inputstyle1">
			<p>
				联系电话:&nbsp; <span> <input type="text" name="userTel"
					id="usertel" onblur="check_register_tel();" value="${userTel }"/> <span
					id="usertel_msg" style='font-size: 9px;  color: red;'></span>
				</span>
			</p>
		</div>
		<div class="inputstyle1">
			<p>
				邮箱地址:&nbsp; <span> <input type="text" name="userEmail"
					id="email" onblur="check_email();" value="${userEmail }"/><span style="color: red;" >*</span>
					<span id="email_msg" style='font-size: 9px;  color: red;'>${errorEmail }</span>
				</span>
			</p>
		</div>
		<div class="inputstyle1">
			<p>
				QQ:&nbsp; <span> <input type="text" name="userQQ" id="userqq"
					onblur="check_register_qq();" value="${userQQ }"/><span style="color: red;">*</span>
					<span id="userqq_msg" style='font-size: 9px;  color: red;'></span>
				</span>
			</p>
		</div>
		<div class="inputstyle2">
			<span style="margin-top: 8px;">验证码:&nbsp;</span><span
				class="inputstyle2_input"><input style="margin-top: 8px;"
				name="code" type="text" id="number" /><span> <span
					id="imageverify"><img title="点击更换" alt="验证码"
						onclick="javascript:refresh(this);" src="ImageServlet" /><span
						id="number_msg" style='font-size: 9px; color: red;'>${errorVail }</span>
		</div>
		<div id="login">
			<input type="submit" value="注册" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="button" id="btn" value="重置" onclick="resetRegister()" />
		</div>
	</form>

	<%@include file="end.jsp"%>
</body>
</html>
