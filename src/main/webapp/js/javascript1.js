function check_login(){
	if($("#username").val().length == 0){
		alert("用户名不能为空");
		return false;
	}
	if($("#pwd").val().length == 0){
		alert("密码不能为空");
		return false;
	}
	if($("#number").val().length == 0){
		alert("验证码不能为空");
		return false;
	}
	return true;
}


function check_register(){
	if(!check_register_id())
		return false;
	else if(!check_register_nick())
		return false;
	else if(!check_register_password())
		return false;
	else if(!check_register_no())
		return false;
	else if(!check_register_identity())
		return false;
	else if(!check_register_tel())
		return false;
	else if(!check_register_qq())
		return false;
	else if(!check_email())
		return false;
	else 
		return true;
}


function check_register_id(){
	
	var patrn = /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
	
	if($("#userid").val().length == 0){
		$("#userid_msg").text("不能为空");
		return false;
	}
	else if(!patrn.test($("#userid").val()))
	{
		$("#userid_msg").text("用户名输入不合法");
		return false;
	}
	else
	{
		$("#userid_msg").text("");
		return true;
	}
}


function check_register_nick(){
	if($("#usernick").val().length == 0){
		$("#usernick_msg").text("不能为空");
		return false;
	}
	
	else if($("#usernick").val().length > 6)
	{
		$("#usernick_msg").text("昵称长度不能大于6个字符");
		return false;
	}
	else{
		$("#usernick_msg").text("");
		return true;
	}
}


function check_register_password(){
	if($("#userpassword").val().length == 0){
		$("#userpassword_msg").text("不能为空");
		return false;
	}
	else if($("#userpassword").val().length<6 || $("#userpassword").val().length >15)
	{
		$("#userpassword_msg").text("密码长度需要大于等于6位且小于16位");
		return false;
	}
	
	else{
		$("#userpassword_msg").text("");
		return true;
	}
}


function check_register_no(){
	if($("#userno").val().length == 0){
		$("#userno_msg").text("不能为空");
		return false;
	}else{
		$("#userno_msg").text("");
		return true;
	}
}


function check_register_identity(){
	
	var patrn = /\d{15}|\\d{18}/;
	
	if($("#useridentity").val().length == 0){
		$("#useridentity_msg").text("不能为空");
		return false;
	}
	else if(!patrn.test($("#useridentity").val()))
	{
		$("#useridentity_msg").text("身份证输入格式不正确");
		return false;
	}
	
	else{
		$("#useridentity_msg").text("");
		return true;
	}
}



function check_register_tel(){
	var patrn = /^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$/;
	if(patrn.test($("#usertel").val())){
		$("#usertel_msg").text("手机号码输入格式不正确");
		return false;
	}
	else{
		$("#usertel_msg").text("");
		return true;
	}
}
function check_register_qq(){
	if($("#userqq").val().length == 0){
		$("#userqq_msg").text("不能为空");
		return false;
	}else{
		$("#userqq_msg").text("");
		return true;
	}
}

function check_email(){
	if($("#email").val().length == 0){
		$("#email_msg").text("不能为空");
		return false;
	}
	var emailstr=$("#email").val();
	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (filter.test(emailstr)) 
        {
            $("#email_msg").text('');
            return true;
            }
	else {
		$("#email_msg").text('邮箱输入格式不正确');
		 return false;
		}
}

function check_phone(){
	if($("#phone").val().length == 0){
		$("#phone_msg").text("不能为空");
		return false;
	}
	else if($("#phone").val().length == 11 ){
		var phonestr=$("#phone").val();
		if(!isNaN(phonestr)){
			$("#phone_msg").text("");
			return true;
		}
		else{
			$("#phone_msg").text("格式有误");
			return false;
		}
	}
	else{
		$("#phone_msg").text("格式有误");
		return false;
	}
}

function check_birthday(){
	if($("#birthday").val().length == 0){
		$("#birthday_msg").text("不能为空");
		return false;
	}
	$("#birthday_msg").text("");
	return true;
}

function check_introduction(){
	if($("#introduction").val().length == 0){
		$("#introduction_msg").text("不能为空");
		return false;
	}
	$("#introduction_msg").text("");
	return true;
}

function check_myinfo(){
	if($("#email").val().length == 0){
		alert("邮箱不能为空");
		return false;
	}
	else if($("#phone").val().length == 0){
		alert("手机号码不能为空");
		return false;
	}
	else if($("#birthday").val().length == 0){
		alert("生日不能为空");
		return false;
	}
	else if($("#introduction").val().length == 0){
		alert("自我介绍不能为空");
		return false;
	}
	else if($("#introduction").val().length > 250){
		alert("内容过长");
		return false;
	}
	else
		return true;
}


