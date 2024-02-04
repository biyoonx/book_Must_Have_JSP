<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-02-04
  Time: 오후 1:04
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BasicFilter.jsp</title>
</head>
<body>
    <script>
        function formSubmit(form, methodType) {
            switch (methodType) {
                case 1: form.method = 'get'; break;
                case 2: form.method = 'post'; break;
            }
            form.submit();
        }
    </script>

    <h2>web.xml에서 매핑하기</h2>
    <form> <!-- <form> 태그 선언 시 action 속성을 지정하지 않으면 폼값을 현재 페이지로 전송 -->
        <input type="button" value="Get 방식 전송" onclick="formSubmit(this.form, 1);" />
        <input type="button" value="Post 방식 전송" onclick="formSubmit(this.form, 2);" />
    </form>
</body>
</html>