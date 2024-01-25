<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-25
  Time: 오후 6:51
--%>

<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    pageContext.setAttribute("num1", 9);
    pageContext.setAttribute("num2", "10");

    pageContext.setAttribute("nullStr", null);
    pageContext.setAttribute("emptyStr", "");
    pageContext.setAttribute("lengthZero", new Integer[0]);
    pageContext.setAttribute("sizeZero", new ArrayList<Object>());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>표현 언어(EL) - 연산자</title>
</head>
<body>
    <h3>empty 연산자</h3>
    <pre>
        empty nullStr : ${ empty nullStr }
        empty emptyStr : ${ empty emptyStr }
        empty lengthZero : ${ empty lengthZero }
        empty sizeZero : ${ empty sizeZero }
    </pre>

    <h3>삼항 연산자</h3>
    <pre>
        num1 gt num2 ? "참" : "거짓" ⇒ ${ num1 gt num2 ? "num1이 크다" : "num2가 크다" }
    </pre>

    <h3>null 연산</h3>
    <pre>
        null + 10 : ${ null + 10 }
        nullStr : 10 : ${ nullStr + 10 }
        param.noVar > 10 : ${ param.noVal > 10 }
    </pre>
</body>
</html>