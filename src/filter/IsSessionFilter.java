package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

import java.io.IOException;

@WebFilter(urlPatterns = {
        "/09PagingBoard/Write.jsp",
        "/09PagingBoard/WriteProcess.jsp",
        "/09PagingBoard/Edit.jsp",
        "/09PagingBoard/EditProcess.jsp",
        "/09PagingBoard/DeleteProcess.jsp"
})
public class IsSessionFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse res = (HttpServletResponse)response;

        HttpSession session = req.getSession();
        // 로그아웃 상태
        if (session.getAttribute("UserId") == null) {
            String backUrl = req.getRequestURI();
            JSFunction.alertLocation(res, "[Filter] 로그인 후 이용해주십시오.", "../15FilterListener/LoginFilter.jsp?backUrl=" + backUrl);
            return;

        // 로그인 상태
        } else {
            chain.doFilter(request, response);
        }
    }
}