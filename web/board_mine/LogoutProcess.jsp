<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-24
  Time: 오전 1:27
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    session.removeAttribute("UserId");
    session.removeAttribute("UserName");

    session.invalidate();

    response.sendRedirect("LoginForm.jsp");
%>