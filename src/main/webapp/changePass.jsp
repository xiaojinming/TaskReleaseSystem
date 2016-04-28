<%@ page language="java" import="java.util.*,com.trs.dao.UserDao"
	pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录到校友帮</title>
<jsp:include page="head.jsp" flush="true"></jsp:include>
</head>
<body>
	<div align="center" style="padding-top: 50px;">
		<form name="form1" action="PersonInformation?method=passSet"
			method="post" onSubmit="javascript:return (checkPassword());">

				<p align="center">	当前密码：
					<input type="password" value="" name="passNow"
						id="passNow" /> </p>
				<p align="center">	新密码：
					<input type="password" value="" name="password1"
						id="password1" /> </p>
				<p align="center">	确认新密码：
					<input type="password" value="" name="password2"
						id="password2" /></p>
				<p align="center">	<input type="submit" value="提交"
						onclick="form1.onSubmit()" /> &nbsp; &nbsp;  &nbsp; &nbsp;
						<input type="button" value="重填" onclick="reset()" />
						</p>
						
		</form>
	</div>
	<%@include file="end.jsp"%>
</body>
</html>