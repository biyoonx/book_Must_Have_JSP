<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-23
  Time: 오후 6:53
--%>

<%@ page import="model1.board.BoardDTO" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="IsLoggedIn.jsp" %>

<%
    // 수정 내용 얻기
    long num = Long.parseLong(request.getParameter("num"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    // DTO에 저장
    BoardDTO dto = new BoardDTO();
    dto.setNum(num);
    dto.setTitle(title);
    dto.setContent(content);

    // DB에 반영
    BoardDAO dao = new BoardDAO(application);
    int affected = dao.updateEdit(dto);
    dao.close();

    // 결과 처리
    if (affected == 1) {
        response.sendRedirect(String.format("View.jsp?num=%d", dto.getNum()));
    } else {
        JSFunction.alertBack("게시글 수정을 실패하였습니다.", out);
    }
%>