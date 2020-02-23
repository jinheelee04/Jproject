<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/adminDashboard.css" />
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.js"></script>

<title>admin dashboard</title>
</head>

<body>
	<!-- ============================================================== -->
	<!-- main wrapper -->
	<!-- ============================================================== -->
	<div class="dashboard-main-wrapper">
		<!-- ============================================================== -->
		<!-- navbar -->
		<!-- ============================================================== -->
		<div class="dashboard-header">
			<nav class="navbar navbar-expand-lg bg-white fixed-top">
				<a class="navbar-brand" href="index.html">
					<img src="<%=request.getContextPath() %>/images/logo/gogo_gunsan.png" width="160px" style="color: aliceblue"alt="">
				</a>

			</nav>
		</div>
		<!-- ============================================================== -->
		<!-- end navbar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- left sidebar -->
		<!-- ============================================================== -->
		<div class="nav-left-sidebar sidebar-dark">
			<section class="app">
				<aside class="sidebar">
					<nav class="sidebar-nav">

						<ul>
							<li><a href="<%=request.getContextPath()%>/admin/adminMemberList"><img width="26px"
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABmJLR0QA/wD/AP+gvaeTAAAB+0lEQVRYhe3VP2sUURQF8ESRFNEu6savIKRQsAnRFNYBbZJYGNAmgYDrqp/AP62FfgghGBSChUUstZIsWAds0lgIWfFPTPZn4R12TGYnb5fZQsiBx2PmnXvP4d6Z+4aGjnCE/w2o4Qk28C3WBh7j7KDF50OwG1qYG5T4DbRDaAVTGI11GS/jrF25iSh7KwTulPAauUpU147oOawkcFeD+6hKA81IOpXAvRLcjSoNZOUfTeCezNqQkvtYooe92Id7yNmu0sBm7BcSuBlns5TVo4HXsXf9A3Kox76WmPtw4By+Rm8bJbwHwdnGmcoMRPJZ7IXAKqZzg2gar3KDaLZS8ZyJ+dw0LML2IMWvYbNAtIWPeFhUdmwFb7xf4WE8zQl+Qh3ni+YCZjDRzQDGsNiLgUz8F5ZxvIQ7iR18wQLeYDfiP+C2zlRdShG/nhO/msA/oXMrlqGJscOSjeBzBCwf6rYTdzFifkSrahjH3XgHN1MSzeV63rXsBXHPI65ecJZd1+spiV50S9SFvx+1eL+eCUYl/kHZKL4U+9sUAwXILq7ffUXje5g81WPcu4g7MLJxP86e9WUq0cBC7iNsRNnHcQ8/4yzlVu1L/LTOf16GNYwMwsBSCDRxC+/jeTdEF/wdUjuYrNxAmFgUQyb31W/lzicwMxDxAjMHDOzHH2EscUZKDkzSAAAAAElFTkSuQmCC">
									<span class="menu-name">회원관리</span> </a>
								<ul class="nav-flyout">
									<li><a href="<%=request.getContextPath()%>/admin/adminMemberList"><i
											class="ion-ios-color-filter-outline"></i>회원정보보기</a></li>
									<li><a href="#"><i class="ion-ios-clock-outline"></i>회원정보수정</a>
									</li>
								</ul></li>
							<li><a href="#"><svg xmlns="http://www.w3.org/2000/svg"
										x="0px" y="0px" width="30" height="29" viewBox="0 0 172 172"
										style="fill: #000000;">
                                        <g fill="none"
											fill-rule="nonzero" stroke="none" stroke-width="1"
											stroke-linecap="butt" stroke-linejoin="miter"
											stroke-miterlimit="10" stroke-dasharray=""
											stroke-dashoffset="0" font-family="none" font-weight="none"
											font-size="none" text-anchor="none"
											style="mix-blend-mode: normal">
                                            <path
											d="M0,172v-172h172v172z" fill="none"></path>
                                            <g fill="#ffffff">
                                                <path
											d="M86,21.5c-11.52685,0 -20.87011,9.23828 -21.33203,20.66016c-19.3794,8.23047 -32.41797,27.3999 -32.41797,49.21484c0,0.92383 -0.04199,1.93164 0,3.02344c-6.36182,3.73731 -10.75,10.60303 -10.75,18.47656c0,11.8208 9.6792,21.5 21.5,21.5c3.08643,0 6.06787,-0.65088 8.73438,-1.84766c9.32227,7.83154 21.45801,12.59766 34.26563,12.59766c12.80762,0 24.94336,-4.76611 34.26563,-12.59766c2.66651,1.19678 5.64795,1.84766 8.73438,1.84766c11.8208,0 21.5,-9.6792 21.5,-21.5c0,-7.95752 -4.43018,-14.92822 -10.91797,-18.64453c0.08398,-0.86084 0.16797,-1.74268 0.16797,-2.85547c0,-21.81494 -13.03857,-40.98437 -32.41797,-49.21484c-0.46191,-11.42187 -9.80518,-20.66016 -21.33203,-20.66016zM86,32.25c6.00489,0 10.75,4.74512 10.75,10.75c0,6.00489 -4.74511,10.75 -10.75,10.75c-6.00488,0 -10.75,-4.74511 -10.75,-10.75c0,-6.00488 4.74512,-10.75 10.75,-10.75zM67.01953,52.91016c3.61133,6.84473 10.75,11.58984 18.98047,11.58984c8.23047,0 15.36914,-4.74511 18.98047,-11.58984c14.40332,6.9917 24.01953,21.68896 24.01953,38.46484c-11.8208,0 -21.5,9.6792 -21.5,21.5c0,4.8081 1.65869,9.17529 4.36719,12.76563c-7.18066,5.43799 -16.41894,8.73438 -25.86719,8.73438c-9.44824,0 -18.68652,-3.29639 -25.86719,-8.73437c2.70849,-3.59033 4.36719,-7.95752 4.36719,-12.76562c0,-11.8208 -9.6792,-21.5 -21.5,-21.5c0,-16.77588 9.61621,-31.47315 24.01953,-38.46484zM43,102.125c6.00489,0 10.75,4.74512 10.75,10.75c0,6.00489 -4.74511,10.75 -10.75,10.75c-6.00488,0 -10.75,-4.74511 -10.75,-10.75c0,-6.00488 4.74512,-10.75 10.75,-10.75zM129,102.125c6.00489,0 10.75,4.74512 10.75,10.75c0,6.00489 -4.74511,10.75 -10.75,10.75c-6.00488,0 -10.75,-4.74511 -10.75,-10.75c0,-6.00488 4.74512,-10.75 10.75,-10.75z">
                                                </path>
                                            </g>
                                        </g>
                                    </svg><span class="menu-name">관광지스태프
										관리</span> </a>
								<ul class="nav-flyout">
									<li><a href="#"><i
											class="ion-ios-color-filter-outline"></i>스태프정보보기</a></li>
									<li><a href="#"><i class="ion-ios-clock-outline"></i>스태프정보수정</a>
									</li>
								</ul></li>
							<li><a href="#"><svg xmlns="http://www.w3.org/2000/svg"
										x="0px" y="0px" width="23" viewBox="0 0 172 172"
										style="fill: #000000;">
                                        <g fill="none"
											fill-rule="nonzero" stroke="none" stroke-width="1"
											stroke-linecap="butt" stroke-linejoin="miter"
											stroke-miterlimit="10" stroke-dasharray=""
											stroke-dashoffset="0" font-family="none" font-weight="none"
											font-size="none" text-anchor="none"
											style="mix-blend-mode: normal">
                                            <path
											d="M0,172v-172h172v172z" fill="none"></path>
                                            <g fill="#ffffff">
                                                <path
											d="M118.45673,0c-2.14483,0 -4.36719,0.85276 -5.99519,2.48077l-9.50962,9.50962l23.77404,23.98077l9.71635,-9.71635c3.28185,-3.25601 3.30769,-8.5018 0,-11.78365l-11.99038,-11.99038c-1.65385,-1.65385 -3.85036,-2.48077 -5.99519,-2.48077zM94.26923,19.22596l-38.65865,38.86538c-0.49099,0.4393 -1.05949,0.98197 -1.24038,1.65385l-8.26923,28.32212c-0.10337,0.33594 -0.20673,0.69772 -0.20673,1.03365c0,0.93029 0.36178,1.8089 1.03365,2.48077c0.90445,0.90445 2.27404,1.18871 3.51442,0.82692l28.52885,-8.26923c0.69772,-0.20673 1.21454,-0.72356 1.65385,-1.24038l38.65865,-38.65865zM6.61538,39.69231c-3.64363,0 -6.61538,2.97176 -6.61538,6.61538v79.38462c0,3.64363 2.97176,6.61538 6.61538,6.61538h158.76923c3.64363,0 6.61538,-2.97176 6.61538,-6.61538v-79.38462c0,-3.64363 -2.97176,-6.61538 -6.61538,-6.61538h-27.70192l-13.23077,13.23077h34.31731v66.15385h-145.53846v-66.15385h33.07692l13.23077,-13.23077zM60.77885,63.25962l12.19712,2.48077l2.48077,11.99038l-16.125,4.75481l-3.30769,-3.30769z">
                                                </path>
                                    </svg> <span class="menu-name">게시판
										관리</span> </a>
								<ul class="nav-flyout">
									<li><a href="#"><i
											class="ion-ios-color-filter-outline"></i>공지사항게시판</a></li>
									<li><a href="#"><i class="ion-ios-clock-outline"></i>관광지게시판</a>
									</li>
									<li><a href="#"><i class="ion-ios-clock-outline"></i>마이군산</a>
									</li>
								</ul></li>

							<li><a href="#"><svg xmlns="http://www.w3.org/2000/svg"
										x="0px" y="0px" width="32" height="32" viewBox="0 0 172 172"
										style="fill: #000000;">
                                        <g fill="none"
											fill-rule="nonzero" stroke="none" stroke-width="1"
											stroke-linecap="butt" stroke-linejoin="miter"
											stroke-miterlimit="10" stroke-dasharray=""
											stroke-dashoffset="0" font-family="none" font-weight="none"
											font-size="none" text-anchor="none"
											style="mix-blend-mode: normal">
                                            <path
											d="M0,172v-172h172v172z" fill="none"></path>
                                            <g fill="#ffffff">
                                                <path
											d="M59.125,21.5c-8.84171,0 -16.125,7.28329 -16.125,16.125v80.625h-21.5v16.125c0,8.83193 7.29307,16.125 16.125,16.125h75.25c8.84171,0 16.125,-7.28329 16.125,-16.125v-75.25h21.5v-21.5c0,-8.83193 -7.29307,-16.125 -16.125,-16.125zM59.125,32.25h60.13281c-0.61099,1.69195 -1.00781,3.48594 -1.00781,5.375v96.75c0,3.03704 -2.33796,5.375 -5.375,5.375c-3.34782,0 -5.375,-2.02718 -5.375,-5.375v-16.125h-53.75v-80.625c0,-3.03704 2.33796,-5.375 5.375,-5.375zM134.375,32.25c3.34782,0 5.375,2.02718 5.375,5.375v10.75h-10.75v-10.75c0,-3.34782 2.02718,-5.375 5.375,-5.375zM64.5,48.375v10.75h43v-10.75zM64.5,69.875v10.75h43v-10.75zM64.5,91.375v10.75h26.875v-10.75zM32.25,129h64.5v5.375c0,2.08746 1.50773,3.53544 2.24658,5.375h-61.37158c-3.34782,0 -5.375,-2.02718 -5.375,-5.375z">
                                                </path>
                                            </g>
                                        </g>
                                    </svg> <span class="menu-name">예약
										현황</span> </a>
								<ul class="nav-flyout">
									<li><a href="#"><i
											class="ion-ios-color-filter-outline"></i>회원 예약현황</a></li>
									<li><a href="#"><i
											class="ion-ios-color-filter-outline"></i>관광지별 예약현황</a></li>

								</ul></li>

						</ul>
					</nav>
				</aside>
			</section>
		</div>
		<!-- ============================================================== -->
		<!-- end left sidebar -->
		<!-- ============================================================== -->