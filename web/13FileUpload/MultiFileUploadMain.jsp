<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-27
  Time: 오후 11:35
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MultiFileUpload</title>
    <script>
        function validateForm(form) {
            if (!form.title.value) {
                alert("제목을 입력하세요.");
                form.title.focus();
                return false;
            } else if (!form.attachedFile.value) {
                alert("첨부 파일은 필수입니다.");
                return false;
            }
        }
    </script>
</head>
<body>
    <h3>멀티 파일 업로드(multiple 속성 추가)</h3>
    <span style="color: red;">${ errorMessage }</span>
    <form name="fileForm" method="post" enctype="multipart/form-data" action="MultipleProcess.do" onsubmit="return validateForm(this);">
        <pre>
            제목 : <input type="text" name="title" />
            카테고리(선택사항)
                - <input type="checkbox" name="category" value="사진" checked />사진
                - <input type="checkbox" name="category" value="과제" />과제
                - <input type="checkbox" name="category" value="워드" />워드
                - <input type="checkbox" name="category" value="음원" />음원
            첨부 파일(다중 선택 가능) : <input type="file" name="attachedFile" multiple />
            <input type="submit" value="전송하기">
        </pre>
    </form>
</body>
</html>