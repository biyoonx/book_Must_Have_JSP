<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-18
  Time: 오전 12:26
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<%
    String chkVal = request.getParameter("inactiveToday");

    if (chkVal != null && chkVal.equals("1")) {
        Cookie cookie = new Cookie("PopupClose", "off");
        cookie.setPath(request.getContextPath());
        cookie.setMaxAge(60 * 60 * 24);
        response.addCookie(cookie);
        out.println("쿠키 : 하루 동안 열지 않음");
    }
%>