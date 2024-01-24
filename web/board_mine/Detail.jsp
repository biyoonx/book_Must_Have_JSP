<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-24
  Time: 오후 3:25
--%>

<%@ page import="board_mine.PostDTO" %>
<%@ page import="board_mine.BoardService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String userId = (String)session.getAttribute("UserId");
    long num = Long.parseLong(request.getParameter("No"));

    BoardService boardService = new BoardService();
    boardService.updateVisitCountUp(num);
    PostDTO post = boardService.getPostDetail(num);
    boardService.close();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세 조회</title>
    <link rel="stylesheet" href="Detail.css">
    <script defer src="deletePost.js"></script>
</head>
<body>
    <jsp:include page="NavBar.jsp" />

    <h2>게시글 상세 조회</h2>
    <table>
        <tr>
            <th>번호</th>
            <td><%= post.getNum() %></td>
            <th>작성자</th>
            <td><%= post.getName() %></td>
        </tr>
        <tr>
            <th>작성일</th>
            <td><%= post.getPostDate() %></td>
            <th>조회수</th>
            <td><%= post.getVisitCount() %></td>
        </tr>
        <tr class="detail_title">
            <th>제목</th>
            <td colspan="3"><%= post.getTitle() %></td>
        </tr>
        <tr class="detail_content">
            <th>내용</th>
            <td colspan="3"><%= post.getContent().replace("\r\n", "<br />") %></td>
        </tr>
    </table>
    <form name="DetailForm">
        <%
            if (userId != null && userId.equals(post.getId())) {
        %>
            <input type="hidden" name="num" value="<%= post.getNum() %>">
            <button type="button" onclick="location.href='Edit.jsp?num=<%= post.getNum() %>';">수정하기</button>
            <button type="submit" id="deleteBtn">삭제하기</button>
        <%
            }
        %>
            <button type="button" onclick="location.href='ListAll.jsp'">목록 보기</button>
    </form>
</body>
</html>