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
	<div style="width:300px; margin: 0px auto;">
		<P>资料上传完毕！请上传一张主图片。</P>
		<form action="TaskAdd?method=picture" method="post"
			enctype="multipart/form-data">

			<input type="file" name="file" /> <br/>
			<br/>
			<br/> 您还可以选择上传两张详细图片。 <br/>
			<br/> <input type="file" name="file2" /> <br/>
			<br/> <input type="file" name="file3" />
			<br/><br/>
			<div style="width: 180px; margin: 0px auto;">
			<input type="submit" name="submit1" value="确认" /> &nbsp;&nbsp;<input type="reset" name="reset" value="重置" />
			</div>
		</form>
	</div>


	<br>
	<br>
	<br>
	<br>

		<%@include file="end.jsp"%>


</body>
</html>