<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-16
  Time: 오후 5:25
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         errorPage="IsErrorPage.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>page 지시어 - errorPage/isErrorPage 속성</title>
</head>
<body>
    <h2>errorPage 속성 적용 페이지</h2>
    <%
        int myAge = Integer.parseInt(request.getParameter("age")) + 10;
        out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
    %>
</body>
</html>