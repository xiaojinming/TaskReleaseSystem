<%@ page language="java" import="com.trs.model.User"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<jsp:include page="Addhead.jsp" flush="true"></jsp:include>
	<br>
	<br>
	<br>
	<br>
	<P align="center">恭喜您已成功上传<font color="red">${picCount }</font> 张图片，您可以在个人中心查看、修改商品信息;</P>
	<br><br>
	<p align="center"><a href="main.jsp">返回首页</a> </p>
	<br>
	<br>
	<br>
	<br>
	
	<%@include file="end.jsp"%>
	
</body>
</html>