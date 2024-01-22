<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-22
  Time: 오후 4:09
--%>

<%@ page import="membership.MemberDAO" %>
<%@ page import="membership.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    // 로그인 폼으로부터 받은 아이디와 패스워드
    String userId = request.getParameter("user_id");
    String userPwd = request.getParameter("user_pw");

    // web.xml에서 가져온 데이터베이스 연결 정보
    // Oracle
//    String oracleDriver = application.getInitParameter("OracleDriver");
//    String oracleURL = application.getInitParameter("OracleURL");
//    String oracleId = application.getInitParameter("OracleId");
//    String oraclePwd = application.getInitParameter("OraclePwd");
    // MySQL
    String mysqlDriver = application.getInitParameter("MySQLDriver");
    String mysqlURL = application.getInitParameter("MySQLURL");
    String mysqlId = application.getInitParameter("MySQLId");
    String mysqlPwd = application.getInitParameter("MySQLPwd");

    // 회원 테이블 DAO를 통해 회원 정보 DTO 획득
    MemberDAO dao = new MemberDAO(mysqlDriver, mysqlURL, mysqlId, mysqlPwd);
    MemberDTO member = dao.getMemberDTO(userId, userPwd);
    dao.close();

    // 로그인 성공 여부에 따른 처리
    if (member.getId() != null) { // 로그인 성공
        session.setAttribute("UserId", member.getId());
        session.setAttribute("UserName", member.getName());
        response.sendRedirect("LoginForm.jsp");
    } else { // 로그인 실패
        request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
        request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
    }
%>