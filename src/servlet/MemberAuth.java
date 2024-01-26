package servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import membership.MemberDAO;
import membership.MemberDTO;

import java.io.IOException;

public class MemberAuth extends HelloServlet {
    private static final long serialVersionUID = 1L;
    MemberDAO dao;

    @Override
    public void init() throws ServletException {
        // application 내장 객체 얻기
        ServletContext application = this.getServletContext();

        // web.xml에서 DB 연결 정보 얻기
        String driver = application.getInitParameter("MySQLDriver");
        String connectUrl = application.getInitParameter("MySQLURL");
        String mId = application.getInitParameter("MySQLId");
        String mPass = application.getInitParameter("MySQLPwd");

        // DAO 생성
        dao = new MemberDAO(driver, connectUrl, mId, mPass);
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 서블릿 초기화 매개변수에서 관리자 ID 받기
        String adminId = this.getInitParameter("AdminId");

        // 인증을 요청한 ID/Password
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");

        // 회원 테이블에서 인증 요청한 ID/Password에 해당하는 회원 찾기
        MemberDTO memberDTO = dao.getMemberDTO(id, pass);

        // 찾은 회원의 이름에 따른 처리
        String memberName = memberDTO.getName();;
        String authMessage = null;
        if (memberName != null) {
            authMessage = memberName + " 회원님 반갑습니다.";
        } else {
            authMessage = adminId.equals(id) ? adminId + "는 최고 관리자입니다." : "귀하는 회원이 아닙니다.";
        }
        req.setAttribute("authMessage", authMessage);
        req.getRequestDispatcher("/12Servlet/MemberAuth.jsp")
                .forward(req, resp);
    }

    @Override
    public void destroy() {
        dao.close();
    }
}