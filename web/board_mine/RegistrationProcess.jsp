<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-24
  Time: 오후 2:39
--%>

<%@ page import="board_mine.PostDTO" %>
<%@ page import="board_mine.BoardService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="CheckLoginProcess.jsp"%>

<%
    String userId = (String)session.getAttribute("UserId");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    PostDTO post = PostDTO.builder()
            .id(userId)
            .title(title)
            .content(content)
            .build();

    BoardService boardService = new BoardService();
    int result = boardService.insertPost(post);
    boardService.close();

    if (result == 1) {
        JSAlertFunc.alertLocation("글 등록 성공", "ListAll.jsp", out);
    } else {
        JSAlertFunc.alertBack("글 등록 실패", out);
    }
    return;
%>