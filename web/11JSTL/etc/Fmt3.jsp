<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오후 6:28
--%>

<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - fmt 3</title>
</head>
<body>
    <h4>로케일 설정</h4>
    <c:set var="today" value="<%= new Date() %>" />

    <p>
        한글로 설정 :
        <fmt:setLocale value="ko_kr" />
        <fmt:formatNumber value="10000" type="currency" />
        /
        <fmt:formatDate value="${ today }" />
    </p>

    <p>
        일어로 설정 :
        <fmt:setLocale value="ja_JP" />
        <fmt:formatNumber value="10000" type="currency" />
        /
        <fmt:formatDate value="${ today }" />
    </p>

    <p>
        영어로 설정 :
        <fmt:setLocale value="en_US" />
        <fmt:formatNumber value="10000" type="currency" />
        /
        <fmt:formatDate value="${ today }" />
    </p>
</body>
</html>