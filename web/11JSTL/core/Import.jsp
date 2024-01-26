<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오후 4:25
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - import</title>
</head>
<body>
    <c:set var="PageVar" value="MustHave" scope="page" />
    <c:set var="requestVar" value="MustHave" scope="request" />
    <c:set var="sessionVar" value="MustHave" scope="session" />
    <c:import url="/11JSTL/inc/OtherPage.jsp" var="contents">
        <c:param name="user_param1" value="JSP" />
        <c:param name="user_param2" value="기본서" />
    </c:import>

    <h4>다른 문서 삽입하기</h4>
    ${ contents }

    <h4>외부 자원 삽입하기</h4>
    <iframe src="../inc/ExternalPage.jsp" style="width: 100%; height: 600px;"></iframe>
</body>
</html>