<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-02-04
  Time: 오후 7:19
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String mode = request.getParameter("mode");
    if (mode != null) {
        switch (mode) {
            case "1": session.setAttribute("mySession", "세션 영역"); break;
            case "2": session.removeAttribute("mySession"); break;
            case "3": session.invalidate(); break;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MyListener.jsp</title>
    <script>
        function formSubmit(form, modeValue) {
            form.mode.value = modeValue;
            form.submit();
        }
    </script>
</head>
<body>
    <h2>리스너 활용하기</h2>
    <form>
        <input type="hidden" name="mode" />

        <input type="button" value="세션 속성 저장" onclick="formSubmit(this.form, 1);" />
        <input type="button" value="세션 속성 삭제" onclick="formSubmit(this.form, 2);" />
        <input type="button" value="세션 전체 삭제" onclick="formSubmit(this.form, 3);" />
    </form>
</body>
</html>