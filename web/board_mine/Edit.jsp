<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-24
  Time: 오후 5:45
--%>

<%@ page import="board_mine.PostDTO" %>
<%@ page import="board_mine.BoardService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    long num = Long.parseLong(request.getParameter("num"));

    BoardService boardService = new BoardService();
    PostDTO post = boardService.getPostDetail(num);
    boardService.close();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 편집 페이지</title>
    <link rel="stylesheet" href="Registration.css">
    <script defer src="validateForm.js"></script>
</head>
<body>
    <jsp:include page="NavBar.jsp" />

    <h2>글 편집 페이지</h2>
    <form name="EditForm" class="editForm" method="post" action="EditProcess.jsp">
        <input type="hidden" name="num" value="<%= post.getNum() %>" />
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" id="title" required value="<%= post.getTitle() %>" /></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" id="content" required><%= post.getContent() %></textarea></td>
            </tr>
        </table>
        <div>
            <button type="submit" id="submitBtn">편집하기</button>
            <button type="reset">다시 입력</button>
            <button type="button" onclick="history.back();">뒤로가기</button>
        </div>
    </form>
</body>
</html>