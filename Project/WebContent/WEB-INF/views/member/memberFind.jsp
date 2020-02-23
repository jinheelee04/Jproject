<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <form action="<%=request.getContextPath()%>/member/passwordFind">
                    <h1>Password 찾기</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <!-- Password찾기에서 아이디(이메일)입력 -->
                <input type="email" name="findPassword-email" id="findPassword-email" placeholder="아이디(이메일)을 입력해주세요"  onblur="emailValidate();"/>
                <!-- Password찾기에서 이름입력 -->
                <input type="text" name="findPassword-name" id="findPasword-name" placeholder="이름을 입력하세요" onblur="pwValidate();" required />
                
                <!-- <input type="password" id="password_2" placeholder="Confirm Password" onblur="isEqualPwd();" required> -->
                
                <!-- <input type="text" name="memberName" id="memberName"  placeholder="Name"required> -->
                <!-- Password찾기에서 핸드폰입력 -->
                <input type="tel" name="findPassword-phone" id="findPassword-phone" placeholder="핸드폰번호를 입력하세요(-없이)" maxlength="11" required>
                <!-- Password찾기에서 생년월일입력 -->
                <input type="date" name="findPassword-birthday" id="findPassword-brithday" required>
                <button>Password찾기 확인</button>
                </form>
            </div>

			<!-- 아아디 찾기 -->
            <div class="form-container sign-in-container">
                <form action="<%=request.getContextPath()%>/member/idFind">
                    <h1>ID 찾기</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <!-- ID찾기에서 이름입력 -->
                <input type="text" name="findId-name" placeholder="이름을 입력하세요" />
                <!-- ID찾기에서 핸드폰번호입력 -->
                <input type="tel" name="findId-phone" placeholder="핸드폰번호를 입력하세요(-없이)" />
                <!-- ID찾기에서 생년월일입력 -->
                <input type="date" name="findId-birthday" id="findPassword-brithday" required>
                <a href="#">Forgot your password?</a>
                <button>ID찾기 확인</button>
                </form>
            </div>
            <div class="overlay-container">   
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="idFind">ID 찾기</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="passwordFind" >Password 찾기</button>
                    </div>
                </div>
            </div>       
        </div>
        <script>
    
                var passwordFindButton = document.getElementById('passwordFind');
                var idFindButton = document.getElementById('idFind');
                var container = document.getElementById('container');
                console.log('passwordFindButton='+passwordFindButton);
                passwordFindButton.addEventListener('click', function(event) {
                    container.classList.add("right-panel-active");
                });
            
                idFindButton.addEventListener('click', function(event) {
                    container.classList.remove("right-panel-active");
                });
        </script>
        


</body>
</html>