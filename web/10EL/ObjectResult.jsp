
<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-25
  Time: 오후 5:22
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>표현 언어(EL) - 객체 매개변수</title>
</head>
<body>
    <h2>영역을 통해 전달된 객체 읽기</h2>
    <ul>
        <li>Person 객체 ⇒ 이름 : ${ personObj.name }, 나이 : ${ personObj.age }</li>
        <li>String 객체 ⇒ ${ requestScope.stringObj }</li>
        <li>Integer 객체 ⇒ ${ integerObj }</li>
    </ul>

    <h2>매개변수로 전달된 값 읽기</h2>
    <ul>
        <li>${ param.firstNum } + ${ param["secondNum"] }</li>
        <li>${ param.firstNum + param['secondNum'] }</li>
    </ul>
</body>
</html>