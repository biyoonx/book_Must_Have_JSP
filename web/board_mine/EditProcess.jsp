<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-24
  Time: 오후 5:59
--%>

<%@ page import="board_mine.PostDTO" %>
<%@ page import="board_mine.BoardService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="CheckLoginProcess.jsp" %>

<%
    long num = Long.parseLong(request.getParameter("num"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    String userId = (String)session.getAttribute("UserId");

    BoardService boardService = new BoardService();
    String authorId = boardService.getPostDetail(num).getId();
    if (authorId.equals(userId)) {
        PostDTO post = PostDTO.builder()
                .num(num)
                .title(title)
                .content(content)
                .build();

        int result = boardService.updateEditPost(post);
        if (result == 1) {
            JSAlertFunc.alertLocation("수정 성공", "Detail.jsp?No=" + post.getNum(), out);
        } else {
            JSAlertFunc.alertBack("수정 실패", out);
        }
    } else {
        JSAlertFunc.alertBack("수정 실패", out);
    }

    boardService.close();
    return;
%>