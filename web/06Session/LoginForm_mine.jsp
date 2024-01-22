<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-22
  Time: 오후 2:09
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String loginErrMsg = (String)request.getAttribute("LoginErrMsg");
    String userId = (String)session.getAttribute("UserId");
    String userName = (String)session.getAttribute("UserName");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Session_mine</title>
    <style>
        .login_errMsg {
            color: red;
            font-size: 1.2em;
        }
        a {
            color: blue;
        }
    </style>
</head>
<body>
    <h2>로그인 페이지_mine</h2>
    <span class="login_errMsg">
        <%= loginErrMsg == null ? "" : loginErrMsg %>
    </span>

    <script>
        function validateForm(event, form) {
            event.preventDefault();

            let missing;
            if (document.querySelector('input#user_id').validity.valueMissing) {
                missing = '아이디';
            } else if (document.querySelector('input#user_pw').validity.valueMissing) {
                missing = '패스워드';
            }

            if (missing) {
                alert(`${"${missing}"}를 입력하세요.`);
            } else {
                form.submit();
            }
            return false;
        }
    </script>
        <%
            if (userId == null) {
        %>
            <form action="LoginProcess.jsp" method="post" name="loginFrm">
                <label for="user_id">아이디</label> :
                <input type="text" name="user_id" id="user_id" required /><br />
                <label for="user_pw">패스워드</label> :
                <input type="password" name="user_pw" id="user_pw" required /><br />
                <input type="submit" value="로그인하기" onclick="return validateForm(event, this);" />
            </form>
        <%
            } else {
        %>
            <%= userName %> 회원님, 로그인하셨습니다.<br />
            <a href="Logout.jsp">[로그아웃]</a>
        <%
            }
        %>
</body>
</html>