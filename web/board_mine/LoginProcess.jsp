<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-24
  Time: 오전 12:38
--%>

<%@ page import="board_mine.MemberService" %>
<%@ page import="board_mine.CookieManagerUtil" %>
<%@ page import="board_mine.JSAlertFunc" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String userId = request.getParameter("user_id");
    String userPw = request.getParameter("user_pw");
    boolean isRemembered = Boolean.parseBoolean(request.getParameter("remember_id"));

    MemberService memberService = new MemberService();
    boolean isMember = memberService.isMember(userId, userPw);

    if (isMember) {
        String userName = memberService.getMemberDetail(userId).getName();
        String isRememberCookieName = "isRemembered";
        if (isRemembered) {
            CookieManagerUtil.makeCookie(response, isRememberCookieName, String.valueOf(isRemembered), 14 * 24 * 60);
            CookieManagerUtil.makeCookie(response, "UserId", userId, 14 * 24 * 60);
        } else {
            CookieManagerUtil.deleteCookie(response, isRememberCookieName);
            CookieManagerUtil.deleteCookie(response, "UserId");
        }

        session.setAttribute("UserId", userId);
        session.setAttribute("UserName", userName);
        response.sendRedirect("LoginForm.jsp");
    } else {
        JSAlertFunc.alertBack("로그인 실패", out);
        return;
    }
%>