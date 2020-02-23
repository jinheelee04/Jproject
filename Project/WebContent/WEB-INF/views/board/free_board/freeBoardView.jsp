<%@page import="board.free_board.model.vo.FreeBoardComment"%>
<%@page import="board.free_board.model.vo.FreeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	List<FreeBoardComment> commentList = (List)request.getAttribute("list");
	FreeBoard board = (FreeBoard)request.getAttribute("board");

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<title>Document</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
body {
	width: 100%;
	height: auto;
	text-align: center;
	margin: 0 auto;
	background: rgba(255, 255, 255, 0.8);
}

header {
	font-size: 20px;
	font-weight: 300px;
}

table {
	width: 50%;
	font-size: 12px;
	background: #feffff;
	margin: 20px;
	border-radius: 3px;
	margin: 30px auto;
	box-shadow: 0 1px 2px #d1d1d1;
	border-collapse: collapse;
}

table th {
	padding: 15px;
}

table th:first-child {
	padding-left: 20px;
}

table tr:first-child th:first-child {
	border-top-left-radius: 3px;
}

table tr:first-child th:last-child {
	border-top-right-radius: 3px;
}

table tr {
	text-align: center;
	padding-left: 20px;
}

#title {
	font-size: 20px;
	text-align: left;
	background: #4c72fc;
}

#footer {
	background: #4c72fc;
}

table#tbl-board-view tr td:first-child {
	padding-left: 20px;
	border-left: 0;
}

table#tbl-board-view tr:first-child td {
	color: white;
	padding: 12px;
}

table#tbl-board-view tr td {
	border-left: 2px solid silver;
	/* border:solid black; */
	padding: 12px;
}

table#tbl-board-view tr:nth-child(2) {
	margin: 20px;
}

table#tbl-board-view tr.even td {
	background: #f6f6f6;
}

table#tbl-board-view tr:last-child td {
	border-bottom: 0;
}

table#tbl-board-view tr:last-child td:first-child {
	border-bottom-left-radius: 3px;
}

table#tbl-board-view tr:last-child td:last-child {
	border-bottom-right-radius: 3px;
}

#tbl-board-content {
	width: 80%;
}

#tbl-board-content th {
	background: rgb(243, 243, 243);
}

#tbl-board-content tr {
	border-bottom: 2px solid rgb(200, 200, 200);
}

#tbl-board-content td {
	text-align: left;
	color: black;
}

#tbl-board-content tr:last-child td {
	height: 200px;
}

input {
	width: 70%;
	/* font-size:20px; */
}
	/*게시글 수정하기*/
	span#fname{
		position: absolute;
		left: 92px;
		top: 9px;
		width: 200px;
		background: #f5f5f5;
	}
	#delFile+label{font-size:.8em; position:relative; top:-3px;}
	
	/*댓글 제출 버튼*/
	div.comment-container #btn-insert{text-align:center; width:60px; height:50px; background-color: #ee8342; color:white; position:relative; top:-20px;}
	
   /*댓글테이블*/
  table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; } 
  table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
  table#tbl-comment tr td:first-of-type {padding: 5px 5px 5px 50px;}
  table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
  table#tbl-comment button.btn-reply{display:none;}
  table#tbl-comment tr:hover {background:lightgray;}
  table#tbl-comment tr:hover button.btn-reply{display:inline;}
  table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
  table#tbl-comment sub.comment-date {color:tomato; font-size:10px}

  table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
  table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
  table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
  table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
  
 	/*답글관련*/
  table#tbl-comment textarea{margin: 4px 0 0 0;}
  table#tbl-comment button.btn-insert2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}
    
  /* 삭제버튼관련 */
  table#tbl-comment button.btn-delete{background:red; color:white; display:none;}
  table#tbl-comment tr:hover button.btn-delete{display:inline;}

</style>
</head>
<body>
	<div id="board-view">
		<table id="tbl-board-view">
			<tr>
				<td colspan="2" id="title">자유게시판</td>
			</tr>
			<tr>
				<td>
					<table id="tbl-board-content">
						<tr>
							<th>글번호</th>
							<td><%=board.getFreeBoardNo() %></td>
						</tr>
						<tr>
							<th>조회수</th>
							<td><%=board.getFreeReadCount() %></td>
						</tr>
						<tr>
							<th>제 목</th>
							<td><%=board.getFreeBoardTitle() %></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><%=board.getFreeBoardWriter() %></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<% if(board.getFreeOriginalFileName()!=null) { %> <!-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 -->
								<a
								href="javascript:fileDownload('<%=board.getFreeOriginalFileName()%>','<%=board.getFreeRenamedFileName()%>');">
									<img alt="첨부파일"
									src="<%=request.getContextPath() %>/images/free_board/file.png"
									width=16px><%=board.getFreeOriginalFileName() %>
							</a> <%} %>
							</td>
						</tr>
						<tr>
							<th>내 용</th>
							<td><%=board.getFreeBoardContent() %></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<!-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 -->
				<%if(memberLoggedIn!=null && (board.getFreeBoardWriter().equals(memberLoggedIn.getMemberEmail())||"A".equals(memberLoggedIn.getGrade()))){ %>
				<th colspan="2" id="footer">
					<button class="w3-button w3-white w3-border w3-round-large"
						onclick="updateBoard();">수정하기</button>
					<button class="w3-button w3-white w3-border w3-round-large"
						onclick="deleteBoard();">삭제하기</button>
				</th>
				<%} %>
			</tr>
		</table>
	</div>
	<hr style="margin-top: 10px;" />
	<div class="comment-container">
		<%-- text-area 포커스, 등록버튼을 누른 경우 로그인여부를 검사해서 경고창을 띄어줌. --%>
		<div class="comment-editor">
			<form action="<%=request.getContextPath()%>/board/free_board/freeBoardCommentInsert"
				method="post" name="boardCommentFrm">
				<input type="hidden" name="boardRef" value="<%=board.getFreeBoardNo() %>" /> 
				<input type="hidden" name="boardCommentWriter" value="<%=memberLoggedIn!=null?memberLoggedIn.getMemberEmail():""%>" />
				<input type="hidden" name="boardCommentLevel" value="1" /> 
				<input type="hidden" name="boardCommentRef" value="0" />
				<!-- DB는 null로 들어가야한다. -->
				<textarea name="boardCommentContent" cols="60" rows="3"></textarea>
				<button class="w3-button w3-border w3-round-large" id="btn-insert">등록</button>
			</form>
		</div>
	</div>
	<script>
	$(function(){
		$("[name=boardCommentContent]").click(function(){
			if(<%=memberLoggedIn == null%>){
				loginAlert();
			}
		});
		
		$("[name=boardCommentFrm]").submit(function(e){
			//로그인 여부 검사
			if(<%=memberLoggedIn == null%>){
				loginAlert();
				return false;
			}
			
			//내용검사
			var content = $("[name=boardCommentContent]").val().trim();
			if(content.length == 0){
				return false;				
			}
			return true;
		});
	});
	function loginAlert(){
		alert("로그인후 이용하실 수 있습니다.");
		$("#login-memberId").focus();
	}
	</script>
	<!-- 댓글 목록 테이블 -->
	<table id="tbl-comment">
		<%
	if(commentList != null){
		for(FreeBoardComment bc : commentList){
			if(bc.getFreeBoardCommentLevel() ==1){
	%>
		<tr class="level1">
			<td><sub class="comment-writer"><%=bc.getFreeBoardCommentWriter() %></sub>
				<sub class="comment-date"><%=bc.getFreeBoardCommentDate() %></sub> <br />
				<%=bc.getFreeBoardCommentContent() %></td>
			<td>
				<button class="btn-reply" value="<%=bc.getFreeBoardCommentNo()%>">답글</button>
				<% if(memberLoggedIn != null &&(bc.getFreeBoardCommentWriter().equals(memberLoggedIn.getMemberEmail())|| "A".equals(memberLoggedIn.getGrade()))){ %>
				<button class="btn-delete" value="<%=bc.getFreeBoardCommentNo()%>">삭제</button>


				<%} %>
			</td>
		</tr>
		<%
			}else{	
	%>
		<tr class="level2">
			<td><sub class="comment-writer"><%=bc.getFreeBoardCommentWriter() %></sub>
				<sub class="comment-date"><%=bc.getFreeBoardCommentDate() %></sub> <br />
				<%=bc.getFreeBoardCommentContent() %></td>
			<td>
				<% if(memberLoggedIn != null &&(bc.getFreeBoardCommentWriter().equals(memberLoggedIn.getMemberEmail())|| "A".equals(memberLoggedIn.getGrade()))){ %>
				<button class="btn-delete" value="<%=bc.getFreeBoardCommentNo()%>">삭제</button>


				<%} %>
			</td>
		</tr>

		<%
			}//end of if(level)
		
		}//end of for
	
	}//end of if(commentList)
	%>
	</table>
	<!-- 게시물 삭제폼 -->
	<form action="<%=request.getContextPath()%>/board/free_board/freeBoardDelete"
		method="POST" name="boardDelFrm">
		<input type="hidden" name="boardNo" value="<%=board.getFreeBoardNo() %>" />
		<input type="hidden" name="rName"
			value="<%=board.getFreeRenamedFileName()!=null?board.getFreeRenamedFileName():""%>" />
	</form>
	<script>
//@실습문제: 삭제 버튼클릭시, 댓글 삭제후에 현재페이지로 돌아오기
$(".btn-delete").click(function(){
	if(!confirm("정말 삭제하시겠습니까?"))
		return;
	
	location.href = "<%=request.getContextPath()%>/board/free_board/freeBoardCommentDelete?boardNo=<%=board.getFreeBoardNo()%>&delNo="+$(this).val();
	
});
$(".btn-reply").click(function(){
	<% if(memberLoggedIn!=null){%>
		//현재댓글 번호
		var boardCommentNo = $(this).val();
		//답글작성폼 생성
		var tr = $("<tr></tr>");
		var td = $("<td style = 'display:none; text-align:left;' colspan='2'></td>")
		var form = $("<form action='<%=request.getContextPath()%>/board/free_board/freeBoardCommentInsert' method='POST'></form>");
		form.append("<input type='hidden' name='boardRef' value='<%=board.getFreeBoardNo()%>'/>");
		form.append("<input type='hidden' name='boardCommentWriter' value='<%=memberLoggedIn!=null?memberLoggedIn.getMemberEmail():""%>'/>");
		form.append("<input type='hidden' name='boardCommentLevel' value='2'/>");
		form.append("<input type='hidden' name='boardCommentRef' value='"+boardCommentNo+"'/>");
		form.append("<textarea name = 'boardCommentContent' cols='60' rows='1'></textarea>");
		form.append("<button type='submit' class='btn-insert2'>등록</button>");
		td.html(form);
		tr.html(td);
		//노드 추가하는 메소드
		//tr>td.btn-reply
		tr.insertAfter($(this).parent().parent()).children("td").slideDown(800).children("form")
			.submit(function(e){
				let content = $(this).children("textarea").val().trim();
				if(content.length ==0)
					e.preventDefault();
				})
				.find("textarea").focus();
		//클릭이벤트 한번 실행후에는 핸들러 제거
		//this는 버튼 가리킴 .btn-reply
		$(this).off('click');
	<%} else {%>
		loginAlert();
	<%}%>
	});

function updateBoard(){
	location.href = "<%=request.getContextPath()%>/board/free_board/freeBoardUpdate?boardNo=<%=board.getFreeBoardNo()%>";
	
}
function deleteBoard(){
	if(!confirm("정말로 삭제하시겠습니까?"))
		return;
	
	$("[name=boardDelFrm]").submit();
	
}
function fileDownload(oName, rName){
	oName = encodeURIComponent(oName);
	console.log(oName);
	
	location.href = "<%=request.getContextPath()%>/board/free_board/freeBoardFileDownload" +"?oName="+oName + "&rName="+rName;	
    
}
</script>
	</body>
</html>