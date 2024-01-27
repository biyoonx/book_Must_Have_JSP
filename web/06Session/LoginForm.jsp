<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-22
  Time: 오후 6:07
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Session</title>
    <link rel="stylesheet" href="<%= "../Common/common.css" %>" />
</head>
<body>
    <jsp:include page="../Common/Link.jsp" />
    <h2>로그인 페이지</h2>
    <span style="color: red; font-size: 1.2em;">
        <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
    </span>
    <%
        if (session.getAttribute("UserId") == null) { // 로그아웃(로그인된 아이디 없음)
    %>
    <script>
        function validateForm(form) {
            if (!form.user_id.value) {
                alert('아이디를 입력하세요.');
            } else if (!form.user_pw.value) {
                alert('패스워드를 입력하세요.');
            }

            return false;
        }
    </script>
    <form action="LoginProcess.jsp" method="post" name="loginFrm">
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="password" name="user_pw" /><br />
        <input type="submit" value="로그인하기" onsubmit="return validateForm(this);" />
    </form>
    <%
        } else { // 로그인(로그인된 아이디 있음)
    %>
    <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다. <br />
    <a href="Logout.jsp">[로그아웃]</a>
    <%
        }
    %>
</body>
</html>