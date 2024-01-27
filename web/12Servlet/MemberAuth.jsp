<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-27
  Time: 오전 12:29
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MemberAuth.jsp</title>
    <link rel="stylesheet" href="../Common/common.css">
</head>
<body>
    <h2>MVC 패턴으로 회원인증하기</h2>
    <p><strong>${ authMessage }</strong></p>
    <p><a href="./MemberAuth.mvc?id=nakja&pass=1234">회원인증(관리자)</a></p>
    <p><a href="./MemberAuth.mvc?id=musthave&pass=1234">회원인증(회원)</a></p>
    <p><a href="./MemberAuth.mvc?id=guest&pass=1234">회원인증(비회원)</a></p>
</body>
</html>