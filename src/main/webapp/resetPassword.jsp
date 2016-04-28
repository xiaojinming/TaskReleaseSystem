<%@ page language="java" import="java.util.*,com.trs.dao.UserDao" pageEncoding="utf-8"%>
<%
	String userId = request.getParameter("uid");
	String key = request.getParameter("validkey");
	boolean flag = true;
	UserDao userDao = new UserDao();
	flag = userDao.isChangePass(userId, key);
	
	if(!flag)
		//response.sendRedirect("login.jsp");
	request.setAttribute("uid", userId);   
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="head.jsp" flush="true"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
<script type="text/javascript">
	
	//确认密码是否符合规则
	function checkPassword(){
		var pas1 = document.getElementById("password1").value;
		var pas2 = document.getElementById("password2").value;
	
		if(pas1 !== pas2)
		{
			alert("两次输入密码不一致，请重新输入！");
 			document.getElementById("password1").value="";
			document.getElementById("password2").value=""; 
			return false;
		}
		
	
		if(pas1.length<6||pas1.length>15)
		{
			alert("密码长度不能小于6位大于15位！");
			//reset(); 同			
			return false;
		}			
		
		
		return true;
	}
	

	
</script>
</head>
<body>
	<div align="center" style="padding-top: 50px;">
	
		<form name="form1" action="findPassServlet?method=reset" method="post" onSubmit="javascript:return (checkPassword());">
		<input type="hidden" name="userid"  value=<%=userId %>  />
		
			<div class="inputstyle1" align="left">
			<p>
				新密码:&nbsp; <span> <input type="password" value="${password1 }"
					name="password1" id="password1" /> <span id="username_msg"
					style='font-size: 12px;'></span>
				</span>
			</p>
			<span id="name_msg"></span>
		</div>
		<div class="inputstyle1" align="left">
			<p>
				确认密码:&nbsp; <span> <input type="password" value="${password2 }"
					name="password2" id="password2" /> <span id="pwd_msg"></span>
				</span>
			</p>
		</div>
		
		<br>
		<br>
		
		<div  align="center">
			<input type="submit" value="修改密码" />
		</div>
		
		<br>
		<br>
		<br>
		<br>
		
		</form>
	</div>
	<%@include file="end.jsp"%>
</body>
</html>