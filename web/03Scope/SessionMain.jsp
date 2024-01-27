<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-17
  Time: 오후 6:04
--%>

<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    ArrayList<String> lists = new ArrayList<String>();
    lists.add("리스트");
    lists.add("컬렉션");
    session.setAttribute("lists", lists);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>session 영역</title>
    <link rel="stylesheet" href="<%= "../Common/common.css" %>" />
</head>
<body>
    <h2>페이지 이동 후 session 영역의 속성 읽기</h2>
    <a href="SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
</body>
</html>