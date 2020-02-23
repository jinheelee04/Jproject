<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* String saveId = (String)request.getParameter("saveId"); */

	//쿠키확인
	Cookie[] cookies = request.getCookies();
	boolean saveIdChecked = false;
	String memberId = "";
	
	if(cookies != null){
		//System.out.println("cookies@header.jsp");
		//System.out.println("===================================");
		for(Cookie c : cookies){
			String name = c.getName();
			String value = c.getValue();
			//System.out.println(name + " = " + value);
			
			if("saveId".equals(name)){
				saveIdChecked = true;
				memberId = value;
			}
		}
		//System.out.println("===================================");
		
	}


%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/login.css" />
    <script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
</head>
	<body>
        <img src="/gunsan_project/images/gogo.png" alt="" width="300px" style="margin-bottom: 30px;">
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="<%=request.getContextPath() %>/member/memeberEnroll" method="POST" onsubmit="return validate();">
                    <h1>회원가입</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <input type="email" placeholder="Email" id="email" name="email" onblur="emailValidate();" required/>
                    <span class="error" id="errorEmail"></span>
                    <input type="password" name="password" id="password_" placeholder="Password" onblur="pwValidate();" required />
                    <span class="error" id="errorPw"></span>
                    <input type="password" id="password_2" placeholder="Confirm Password" onblur="isEqualPwd();" required>
                    <span class="error" id="errorPwChk"></span>
                    <input type="text" name="memberName" id="memberName"  placeholder="Name"required>
                    <span class="error" id="errorName"></span>
                    <input type="tel" placeholder="Phone Number(-없이)"name="phone" id="phone" maxlength="11" required>
                    <span class="error" id="errorPhone"></span>
                    <input type="date" name="birthday" id="brithday" required>
                    <button type="submit">Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="<%=request.getContextPath()%>/member/memeberLogin" method="get">
                    <h1>로그인</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your account</span>
                    <input type="email" placeholder="Email" name="loginEmail" id="loginEmail" />
                    <input type="checkbox" name="saveId" id="saveId" <%=saveIdChecked?"checked":"" %>/>
					<label for="saveId">아이디 저장</label>
                    <input type="password" placeholder="Password" name="loginPassword" id="loginPassword" />
                    <!-- 아이디/비밀번호 찾기 페이지 -->
                    <a href="<%=request.getContextPath()%>/member/memeberFind">Forgot your password?</a>
                    <button>Sign In</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp" >Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
      //아이디 사용여부
    	$("#email").keyup(function(e){
    		let email = $(this).val().trim();
    		$.ajax({
    			url: "<%=request.getContextPath()%>/member/chekckIdDuplicate.do",
    			data: {email: email},
    			dataType : "text",
    			success: function(data){
    				//입력한 이메일이 DB에 있는지 없는지에 따른 결과를 출력한다.
    				if(data==0){
    					$("#errorEmail").html("사용가능한 이메일입니다.");
    				}else{
    					$("#errorEmail").html("<font color='red'>사용중인 이메일입니다.</font>");
    				}
    			},
    			error: function(){
    				alert("에러가 발생했습니다. 관리자에게 문의 하세요");
    			}
    			
    		});
    		
    	});
        </script>
        <script src="<%=request.getContextPath()%>/js/member/member.js"></script>
</body>
</html>