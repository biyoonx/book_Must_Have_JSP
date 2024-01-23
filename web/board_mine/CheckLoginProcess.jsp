<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-24
  Time: 오전 2:24
--%>

<%@ page import="board_mine.JSAlertFunc" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    if (session.getAttribute("UserId") == null) {
        JSAlertFunc.alertLocation("로그인 후 이용 가능", "LoginForm.jsp", out);
        return;
    }
%>