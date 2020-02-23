<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/common/header.jsp" %>
 <div class="update-container" id="update-container">
            <div class="update-form-container member-update-container">
                <form action="#" class="member-form">
                        <h1>회원정보수정</h1>
                    <table>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input class="update-input-box" type="email" name="memberEmail" id="memberEmail" value="<%=memberLoggedIn.getMemberEmail()%>"required/>
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td>
                                <input class="update-input-box"  type="password" name="memberPassword" id="memberPassword" value="<%=memberLoggedIn.getPassword()%>"  required/>
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td>
                                <input class="update-input-box"  type="password" name="memberPassword" id="memberPassword_2" value="<%=memberLoggedIn.getPassword()%>"  required/>
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>
                                <input class="update-input-box"  type="text" name="memberName"  value="<%=memberLoggedIn.getMemberName()%>"required/>
                            </td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td>
                                <input type="date" class="update-input-box" name="birthDay" id="birthDay" value="<%=memberLoggedIn.getBirthDay()%>" required/>
                            </td>
                        </tr>
                        <tr>
                            <th>휴대폰</th>
                            <td>
                                <input type="tel" class="update-input-box" name="phone" id="phone" maxlength="11" value="<%=memberLoggedIn.getPhone()%>"  required>
                            </td>
                        </tr>
                    </table>
                    <input type="button" class="update-button" onclick="updateMember();" value="수정하기"/>
                </form>
            </div>
        </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>


