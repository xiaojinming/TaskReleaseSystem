<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<meta charset="utf-8">

<head>
<title>发布需求</title>
</head>

<body>

	<jsp:include page="Addhead.jsp" flush="true"></jsp:include>

	<div style="margin: 20px auto; width: 600px;">
		<form name="form" action="TaskAdd" method="post">
			<table style="margin: 0px auto; width: 600px; height: 380px;">
				<tr height="10">
					<td colspan="4"></td>
				</tr>

				<tr height="10">
					<td width="20%"></td>
					<td width="12%">需求名称：</td>
					<td><input type="text" value="${taskName }" name="taskName"
						id="taskName" /></td>
					<td width="30%"><font color="red">&nbsp;&nbsp;&nbsp;${errorId }</font></td>
				</tr>

				<tr height="10">
					<td width="20%"></td>
					<td width="12%">需求报酬：</td>
					<td><input type="text" value="${taskPrice }"
						name="taskPrice" id="taskPrice" /></td>
					<td width="30%"><font color="red">&nbsp;&nbsp;&nbsp;${errorPrice }</font></td>
				</tr>


				<tr height="10">
					<td width="20%"></td>
					<td width="8%">可小刀：</td>
					<td><input type="radio" value="radiobutton" name="radiobutton"
						value=0 />否</td>
					<td><input type="radio" value="radiobutton" name="radiobutton"
						value=1 />是</td>
					<td width="30%"><font color="red">&nbsp;&nbsp;&nbsp;${errorPassword }</font></td>
				</tr>


				<tr height="10">
					<td width="20%"></td>
					<td width="12%">有效时间：</td>
					<td><input type="text" value="${taskNew }" name="taskNew"
						id="goodsNew" /></td>
					<td width="30%"><font color="red">&nbsp;&nbsp;&nbsp;${errorId }</font></td>
				</tr>

				<tr height="10">
					<td width="20%"></td>
					<td width="12%">需求类型：</td>
					<td><select name="taskType" id="taskType" onchange=Change() >
							<option selected="selected">--请选择--</option>
							<option value="1">求购</option>
							<option value="2">求租</option>
							<option value="3">兼职</option>
							<option value="4">其他</option>
					</select></td>
					<td><select name="taskType2" id="taskType2"
						style="text-align:center">
							<option selected="selected">--请选择--</option>
					</select></td>
					<td width="30%"></td>
				</tr>

				<tr height="10">
					<td width="20%"></td>
					<td width="8%">出租：</td>
					<td><input type="radio" value="radiobutton2"
						name="radiobutton2" value=0 />否</td>
					<td><input type="radio" value="radiobutton2"
						name="radiobutton2" value=1 />是</td>
					<td width="30%"><font color="red">&nbsp;&nbsp;&nbsp;${errorPassword }</font></td>
				</tr>

				<tr height="10">
					<td width="20%"></td>
					<td width="28%">需求详细描述：</td>
			</table>
			<div style="width: 660px; margin: 0px auto; height:200px;">
				<div style="margin: 0px auto 10px; width: 500px;">
					<textarea name="taskDesc" cols="60" rows="10"></textarea>
				</div>
				<div id="login">
					<input type="submit" onclick="getRadio()" value="确认" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="button" id="btn" onclick="reset()" value="重置"  />
				</div>
			</div>
		</form>
	</div>
	<%@include file="end.jsp"%>
</body>
</html>
