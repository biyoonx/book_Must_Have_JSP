<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-24
  Time: 오전 4:01
--%>

<%@ page import="java.util.List" %>
<%@ page import="board_mine.PostDTO" %>
<%@ page import="board_mine.BoardService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String searchField = request.getParameter("searchField");
    String searchKeyword = request.getParameter("searchKeyword");

    BoardService boardService = new BoardService();
    List<PostDTO> posts = boardService.getAllList(searchField, searchKeyword);
    boardService.close();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원제 전체 게시판(my version)</title>
    <link rel="stylesheet" href="ListAll.css">
</head>
<body>
    <jsp:include page="NavBar.jsp" />

    <h2>회원제 전체 게시판</h2>
    <form name="SearchForm" method="get" class="searchForm">
        <select name="searchField">
            <option value="title">제목</option>
            <option value="content">내용</option>
        </select>
        <input type="text" name="searchKeyword" />
        <input type="submit" value="검색" />
    </form>
    <table class="list">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (PostDTO post : posts) {
            %>
                <tr>
                    <td><%= post.getNum() %></td>
                    <td class="detailBtn" onclick="location.href='Detail.jsp?No=<%= post.getNum() %>'"><%= post.getTitle() %></td>
                    <td><%= post.getName() %></td>
                    <td><%= post.getPostDate() %></td>
                    <td><%= post.getVisitCount() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <button type="button" class="registrationBtn" onclick="location.href='Registration.jsp'">글쓰기</button>
</body>
</html>