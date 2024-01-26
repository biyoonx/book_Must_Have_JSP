<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오후 10:56
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AnnoMapping.jsp</title>
</head>
<body>
    <h2>어노테이션으로 매핑하기</h2>
    <p><strong>${ message }</strong></p>
    <p><a href="<%= request.getContextPath() %>/12Servlet/AnnoMapping.do" style="color: blue;">바로가기</a> </p>
</body>
</html>