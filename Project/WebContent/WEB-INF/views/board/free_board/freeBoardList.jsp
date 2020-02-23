<%@page import="board.free_board.model.vo.FreeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageBar = (String)request.getAttribute("pageBar");
	List<FreeBoard> list = (List<FreeBoard>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <style>
    body{
    width: 100%;
    height: auto;
    text-align: center;
    margin: 0 auto;
    background: rgba(255, 255, 255, 0.8);
    }
    header{
        font-size: 20px;
        font-weight: 300px;
    }
    table {
    width: 60%;
    font-size:12px;
    text-shadow: 1px 1px 0px #fff;
    background:#feffff;
    margin:20px;
    border-radius:3px;
    margin: 30px auto;
    box-shadow: 0 1px 2px #d1d1d1;
    }
    table th {
    padding:15px;
    background: #fffdfd;
    /* border-bottom: 2px solid black; */
    }
    table th:first-child{
    padding-left:20px;
    }
    table tr:first-child th:first-child{
    border-top-left-radius:3px;
    }
    table tr:first-child th:last-child{
    border-top-right-radius:3px;
    }
    table tr{
    border-bottom: 3px solid rgb(138, 138, 138);
    text-align: center;
    padding-left:20px;
    }
    table tr td:first-child{
    padding-left:20px;
    border-left: 0;
    }
    table tr:first-child td {
    border-top:2px solid black;
    border-bottom: 3px solid black;
    padding:12px;
    }
    table tr:nth-child(2) td {
    border-bottom: 5px solid rgb(138, 138, 138);
    }
    table tr td {
    padding:12px;
    }
    table tr.even td{
    background: #f6f6f6;
    }
    table tr:last-child td{
    border-bottom:0;
    }
    table tr:last-child td:first-child{
    border-bottom-left-radius:3px;
    }
    table tr:last-child td:last-child{
    border-bottom-right-radius:3px;
    }
    table tr:hover td{
    background: #f2f2f2;

    }
    #board-no{
        width: 10%;
    }
    #board-title{
        width: 20%;
    }
    #board-writer{
        width: 10%;
    }
    #board-date{
        width: 10%;
    }
    #board-readCount{
        width: 10%;
    }
     table tr:nth-child(2){
    border-bottom: 3px solid rgb(138, 138, 138);
    padding:12px;
    }
    a{
    text-decoration:none;
    }
    a:link { color: red; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: blue; text-decoration: underline;}
    </style>
</head>
<body>
	 <div id="list">
        <h1>자유게시판</h1>
        <%if(memberLoggedIn != null){ %>
			<input type="button" value="글쓰기" id="btn-add"
			onclick="location.href='<%=request.getContextPath() %>/board/free_board/freeBoardForm'"/>
		<%} %>
          <table id="tbl-list">
        <tr><td colspan="5">마이군산</td></tr>
        <tr>
			<th id="board-no">번호</th>
			<th id="board-title">제목</th>
			<th id="board-writer">작성자</th>
			<th id="board-date">작성일</th>
            <th id="board-readCount">조회수</th>
        </tr>
        <% if(list==null || list.isEmpty()){ %>
            <tr>
                <td colspan="10" align="center"> 검색 결과가 없습니다. </td>
            </tr>
        <% 
            } 
            else {
                for(FreeBoard b : list){ 
        %>
            <tr>
                <td><%=b.getFreeBoardNo()%></td>
                <td>
                <a href="<%=request.getContextPath()%>/board/free_board/freeBoardView?boardNo=<%=b.getFreeBoardNo()%>">
                <%=b.getFreeBoardTitle()%>                
                </a></td>
				<td><%=b.getFreeBoardWriter()%></td>
                <td><%=b.getFreeBoardDate()%></td>
                <td><%=b.getFreeReadCount()%></td>
            </tr>		
        <%		} 
            }
        %>
    </table>
    <div id='pageBar'><%=pageBar %></div>
   </div>
</body>
</html>