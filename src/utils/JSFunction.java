package utils;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.jsp.JspWriter;

import java.io.IOException;
import java.io.PrintWriter;

public class JSFunction {
    // 메시지 알림창을 띄운 후 명시한 URL로 이동
    public static void alertLocation(String msg, String url, JspWriter out) {
        try {
            String script = String.format("""
                    <script>
                        alert('%s');
                        location.href='%s';
                    </script>
                    """, msg, url);
            out.println(script);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 메시지 알림창을 띄운 후 이전 페이지로 돌아감
    public static void alertBack(String msg, JspWriter out) {
        try {
            String script = String.format("""
                    <script>
                        alert('%s');
                        history.back();
                    </script>
                    """, msg);
            out.println(script);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 메시지 알림창을 띄운 후 명시한 URL로 이동
    public static void alertLocation(HttpServletResponse resp, String msg, String url) {
        try {
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = resp.getWriter();
            String script = String.format("""
                    <script>
                        alert('%s');
                        location.href='%s';
                    </script>
                    """, msg, url);
            writer.println(script);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 메시지 알림창을 띄운 후 이전 페이지로 돌아감
    public static void alertBack(HttpServletResponse resp, String msg) {
        try {
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = resp.getWriter();
            String script = String.format("""
                    <script>
                        alert('%s');
                        history.back();
                    </script>
                    """, msg);
            writer.println(script);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}