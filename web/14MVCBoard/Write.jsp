<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-28
  Time: 오전 2:04
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 첨부형 게시판</title>
    <link rel="stylesheet" href="<%= application.getContextPath() %>/Common/common.css" />
    <script type="text/javascript">
        function validateForm(form) {
            const inputInfo = [
                { title: 'name', text: '작성자' },
                { title: 'title', text: '제목' },
                { title: 'content', text: '내용' },
                { title: 'pass', text: '비밀번호' },
            ];

            for (const { title, text } of inputInfo) {
                if (!form[title].value) {
                    alert(`${ "${text}" }을/를 입력하세요.`);
                    form[title].focus();
                    return false;
                }
            }
        }
    </script>
</head>
<body>
    <h2>파일 첨부형 게시판 - 글쓰기(Write)</h2>
    <form name="writeFrm" method="post" enctype="multipart/form-data" action="<%= application.getContextPath() %>/14MVCBoard/mvcboard/write.do" onsubmit="return validateForm(this);">
        <table border="1" width="90%">
            <tr>
                <td><label for="name">작성자</label></td>
                <td><input type="text" name="name" style="width: 150px;" id="name" /></td>
            </tr>
            <tr>
                <td><label for="title">제목</label></td>
                <td><input type="text" name="title" style="width: 90%;" id="title" /></td>
            </tr>
            <tr>
                <td><label for="content">내용</label></td>
                <td><textarea name="content" style="width: 90%; height: 100px;" id="content"></textarea></td>
            </tr>
            <tr>
                <td><label for="attachedFile">첨부 파일</label></td>
                <td><input type="file" name="attachedFile" id="attachedFile" /></td>
            </tr>
            <tr>
                <td><label for="pass">비밀번호</label></td>
                <td><input type="password" name="pass" style="width: 100px" id="pass" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit">작성 완료</button>
                    <button type="reset">RESET</button>
                    <button type="button" onclick="location.href='<%= application.getContextPath() %>/14MVCBoard/mvcboard/list.do';">목록 바로가기</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>