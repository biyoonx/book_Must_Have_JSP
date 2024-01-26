<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오후 6:45
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="x" uri="jakarta.tags.xml" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - xml</title>
</head>
<body>
    <c:set var="booklist">
        <c:import url="/11JSTL/inc/BookList.xml" charEncoding="UTF-8" />
    </c:set>
    <x:parse xml="${ booklist }" var="blist" />

    <h4>파싱 1</h4>
    <pre>
        제목 : <x:out select="$blist/booklist/book[1]/name" />
        저자 : <x:out select="$blist/booklist/book[1]/author" />
        가격 : <x:out select="$blist/booklist/book[1]/price" />
    </pre>

    <h4>파싱 2</h4>
    <table border="1">
        <tr>
            <th>제목</th>
            <th>저자</th>
            <th>가격</th>
        </tr>
        <x:forEach select="$blist/booklist/book" var="item">
            <tr>
                <td><x:out select="$item/name" /></td>
                <td><x:out select="$item/author" /></td>
                <td>
                    <x:choose>
                        <x:when select="$item/price >= 20000">2만 원 이상</x:when>
                        <x:otherwise>2만 원 미만</x:otherwise>
                    </x:choose>
                </td>
            </tr>
        </x:forEach>
    </table>

    <h4>파싱 3</h4>
    <table border="1">
        <x:forEach select="$blist/booklist/book" var="item">
            <tr>
                <td><x:out select="$item/name" /></td>
                <td><x:out select="$item/author" /></td>
                <td><x:out select="$item/price" /></td>
                <td>
                    <x:if select="$item/name = '총, 균, 쇠'">구매함</x:if>
                </td>
            </tr>
        </x:forEach>
    </table>
</body>
</html>