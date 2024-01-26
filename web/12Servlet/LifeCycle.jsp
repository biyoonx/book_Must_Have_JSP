<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-27
  Time: 오전 12:10
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LifeCycle.jsp</title>
</head>
<body>
    <script>
        function requestAction(form, method) {
            form.method = (method === 1) ? 'get' : 'post';
            form.submit();
        }
    </script>

    <h2>서블릿 수명주기(Life Cycle) 메서드</h2>
    <form action="./LifeCycle.do">
        <input type="button" value="Get 방식 요청하기" onclick="requestAction(this.form, 1);" />
        <input type="button" value="Post 방식 요청하기" onclick="requestAction(this.form, 2);" />
    </form>
</body>
</html>