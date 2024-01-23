<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-23
  Time: 오후 7:15
--%>

<%@ page import="model1.board.BoardDTO" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="IsLoggedIn.jsp"%>

<%
    long num = Long.parseLong(request.getParameter("num"));

    BoardDAO dao = new BoardDAO(application);
    BoardDTO dto = dao.selectView(num);

    // 로그인된 사용자 ID 얻기
    String sessionId = session.getAttribute("UserId").toString();

    int delResult = 0;

    if (sessionId.equals(dto.getId())) {
        delResult = dao.deletePost(dto);

        // 결과 처리
        if (delResult == 1) {
            JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
        } else {
            JSFunction.alertBack("삭제를 실패하였습니다.", out);
        }
    } else {
        JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
    }
    dao.close();
%>