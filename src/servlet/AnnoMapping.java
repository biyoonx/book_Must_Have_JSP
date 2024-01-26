package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/12Servlet/AnnoMapping.do")
public class AnnoMapping extends HelloServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("message", "@WebServlet으로 매핑");
        req.getRequestDispatcher("/12Servlet/AnnoMapping.jsp")
                .forward(req, resp);
    }
}