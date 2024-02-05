<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-02-05
  Time: 오후 11:16
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MustHave 메일 템플릿</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/Common/common.css" />
</head>
<body>
    <h2>MustHave 메일 템플릿</h2>
    <table border="1">
        <tr>
            <td width="50">내용</td>
            <td>__CONTENT__</td><%-- 실제 메일 내용으로 대체 --%>
        </tr>
        <tr>
            <td>이미지</td>
            <td><img src="https://github.com/goldenrabbit2020/musthave_jsp/blob/main/GOLDEN-RABBIT_LOGO_150.png?raw=true" alt="골든래빗" /></td>
        </tr>
    </table>
</body>
</html>