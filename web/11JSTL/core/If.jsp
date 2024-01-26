<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오전 12:43
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - if</title>
</head>
<body>
<%--    변수 선언--%>
    <c:set var="number" value="100" />
    <c:set var="string" value="JSP" />

    <h4>JSTL의 if 태그로 짝수/홀수 판단하기</h4>
    <pre>
        <c:if test="${ number % 2 == 0 }" var="result1">
            ${ number }은 짝수입니다.
        </c:if>
        result : ${ result1 }
    </pre>

    <h4>문자열 비교와 else 구문 흉내내기</h4>
    <pre>
        <c:if test="${ string eq 'Java' }" var="result2">
            문자열은 Java입니다.
        </c:if>
        <c:if test="${ not result2 }">
            문자열은 'Java'가 아닙니다.
        </c:if>
    </pre>

    <h4>조건식 주의사항</h4>
    <pre>
        <c:if test="100" var="result3">
            EL이 아닌 정수를 지정하면 false
        </c:if>
        result3 : ${ result3 }

        <c:if test="tRuE" var="result4">
            대소문자 구분 없이 "tRuE"인 경우 true
        </c:if>
        result4 : ${ result4 }

        <c:if test=" ${ true } " var="result5">
            EL 양쪽에 빈 공백이 있는 경우 false
        </c:if>
        result5 : ${ result5 }
    </pre>
</body>
</html>