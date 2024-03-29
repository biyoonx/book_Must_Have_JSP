package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

public class BasicFilter implements Filter {
    FilterConfig config;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
//        Filter.super.init(filterConfig);

        config = filterConfig;
        String filterName = filterConfig.getFilterName();

        System.out.println("BasicFilter → init() 호출됨 : " + filterName);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String filterInitParam = config.getInitParameter("FILTER_INIT_PARAM");
        System.out.println("BasicFilter → 초기화 매개변수 : " + filterInitParam);

//        에러 발생(형 변환 후 호출할 수 있음)
//        String method = request.getMethod();
        String method = ((HttpServletRequest)request).getMethod();
        System.out.println("BasicFilter → 전송 방식 : " + method);

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
//        Filter.super.destroy();

        System.out.println("BasicFilter → destroy() 호출됨");
    }
}