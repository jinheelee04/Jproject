<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/adminlogin.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<script>
function loginValidate(){
	
	let $email = $("#login-memberEmail").val();
	let $password = $("#login-password").val();
	var regExp1 =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	
	console.log($email);
	console.log($password);
	<%--if(!regExp1.test($email)){
		alert("올바를 이메일주소를 입력해주세요.")
		return;
	}--%>
	if($password.length<4){
		alert("올바른 비밀번호를 입력해주세요.");
		return;
	}
	
};
</script>
</head>
<body>
	<div class="container" id="container">
		<div class="form-container sign-in-container">
			<%--버튼 클릭시 /src/admin/controller/AdminLoginEnd.java 로 간다.  --%>
			<form action="<%=request.getContextPath()%>/admin/adminLoginEnd" 
			       id="adminLoginFrm" method = "POST" onsubmit="return loginValidate();">
				<h1>로그인</h1>

				<span>관리자 or 관광지 스태프</span> 
					<input type="email" name ="email" placeholder="Email" /> 
					<input type="password" name="password" placeholder="Password" />
				<div class="login-button-container">
				    <%--관리자 or 관광지 로그인 버튼  --%>
				    <input type="submit" class="login-button" value="로그인" tabindex="3"/>

				</div>
			</form>
		</div>

	</div>




</body>
</html>