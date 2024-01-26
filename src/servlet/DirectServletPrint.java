package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class DirectServletPrint extends HelloServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = resp.getWriter();
        writer.println("""
                <html>
                    <head>
                        <title>DirectServletPrint</title>
                    </head>
                    <body>
                        <h2>서블릿에서 직접 출력합니다.</h2>
                        <p>jsp로 포워드하지 않습니다.</p>
                    </body>
                </html>
                """);
        writer.close();
    }
}