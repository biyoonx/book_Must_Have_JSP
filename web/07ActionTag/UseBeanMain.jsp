<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-22
  Time: 오후 10:54
--%>

<%@ page import="common.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션 태그 - UseBean</title>
</head>
<body>
    <h2>useBean 액션 태그</h2>
    <h3>자바빈즈 생성하기</h3>
    <jsp:useBean id="person" class="common.Person" scope="request" />
    <%--
        // <jsp:useBean> 액션 태그와 동일한 코드
        Person person = (Person)request.getAttribute("person");
        if (person == null) {
            person = new Person();
            request.setAttribute("person", person);
        }
    --%>

    <h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
    <jsp:setProperty name="person" property="name" value="임꺽정" />
    <jsp:setProperty name="person" property="age" value="41" />

    <h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
    <ul>
        <li>이름 : <jsp:getProperty name="person" property="name" /></li>
        <li>나이 : <jsp:getProperty name="person" property="age" /></li>
    </ul>
</body>
</html>