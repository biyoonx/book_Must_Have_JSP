<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-26
  Time: 오후 4:23
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<h4>OtherPage.jsp</h4>
<ul>
    <li>저장된 값(page) : ${ pageVar }</li>
    <li>저장된 값(request) : ${ requestVar }</li>
    <li>저장된 값(session) : ${ sessionVar }</li>
    <li>매개변수 1 : ${ param.user_param1 }</li>
    <li>매개변수 2 : ${ param.user_param2 }</li>
</ul>