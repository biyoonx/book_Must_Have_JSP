<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-17
  Time: 오후 2:17
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내장 객체 - exception</title>
</head>
<body>
    <%
        // 아래의 코드가 동작하려면 web.xml에 있는 error-page 태그 설정이 주석해제되어야함.

        // response 내장 객체로부터 에러 코드 확인
        int status = response.getStatus();

        // 에러 코드에 따라 적절한 메시지 출력
        String errType = status >= 400 ? status + " 에러가 발생하였습니다.<br />" : "상태코드 " + status;
        String action = "";
        switch (status) {
            case 404: action = "파일 경로를 확인해 주세요."; break;
            case 405: action = "요청 방식(method)을 확인해 주세요."; break;
            case 500: action = "소스 코드에 오류가 없는지 확인해 주세요."; break;
        }; // 분명 JDK 17을 선택했는데 왜 자바 14 이상이어야 switch 표현식이 가능하다고 에러날까? 다른 기본 설정들이 호환되지 않는 걸까?

        out.print(errType);
        out.print(action);
    %>
</body>
</html>