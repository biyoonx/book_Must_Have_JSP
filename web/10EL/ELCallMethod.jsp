<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-25
  Time: 오후 8:18
--%>

<%@ page import="el.MyELClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>

<%
    MyELClass myELClass = new MyELClass();
    pageContext.setAttribute("myELClass", myELClass);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>표현 언어(EL) - 메서드 호출</title>
</head>
<body>
    <h3>영역에 저장 후 메서드 호출하기</h3>
    <pre>
        001225-1000000 ⇒ ${ myELClass.getGender("001225-1000000") }
        001225-2000000 ⇒ ${ myELClass.getGender("001225-2000000") }
        001225-3000000 ⇒ ${ myELClass.getGender("001225-3000000") }
        001225-4000000 ⇒ ${ myELClass.getGender("001225-4000000") }
        001225-5000000 ⇒ ${ myELClass.getGender("001225-5000000") }
    </pre>

    <h3>클래스명을 통한 정적 메서드 호출</h3>
    <div>
        ${ MyELClass.showGugudan(7) }
    </div>

    <h3>TLD 파일 등록 후 정적 메서드 호출하기</h3>
    <ul>
        <li>mytag:isNumber("100") ⇒ ${ mytag:isNumber("100") }</li>
        <li>mytag:isNumber("이백") ⇒ ${ mytag:isNumber("이백") }</li>
    </ul>
</body>
</html>