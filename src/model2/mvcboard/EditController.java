package model2.mvcboard;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

import java.io.IOException;

@WebServlet("/14MVCBoard/mvcboard/edit.do")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10)
public class EditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long idx = Long.parseLong(req.getParameter("idx"));
        MVCBoardDAO dao = new MVCBoardDAO();
        MVCBoardDTO dto = dao.selectView(idx);
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/14MVCBoard/Edit.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 파일 업로드 처리
        // 업로드 디렉터리의 물리적 경로 확인
        String saveDirectory = req.getServletContext().getRealPath("/Uploads");

        // 파일 업로드
        String originalFileName = "";
        try {
            originalFileName = FileUtil.uploadFile(req, saveDirectory);
        } catch (Exception e) {
            JSFunction.alertBack(resp, "파일 업로드 오류");
            return;
        }

        // 파일 업로드 외 처리
        // 수정 내용을 매개변수에서 얻어옴
        long idx = Long.parseLong(req.getParameter("idx"));
        String prevOfile = req.getParameter("prevOfile");
        String prevSfile = req.getParameter("prevSfile");

        String name = req.getParameter("name");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        // 비밀번호는 session에서 가져옴
        HttpSession session = req.getSession();
        String pass = (String)session.getAttribute("pass");

        // DTO에 저장
        MVCBoardDTO dto = MVCBoardDTO.builder()
                .idx(idx)
                .name(name)
                .title(title)
                .content(content)
                .pass(pass)
                .build();

        // 원본 파일명과 저장된 파일 이름 설정
        if (!originalFileName.isEmpty()) {
            String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);

            // 원래 파일 이름
            dto.setOfile(originalFileName);
            // 서버에 저장된 파일 이름
            dto.setSfile(savedFileName);

            // 기존 파일 삭제
            FileUtil.deleteFile(req, "/Uplaods", prevSfile);
        } else {
            // 첨부 파일이 없으면 기존 이름 유지
            dto.setOfile(prevOfile);
            dto.setSfile(prevSfile);
        }

        // DB에 수정 내용 반영
        MVCBoardDAO dao = new MVCBoardDAO();
        int result = dao.updatePost(dto);
        dao.close();

        // 결과 처리
        if (result == 1) {
            session.removeAttribute("pass");
            resp.sendRedirect("/14MVCBoard/mvcboard/view.do?idx=" + idx);
        } else {
            JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.", "/14MVCBoard/mvcboard/view.do?idx=" + idx);
        }
    }
}