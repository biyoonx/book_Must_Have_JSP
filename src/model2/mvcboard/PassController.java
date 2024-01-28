package model2.mvcboard;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

import java.io.IOException;

@WebServlet("/14MVCBoard/mvcboard/pass.do")
public class PassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("mode", req.getParameter("mode"));
        req.getRequestDispatcher("/14MVCBoard/Pass.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 매개변수 저장
        long idx = Long.parseLong(req.getParameter("idx"));
        String mode = req.getParameter("mode");
        String pass = req.getParameter("pass");

        // 비밀번호 확인
        MVCBoardDAO dao = new MVCBoardDAO();
        boolean confirmed = dao.confirmPassword(pass, idx);

        if (confirmed) {
            switch (mode) {
                case "edit":
                    dao.close();
                    HttpSession session = req.getSession();
                    session.setAttribute("pass", pass);
                    resp.sendRedirect("/14MVCBoard/mvcboard/edit.do?idx=" + idx);
                    break;
                case "delete":
                    MVCBoardDTO dto = dao.selectView(idx);
                    int result = dao.deletePost(idx);
                    dao.close();
                    if (result == 1) {
                        String saveFileName = dto.getSfile();
                        FileUtil.deleteFile(req, "/Uploads", saveFileName);
                    }
                    JSFunction.alertLocation(resp, "삭제되었습니다.", "/14MVCBoard/mvcboard/list.do");
                    break;
            }
        } else {
            JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
        }
    }
}