<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-02-04
  Time: 오후 1:32
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LoginFilter.jsp</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/Common/common.css" />
    <style>
        .errMsg {
            color: red;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <h2>로그인 페이지[Filter]</h2>
    <span class="errMsg">
        <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
    </span>

    <%
        if (session.getAttribute("UserId") == null) {
    %>
        <script>
            function validateForm(form) {
                const formInfo = [{name: 'user_id', text: '아이디'}, {name: 'user_pw', test: '비밀번호'}];

                for (const info of formInfo) {
                    if (!form[info.name].value) {
                        alert(`${info.text}를 입력하세요.`);
                        return false;
                    }
                }
            }
        </script>

        <form name="loginFrm" method="post" onsubmit="return validateForm(this);">
            <input type="hidden" name="backUrl" value="${ param.backUrl }" />
            <label for="user_id">아이디 : </label>
            <input name="user_id" id="user_id" type="text" />
            <label for="user_pw">비밀번호 : </label>
            <input name="user_pw" id="user_pw" type="password" />
            <input type="submit" value="로그인하기" />
        </form>
    <%
        } else {
    %>
        <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.
        <a href="?mode=logout">[로그아웃]</a>
    <%
        }
    %>
</body>
</html>