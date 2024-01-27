package fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import servlet.HelloServlet;

import java.io.IOException;

@WebServlet("/13FileUpload/UploadProcess.do")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10)
public class UploadProcess extends HelloServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String saveDirectory = getServletContext().getRealPath("/Uploads");
            String originalFileName = FileUtil.uploadFile(req, saveDirectory);
            String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
            insertMyFile(req, originalFileName, savedFileName);
            resp.sendRedirect("FileList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "파일 업로드 오류");
            req.getRequestDispatcher("FileUploadMain.jsp")
                    .forward(req, resp);
        }
    }

    private void insertMyFile(HttpServletRequest req, String oFileName, String sFileName) {
        String title = req.getParameter("title");
        String[] cateArr = req.getParameterValues("category");

        StringBuffer cateBuf = new StringBuffer();
        String cateVal = (cateArr == null) ? "선택한 항목 없음" : String.join(",", cateArr);
        cateBuf.append(cateVal);

        MyFileDTO dto = MyFileDTO.builder()
                .title(title)
                .category(cateBuf.toString())
                .ofile(oFileName)
                .sfile(sFileName)
                .build();

        MyFileDAO dao = new MyFileDAO();
        dao.insertFile(dto);
        dao.close();
    }
}