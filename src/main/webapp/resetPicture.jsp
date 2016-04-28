<%@ page language="java" import="com.trs.model.User"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更改图片</title>
</head>
	<jsp:include page="Addhead.jsp" flush="true"></jsp:include>

<body>
	
	<br><br><br><br>
	<div align="center"> 
	
	<p>资料更改完毕！如果您还需要更改图片信息可执行以下操作</p>
	
	</div>
	
	
	<br>
	
	<form action="TaskUpdata?method=picture" method="post"
		enctype="multipart/form-data">
		
	<p align="center">以下为主缩略图，如果您需要更改图片，请上传图片 </p>
	
	<div align="center">
	<img  src="imgs/${currentTask.taskImag}"  />
			<input type="file" name="file" /> 
	
			
			<br><br><br> 以下为详细介绍图片，如果您需要更改，请上传新图片
			
			<br><br><br>
			
			<img  src="imgs/${index1}"   />
			<input type="file" name="file2" />
			
			<br><br><br>
			<img  src="imgs/${index2}" />	
			<input type="file" name="file3" />  
	</div>	
	<br><br><br><br>
	
	<div align="center">
			<input type="submit" name="submit1" value="submit" />
			<input type="reset" name="reset" value="reset" />
	</div>
	<br><br><br><br>
	</form>
	<%@include file="end.jsp"%>
</body>
</html>