<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-22
  Time: 오후 7:00
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<table border="1" width="90%">
    <tr>
        <td align="center">
<%--            로그인 여부에 따른 메뉴 변화 --%>
            <% if (session.getAttribute("UserId") == null) { // 로그아웃 %>
                <a href="../06Session/LoginForm.jsp">로그인</a>
            <% } else { // 로그인 %>
                <a href="../06Session/Logout.jsp">로그아웃</a>
            <% } %>

<%--            게시판 링크 --%>
            &nbsp;&nbsp;&nbsp;
            <a href="../08Board/List.jsp">게시판(페이징X)</a>
            &nbsp;&nbsp;&nbsp;
            <a href="../09PagingBoard/List.jsp">게시판(페이징O)</a>
        </td>
    </tr>
</table>