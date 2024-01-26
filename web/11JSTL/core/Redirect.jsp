<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오후 4:41
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - redirect</title>
</head>
<body>
    <c:set var="pageVar" value="MustHave" scope="page" />
    <c:set var="requestVar" value="MustHave" scope="request" />
    <c:set var="sessionVar" value="MustHave" scope="session" />
    <c:redirect url="/11JSTL/inc/OtherPage.jsp">
        <c:param name="user_param1" value="출판사" />
        <c:param name="user_param2" value="골든래빗" />
    </c:redirect>
</body>
</html>