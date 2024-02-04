package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter(filterName = "AnnoFilter", urlPatterns = "/15FilterListener/AnnoFilter.jsp")
public class AnnoFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
        /* 처리할 내용이 없다면 오버라이딩하지 않아도 됨(이 클래스에서 삭제해도 됨) */
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String searchField = request.getParameter("searchField");
        System.out.println("검색 필드 : " + searchField);

        String searchWord = request.getParameter("searchWord");
        System.out.println("검색어 : " + searchWord);

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
        /* 처리할 내용이 없다면 오버라이딩하지 않아도 됨(이 클래스에서 삭제해도 됨) */
    }
}