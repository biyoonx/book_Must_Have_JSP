<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-17
  Time: 오전 12:13
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내장 객체 - response</title>
</head>
<body>
    <%
        String id = request.getParameter("user_id");
        String pwd = request.getParameter("user_pwd");
        if (id.equalsIgnoreCase("biyoonx") && pwd.equals("123456")) {
            response.sendRedirect("ResponseWelcome.jsp");
        } else {
            request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
                   .forward(request, response);
        }
    %>
</body>
</html>