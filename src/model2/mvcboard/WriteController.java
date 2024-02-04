package model2.mvcboard;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

import java.io.IOException;

public class WriteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/14MVCBoard/Write.jsp")
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
            // 파일 업로드 실패
            JSFunction.alertLocation(resp, "파일 업로드 오류", "../mvcboard/write.do");
            return;
        }

        // 파일 업로드 외 처리
        // 폼값을 DTO에 저장
        MVCBoardDTO dto = MVCBoardDTO.builder()
                .name(req.getParameter("name"))
                .title(req.getParameter("title"))
                .content(req.getParameter("content"))
                .pass(req.getParameter("pass"))
                .build();

        // 원본 파일명과 저장된 파일 이름 설정
        if (!originalFileName.isEmpty()) {
            // 첨부 파일이 있을 경우 파일명 변경
            String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);

            // 원래 파일 이름
            dto.setOfile(originalFileName);
            // 서버에 저장된 파일 이름
            dto.setSfile(savedFileName);
        }

        // DAO를 통해 DB에 게시 내용 저장
        MVCBoardDAO dao = new MVCBoardDAO();
        int result = dao.insertWrite(dto);
        dao.close();

        // 결과에 따른 처리
        if (result == 1) {
            resp.sendRedirect("../mvcboard/list.do");
        } else {
            JSFunction.alertLocation(resp, "글쓰기에 실패했습니다", "../mvcboard/write.do");
        }
    }
}