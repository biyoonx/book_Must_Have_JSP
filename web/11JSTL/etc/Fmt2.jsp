<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오후 6:11
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
    <title>JSTL - fmt 2</title>
</head>
<body>
    <c:set var="today" value="<%= new Date() %>" />

    <h4>날짜 포맷</h4>
    <pre>
        full : <fmt:formatDate value="${ today }" type="date" dateStyle="full" />
        short : <fmt:formatDate value="${ today }" type="date" dateStyle="short" />
        long : <fmt:formatDate value="${ today }" type="date" dateStyle="long" />
        default : <fmt:formatDate value="${ today }" type="date" dateStyle="default" />
    </pre>

    <h4>시간 포맷</h4>
    <pre>
        full : <fmt:formatDate value="${ today }" type="time" timeStyle="full" />
        short : <fmt:formatDate value="${ today }" type="time" timeStyle="short" />
        long : <fmt:formatDate value="${ today }" type="time" timeStyle="long" />
        default : <fmt:formatDate value="${ today }" type="time" timeStyle="default" />
    </pre>

    <h4>날짜/시간 표시</h4>
    <pre>
        full : <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full" />
        yyyy-MM-dd hh:mm:ss : <fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss" />
    </pre>

    <h4>타임존 설정</h4>
    <pre>
        <fmt:timeZone value="GMT">
            GMT : <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full" />
        </fmt:timeZone>
        <fmt:timeZone value="America/Chicago">
            America/Chicago : <fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full" />
        </fmt:timeZone>
    </pre>
</body>
</html>