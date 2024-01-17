<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-17
  Time: 오후 10:42
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true" %>

<%
    String isPopupMode = request.getParameter("isPopupMode");

    if (isPopupMode != null && !Boolean.parseBoolean(isPopupMode)) {
        Cookie cookie = new Cookie("isPopupMode", isPopupMode);
        cookie.setPath(request.getContextPath());
        cookie.setMaxAge(60 * 60 * 24);
        response.addCookie(cookie);
        out.println("쿠키 : 하루 동안 열지 않음");
    }
%>