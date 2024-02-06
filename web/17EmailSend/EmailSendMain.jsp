<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-02-05
  Time: 오후 10:43
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMTP 이메일 전송</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/Common/common.css" />
    <script src="EmailInfoToHide.js"></script>
</head>
<body>
    <h2>이메일 전송하기</h2>
    <form method="post" action="SendProcess.jsp" name="EmailSendForm">
        <table border="1">
            <tr>
                <td>
                    <label for="from">보내는 사람 : </label>
                    <input type="text" name="from" id="from" readonly />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="to">받는 사람 : </label>
                    <input type="text" name="to" id="to" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="subject">제목 : </label>
                    <input type="text" name="subject" id="subject" size="50" />
                </td>
            </tr>
            <tr>
                <td>
                    형식 :
                    <input type="radio" name="format" value="text" id="text" checked />
                    <label for="text">Text</label>
                    <input type="radio" name="format" value="html" id="html" />
                    <label for="html">HTML</label>
                </td>
            </tr>
            <tr>
                <td>
                    <textarea name="content" cols="60" rows="10"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <button type="submit">전송하기</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>