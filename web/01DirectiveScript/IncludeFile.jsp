<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-16
  Time: 오후 7:40
--%>

<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    LocalDate today = LocalDate.now(); // 오늘
    LocalDateTime tomorrow = LocalDateTime.now().plusDays(1); // 내일
%>