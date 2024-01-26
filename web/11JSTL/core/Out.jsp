<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오후 5:03
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - out</title>
</head>
<body>
    <c:set var="iTag">
        i 태그는 <i>기울임</i>을 표현합니다.
    </c:set>

    <h4>기본 사용</h4>
    <c:out value="${ iTag }" />

    <h4>escapeXml 속성</h4>
    <c:out value="${ iTag }" escapeXml="false" />

    <h4>default 속성</h4>
    <c:out value="${ param.name }" default="이름 없음" />
    <c:out value="" default="빈 문자열도 값입니다." />

    <p>null값 표현 확인</p>
    <pre>
        null : <c:out value="null" default="It's null" />
        null : ${ null }
        null : ${ 'null' }

        <c:set var="nullStr" value="null" />
        null : ${ nullStr }

        <c:set var="nullVar" value="${ null }" />
        null : <c:out value="${ nullVar }" default="It's null" />
        null : ${ nullVar }

        null : <c:out value="${ null }" default="It's null" />
        null : <c:out value="${ null }" default="${ null }" />
        null : <c:out value="${ null }" />
    </pre>
</body>
</html>