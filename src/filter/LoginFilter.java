package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Builder;
import membership.MemberDAO;
import membership.MemberDTO;
import utils.JSFunction;

import java.io.IOException;

@WebFilter(filterName = "LoginFilter", urlPatterns = "/15FilterListener/LoginFilter.jsp")
public class LoginFilter implements Filter {
    // 회원 정보를 얻어오기 위해 필요한 데이터베이스 접속 정보
    @Builder
    @AllArgsConstructor
    static class DbInfo {
        String driver;
        String url;
        String id;
        String pwd;
    }
    DbInfo dbInfo;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);

        ServletContext application = filterConfig.getServletContext();
        this.dbInfo = DbInfo.builder()
                .driver(application.getInitParameter("MySQLDriver"))
                .url(application.getInitParameter("MySQLURL"))
                .id(application.getInitParameter("MySQLId"))
                .pwd(application.getInitParameter("MySQLPwd"))
                .build();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse res = (HttpServletResponse)response;

        HttpSession session = req.getSession();
        String method = req.getMethod();

        // 로그인 처리
        if (method.equalsIgnoreCase("POST")) {
            // 로그인 정보와 일치하는 회원 확인
            String userId = request.getParameter("user_id");
            String userPw = request.getParameter("user_pw");

            MemberDAO dao = new MemberDAO(dbInfo.driver, dbInfo.url, dbInfo.id, dbInfo.pwd);
            MemberDTO memberDTO = dao.getMemberDTO(userId, userPw);
            dao.close();

            // 일치하는 회원 존재
            if (memberDTO.getId() != null) {
                // 세션에 로그인 정보 저장
                session.setAttribute("UserId", memberDTO.getId());
                session.setAttribute("UserName", memberDTO.getName());

                // 다음 페이지로 이동
                String backUrl = request.getParameter("backUrl");
                if (backUrl != null && !backUrl.isEmpty()) {
                    JSFunction.alertLocation(res, "로그인 전 요청한 페이지로 이동합니다.", backUrl);
                    return;
                } else {
                    res.sendRedirect("../15FilterListener/LoginFilter.jsp");
                }
            // 일치하는 회원 없음
            } else {
                req.setAttribute("LoginErrMsg", "로그인에 실패했습니다.");
                req.getRequestDispatcher("../15FilterListener/LoginFilter.jsp")
                        .forward(req, res);
            }
        // 로그아웃 처리
        } else if (method.equalsIgnoreCase("GET")) {
            String mode = request.getParameter("mode");
            if (mode != null && mode.equalsIgnoreCase("logout")) {
                session.invalidate();
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}