package board_mine;

import jakarta.servlet.jsp.JspWriter;

import java.io.IOException;

public class JSAlertFunc {
    public static void alertLocation(String msg, String url, JspWriter out) {
        String result = String.format("""
                <script>
                    alert('%s');
                    location.href = '%s';
                </script>
                """, msg, url);
        try {
            out.println(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void alertBack(String msg, JspWriter out) {
        String result = String.format("""
                <script>
                    alert('%s');
                    history.back();
                </script>
                """, msg);
        try {
            out.println(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}