<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-23
  Time: 오후 10:24
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
</head>
<body>
    <h2>로그인 페이지</h2>
    <form>
        <div>
            <label for="user_id">아이디</label>
            <input type="text" name="user_id" id="user_id" />
            <input type="checkbox" name="remember_id" id="remember_id" value="true" <%= isRemembered %> />
            <label for="remember_id">아이디 기억하기</label>
        </div>
        <div>
            <label for="user_pw">비밀번호</label>
            <input type="password" name="user_pw" id="user_pw" />
        </div>
        <div>
            <input type="submit" name="login" />
        </div>
    </form>
</body>
</html>