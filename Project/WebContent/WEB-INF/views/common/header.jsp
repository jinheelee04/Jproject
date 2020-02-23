<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
 <%
 	//로그인 확인 
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
	// /mvc/index.jsp => memberLoggeIn =null;
	// /mvc/member/login => memberLoggIn = member객체
			
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
			//System.out.println(name+" = "+ value);
			
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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common/footer.css">
</head>
<body>
	<header>
		<div class="head_center">
			<img class ="logo" src="<%=request.getContextPath()%>/images/main/GOGO_GUNSAN_LOGO.png" alt="고고군산 로고">
				<table class="login_table">
					<tr>
						<td>
							<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"width="20" height="20"viewBox="0 0 226 226"style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,226v-226h226v226z" fill="none"></path><g fill="#333333"><path d="M97.93333,22.6c-41.51622,0 -75.33333,33.81711 -75.33333,75.33333c0,41.51622 33.81711,75.33333 75.33333,75.33333c18.05369,0 34.63363,-6.41097 47.62774,-17.053l44.9793,44.9793c1.88948,1.96801 4.69528,2.76078 7.33527,2.07256c2.64,-0.68822 4.70167,-2.74989 5.38989,-5.38989c0.68822,-2.64 -0.10455,-5.44579 -2.07256,-7.33527l-44.9793,-44.9793c10.64202,-12.9941 17.053,-29.57404 17.053,-47.62774c0,-41.51622 -33.81711,-75.33333 -75.33333,-75.33333zM97.93333,37.66667c33.37359,0 60.26667,26.89308 60.26667,60.26667c0,33.37359 -26.89307,60.26667 -60.26667,60.26667c-33.37359,0 -60.26667,-26.89307 -60.26667,-60.26667c0,-33.37359 26.89308,-60.26667 60.26667,-60.26667z"></path></g></g></svg>
							<p>검색</p>
						</td>
						<% if(memberLoggedIn != null){ %>

						<%} else{ %>
						<td>
							<img src="https://img.icons8.com/ios-glyphs/20/000000/user--v1.png">
							<p><a href ="<%=request.getContextPath()%>/member/memberLoginGo">로그인</a></p>
						</td>						
						<%} %>
						
					</tr>
				</table>
				<nav class="menu">
					<a href="">관광지 소개</a>
					<a href="">추천코스</a>
					<a href="">통합예약</a>
					<a href="">맞춤서비스</a>
					<a href="">군산이야기</a>
				</nav>
			</div>
			<div class="header_board">
				<div class="header_board_title">
					<svg class ="board_icon"xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30"viewBox="0 0 172 172"
	style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><path d="M80.26667,22.93333c-1.37802,0.0006 -2.70972,0.49751 -3.7513,1.39974l-0.04479,0.05599c-0.27484,0.24052 -0.52607,0.50674 -0.75026,0.79505l-35.58698,37.88255v22.93333v22.93333l35.59817,37.89375c1.08293,1.40905 2.75804,2.23626 4.53516,2.23958c3.16643,0 5.73333,-2.5669 5.73333,-5.73333v-57.33333v-57.33333c0,-3.16643 -2.5669,-5.73333 -5.73333,-5.73333zM128.65286,31.25339l-6.15886,9.6638c15.82973,8.8236 26.57266,25.71561 26.57266,45.08281c0,19.3672 -10.73746,36.25921 -26.56146,45.08281l6.14765,9.6638c19.01173,-10.8704 31.88047,-31.32021 31.88047,-54.74661c0,-23.4264 -12.863,-43.87621 -31.88047,-54.74661zM116.34636,50.60339l-6.24844,9.79818c9.45427,4.68987 16.03542,14.34964 16.03542,25.59844c0,11.2488 -6.58115,20.90857 -16.03542,25.59844l6.24844,9.79817c12.63627,-6.76533 21.25364,-20.08861 21.25364,-35.39661c0,-15.308 -8.61738,-28.63128 -21.25364,-35.39661zM22.93333,63.06667c-6.33533,0 -11.46667,5.13133 -11.46667,11.46667v22.93333c0,6.33533 5.13133,11.46667 11.46667,11.46667h5.73333v-45.86667zM103.93906,70.08776l-6.47239,10.15651v0.02239c3.15907,0 5.73333,2.56853 5.73333,5.73333c0,3.1648 -2.57427,5.73333 -5.73333,5.73333v0.02239l6.47239,10.15651c6.28373,-2.55707 10.72761,-8.71691 10.72761,-15.91224c0,-7.19533 -4.44387,-13.34944 -10.72761,-15.91224z"></path></g></g></svg>
					<p>공지사항</p>
					<p>여기는 고고군산의 공지사항 글이 올라올 예정입니다.</p>
				</div>
			</div>
		</div>
	</header>