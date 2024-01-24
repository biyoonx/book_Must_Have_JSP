<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-24
  Time: 오전 11:17
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="CheckLoginProcess.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 작성 페이지</title>
    <link rel="stylesheet" href="Registration.css">
    <script defer src="validateForm.js"></script>
</head>
<body>
    <jsp:include page="NavBar.jsp" />

    <h2>글 작성 페이지</h2>
    <form name="RegistrationForm" method="post" action="RegistrationProcess.jsp" class="registrationForm">
        <table>
            <tr>
                <th><label for="title">제목</label></th>
                <td><input type="text" name="title" id="title" required /></td>
            </tr>
            <tr>
                <th><label for="content">내용</label></th>
                <td><textarea name="content" id="content" required></textarea></td>
            </tr>
        </table>
        <div>
            <button type="submit" id="submitBtn">등록하기</button>
            <button type="reset">다시 입력</button>
            <button type="button" onclick="history.back()">목록보기</button>
        </div>
    </form>
</body>
</html>