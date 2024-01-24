<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-24
  Time: 오후 5:37
--%>

<%@ page import="board_mine.BoardService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="CheckLoginProcess.jsp" %>

<%
    long num = Long.parseLong(request.getParameter("num"));
    String userId = (String)session.getAttribute("UserId");

    BoardService boardService = new BoardService();
    String authorId = boardService.getPostDetail(num).getId();
    if (authorId.equals(userId)) {
        int result = boardService.deletePost(num);

        if (result == 1) {
            JSAlertFunc.alertLocation("삭제 성공", "ListAll.jsp", out);
        } else {
            JSAlertFunc.alertBack("삭제 실패", out);
        }
    } else {
        JSAlertFunc.alertBack("삭제 실패", out);
    }
    boardService.close();
%>