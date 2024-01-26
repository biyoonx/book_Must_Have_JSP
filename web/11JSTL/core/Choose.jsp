<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오후 2:42
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - choose/when/otherwise</title>
</head>
<body>
<%--    변수 선언--%>
    <c:set var="number" value="100" />

    <h4>choose 태그로 홀짝 판단하기</h4>
    <c:choose>
        <c:when test="${ number % 2 == 0 }">
            ${ number }는 짝수입니다.
        </c:when>
        <c:otherwise>
            ${ number }는 홀수입니다.
        </c:otherwise>
    </c:choose>

    <h4>국, 영, 수 점수를 입력하면 평균을 내어 학점 출력</h4>
    <p>점수 입력 폼</p>
    <form>
        국어 : <input type="text" name="kor" value="${ param.kor }"/>
        영어 : <input type="text" name="eng" value="${ param.eng }" />
        수학 : <input type="text" name="math" value="${ param.math }" />
        <input type="submit" value="학점 구하기" />
    </form>

    <p>점수 입력 결과</p>
    <c:if test="${ not (empty param.kor or empty param.eng or empty param.math ) }">
        <p>
            <c:set var="avg" value="${ (param.kor + param.eng + param.math) / 3 }" />
            평균 : ${ avg }점

<%--            version 1--%>
            학점 :
            <c:choose>
                <c:when test="${ avg >= 90 }">A</c:when>
                <c:when test="${ avg >= 80 }">B</c:when>
                <c:when test="${ avg >= 70 }">C</c:when>
                <c:when test="${ avg >= 60 }">D</c:when>
                <c:otherwise>F</c:otherwise>
            </c:choose>

<%--            version 2--%>
            <br /><br />
            <c:choose>
                <c:when test="${ avg >= 90 }">${ grade = 'A';'' }</c:when>
                <c:when test="${ avg >= 80 }">${ grade = 'B';'' }</c:when>
                <c:when test="${ avg >= 70 }">${ grade = 'C';'' }</c:when>
                <c:when test="${ avg >= 60 }">${ grade = 'D';'' }</c:when>
                <c:otherwise>${ grade = 'F';'' }</c:otherwise>
            </c:choose>
            학점 : ${ grade }
        </p>
    </c:if>
</body>
</html>