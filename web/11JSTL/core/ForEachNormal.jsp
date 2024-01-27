<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오후 3:36
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - forEach 1</title>
    <link rel="stylesheet" href="<%= "../../Common/common.css" %>" />
</head>
<body>
    <h4>일반 for문 형태의 forEach 태그</h4>
    <c:forEach begin="1" end="3" step="1" var="i">
        <p>${ i }회째 반복입니다.</p>
    </c:forEach>

    <h4>varState 속성 살펴보기</h4>
    <table border="1">
        <c:forEach begin="3" end="5" var="i" varStatus="loop">
            <tr>
                <td>count : ${ loop.count }</td>
                <td>index : ${ loop.index }</td>
                <td>current : ${ loop.current }</td>
                <td>first : ${ loop.first }</td>
                <td>last : ${ loop.last }</td>
            </tr>
        </c:forEach>
    </table>

    <h4>1에서 100까지 정수 중 홀수의 합</h4>
    <c:forEach begin="1" end="100" var="j">
        <c:if test="${ j % 2 != 0 }">
            <c:set var="sum" value="${ sum + j }" />
        </c:if>
    </c:forEach>
    1 ~ 100 사이의 정수 중 홀수의 합 : ${ sum }
</body>
</html>