<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-27
  Time: 오후 9:02
--%>

<%@ page import="fileupload.MyFileDAO" %>
<%@ page import="fileupload.MyFileDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FileUpload</title>
    <link rel="stylesheet" href="<%= "../Common/common.css" %>" />
</head>
<body>
    <h2>DB에 등록된 파일 목록 보기</h2>
    <a href="FileUploadMain.jsp">파일등록1</a>
    <a href="MultiUploadMain.jsp">파일등록2</a>

    <%
        MyFileDAO dao = new MyFileDAO();
        List<MyFileDTO> fileList = dao.myFileList();
        dao.close();
    %>

    <table border="1">
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>카테고리</th>
            <th>원본 파일명</th>
            <th>저장된 파일명</th>
            <th>작성일</th>
            <th>다운로드</th>
        </tr>
        <%
            for (MyFileDTO file : fileList) {
        %>
            <tr>
                <td><%= file.getIdx() %></td>
                <td><%= file.getTitle() %></td>
                <td><%= file.getCategory() %></td>
                <td><%= file.getOfile() %></td>
                <td><%= file.getSfile() %></td>
                <td><%= file.getPostdate() %></td>
                <td>
                    <a href="Download.jsp?oName=<%= URLEncoder.encode(file.getOfile(), StandardCharsets.UTF_8) %>&sName=<%= URLEncoder.encode(file.getSfile(), StandardCharsets.UTF_8) %>">[다운로드]</a>
                </td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>