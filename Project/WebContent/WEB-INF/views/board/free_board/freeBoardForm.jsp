<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Document</title>
</head>
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
        width: 50%;
        font-size:12px;
        background:#feffff;
        margin:20px;
        border-radius:3px;
        margin: 30px auto;
        box-shadow: 0 1px 2px #d1d1d1;
	    border-collapse:collapse;  
        }
        table th {
        padding:15px;
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
        text-align: center;
        padding-left:20px;
        }
        #title{
        font-size: 20px;
        text-align: left;
        background: #ee8342;
        }
        #footer{
        background: #ee8342;
        }
        table tr td:first-child{
        padding-left:20px;
        border-left: 0;
        }
        table tr:first-child td {
        color: white;
        padding:12px;
        }
        table tr td {
            border-left: 2px solid silver;
        /* border:solid black; */
        padding:12px;
        }
        table tr:nth-child(2) {
        margin: 20px;
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
        #tbl-board-content{
            width: 80%;
        }
        #tbl-board-content th{
            background: rgb(243, 243, 243);
        }
        #tbl-board-content tr{
            border-bottom: 2px solid rgb(200, 200, 200);
        }
        #tbl-board-content td{
            text-align: left;
        }
        input{
            width:70%;
            /* font-size:20px; */
        }
        </style>
        <script>
        function boardValidate(){
        	var boardTitle = document.getElementById("boardTitle").value.trim();
        	var boardContent = document.getElementById("boardContent").value.trim();
        	
        	if(boardTitle.length == 0){
        		alert("제목을 입력해주세요")
        		document.getElementById("boardTitle").focus();
        		return false;
        	}  	
        	if(boardContent.length == 0){
        		alert("내용을 입력해주세요")
        		document.getElementById("boardContent").focus();
        		return false;        	
        	}
        	return true;
        };
        
        </script>
    </head>
    <body>
        <div id="board-view">
                <form action="<%=request.getContextPath() %>/board/free_board/freeBoardFormEnd" method="post"
                        enctype="multipart/form-data"> <!-- 반드시 선언해야 입출력이 가능하다.  -->
                <table id="tbl-board-view">
                <tr>
                    <td colspan="2" id="title">
                        게시물등록
                    </td>
                </tr> 
                <tr>
                    <td>
                        <table id="tbl-board-content">
                                <tr>
                                        <th>제 목</th>
                                        <td><input type="text" name="boardTitle" id="boardTitle" required></td>
                                    </tr>
                                    <tr>
                                        <th>작성자</th>
                                        <td>
                                            <input type="text" name="boardWriter" value="<%=memberLoggedIn.getMemberId() %>" readonly/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>첨부파일</th>
                                        <td>			
                                            <input type="file" name="upFile">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>내 용</th>
                                        <td><textarea rows="5" cols="50" name="boardContent" id="boardContent"></textarea></td>
                                    </tr>
                        </table>


                    </td>
                </tr>
                <tr>
                    <th colspan="2" id="footer">
                            <button class="w3-button w3-white w3-border w3-round-large" onclick="return boardValidate();">등록하기</button>
                    </th>
                </tr>   
                
            </table>
            </form>
       </div>
    </body>
</html>