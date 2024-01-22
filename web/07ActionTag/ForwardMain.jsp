<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-22
  Time: 오후 9:09
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    pageContext.setAttribute("pAttr", "김유신");
    request.setAttribute("rAttr", "계백");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션 태그 - forward</title>
</head>
<body>
    <h2>액션 태그를 이용한 포워딩</h2>
    <jsp:forward page="/07ActionTag/ForwardSub.jsp" />
</body>
</html>