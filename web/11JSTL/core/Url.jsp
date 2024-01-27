<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오후 4:53
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - url</title>
    <link rel="stylesheet" href="<%= "../../Common/common.css" %>" />
</head>
<body>
    <c:set var="pageVar" value="MustHave" scope="page" />
    <c:set var="requestVar" value="MustHave" scope="request" />
    <c:set var="sessionVar" value="MustHave" scope="session" />

    <h4>url 태그로 링크 걸기</h4>
    <c:url value="/11JSTL/inc/OtherPage.jsp" var="url">
        <c:param name="user_param1" value="Must" />
        <c:param name="user_param2">Have</c:param>
    </c:url>
    <a href="${ url }">OtherPage.jsp 바로가기</a>
</body>
</html>