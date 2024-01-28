package model2.mvcboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.mvcboard.MVCBoardDAO;
import model2.mvcboard.MVCBoardDTO;

import java.io.IOException;
import java.util.List;

@WebServlet("/14MVCBoard/mvcboard/view.do")
public class ViewController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 게시물 불러오기
        MVCBoardDAO dao = new MVCBoardDAO();
        long idx = Long.parseLong(req.getParameter("idx"));
        dao.updateVisitCount(idx);
        MVCBoardDTO dto = dao.selectView(idx);
        dao.close();

        // 줄바꿈 처리
        dto.setContent(dto.getContent().replaceAll("\r\n", "<br />"));

        // 첨부 파일 확장자 추출 및 이미지 타입 확인
        String fileName = dto.getSfile();
        String extension = (fileName != null) ? fileName.substring(fileName.lastIndexOf("." + 1)) : null;
        List<String> mimeList = List.of("png", "jpg", "gif");
        boolean isImage = mimeList.contains(extension);

        // 게시물(dto) 저장 후 뷰로 포워드
        req.setAttribute("dto", dto);
        req.setAttribute("isImage", isImage);
        req.getRequestDispatcher("/14MVCBoard/View.jsp")
                .forward(req, resp);
    }
}