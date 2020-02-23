<%@page import="member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Member> list = (List<Member>) request.getAttribute("list");
	String srchType = request.getParameter("searchType");
	String srchKeyword = request.getParameter("searchKeyword");



%>
<%@ include file="/WEB-INF/views/admin/common/adminHeader.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/memberListMain.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/searchbox.css" />

<style>
div#search-container {
	margin: 0 0 10px 0;
	padding: 3px;
	text-align: center;
	
}

div#search-memberEmail {
	display: <%="memberEmail".equals(srchType)?"inline-block":"none"%>;
}

div#search-memberNo {
	display: <%="memberNo".equals(srchType)?"inline-block":"none" %>;
}

div#search-memberName {
	display: <%="memberName".equals(srchType)?"inline-block":"none"%>;

}
</style>
<script>
$(function() {
	let $memberEmail = $("#search-memberEmail");
	let $memberName = $("#search-memberName");
	let $memberNo = $("#search-memberNo");
console.log($memberName);
console.log($memberNo);
	$("#searchType").change(function() {
		$memberEmail.hide();
		$memberName.hide();
		$memberNo.hide();

		let selected = $(this).val();
		console.log(selected);
		$("#search-" + selected).css("display", "inline-block");
	});
});
	
</script>
<div class="dashboard-wrapper">
	<div id="search-container">
		검색타입 : <select id="searchType">
			<option value="memberEmail" <%="memberEmail".equals(srchType)?"selected":"" %>>이메일</option>
			<option value="memberNo" <%="memberNo".equals(srchType)?"selected":"" %>>회원번호</option>
			<option value="memberName" <%="memberName".equals(srchType)?"selected":"" %>>회원명</option>
		</select>
		<div id="search-memberEmail">
			<form action="<%=request.getContextPath()%>/admin/memberFinder">
					<input type="hidden" name="searchType" value="memberEmail" />
				<div class="search__container">
					<input type="text" class="search__input" name="searchKeyword"  placeholder="검색할 이메일 주소를 입력하세요." value="<%="memberEmail".equals(srchType)?srchKeyword:""%>">
				</div>
			</form>
		</div>
		<div id="search-memberNo">
			<form action="<%=request.getContextPath()%>/admin/memberFinder">
					<input type="hidden" name="searchType" value="memberNo" />
				<div class="search__container">
					<input type="text" class="search__input" name="searchKeyword" placeholder="검색할 회원번호를 입력하세요." value="<%="memberNo".equals(srchType)?srchKeyword:""%>">
				</div>
			</form>
		</div>
		<div id="search-memberName">
			<form action="<%=request.getContextPath()%>/admin/memberFinder">
					<input type="hidden" name="searchType" value="memberName" />
				<div class="search__container">
					<input type="text" class="search__input" name="searchKeyword" placeholder="검색할 이름을 입력하세요." value="<%="memberName".equals(srchType)?srchKeyword:""%>">
				</div>
			</form>
		</div>
	</div>
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">

				<div class="table100 ver2 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column0">No.</th>
									<th class="cell100 column1">회원번호</th>
									<th class="cell100 column2">이메일</th>
									<th class="cell100 column3">이름</th>
									<th class="cell100 column5">전화번호</th>
									<th class="cell100 column4">생년월일</th>
									<th class="cell100 column6">가입일</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<%
									if (list == null || list.isEmpty()) {
								%>
								<tr>
									<td colspan="10" align="center">검색 결과가 없습니다.</td>
								</tr>
								<%
									} else {
										int i = 0;
										for (Member m : list) {
											if ("U".equals(m.getGrade())) {
												i++;
								%>
								<tr class="row100 body">
									<td class="cell100 column0"><%=i%></td>
									<td class="cell100 column1"><%=m.getMemberNo()%></td>
									<td class="cell100 column2"><%=m.getMemberEmail()%></td>
									<td class="cell100 column3"><%=m.getMemberName()%></td>
									<td class="cell100 column5"><%=m.getPhone()%></td>
									<td class="cell100 column4"><%=m.getBirthDay() != null ? m.getBirthDay() : ""%></td>
									<td class="cell100 column6"><%=m.getEnrollDate()%></td>
								</tr>
								<%
									}
										}
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
<%@ include file="/WEB-INF/views/admin/common/adminFooter.jsp"%>
