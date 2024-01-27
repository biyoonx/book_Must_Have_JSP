package fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.ReadOnlyFileSystemException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

public class FileUtil {
    // 파일 업로드
    public static String uploadFile(HttpServletRequest req, String sDirectory) throws ServletException, IOException {
        Part part = req.getPart("attachedFile");
        String partHeader = part.getHeader("content-disposition");
        String[] phArr = partHeader.split("filename=");
        String originalFileName = phArr[1].trim().replace("\"", "");
        if (!originalFileName.isEmpty()) {
            part.write(sDirectory + File.separator + originalFileName);
        }

        return originalFileName;
    }

    // 파일명 변경
    public static String renameFile(String sDirectory, String fileName) {
        String extension = fileName.substring(fileName.lastIndexOf("."));
        String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
        String newFileName = now + extension;
        File oldFile = new File(sDirectory + File.separator + fileName);
        File newFile = new File(sDirectory + File.separator + newFileName);
        boolean result = oldFile.renameTo(newFile);

        if (result) {
            return newFileName;
        } else {
            throw new ReadOnlyFileSystemException();
        }
    }

    // multiple 속성 추가로 2개 이상의 파일 업로드
    public static List<String> multipleFile(HttpServletRequest req, String sDirectory) throws ServletException, IOException {
        List<String> listFileName = new ArrayList<String>();
        Collection<Part> parts = req.getParts();
        for (Part part : parts) {
            if (!part.getName().equals("attachedFile")) {
                continue;
            }

            String partHeader = part.getHeader("content-disposition");
            String[] phArr = partHeader.split("filename=");
            String originalFileName = phArr[1].trim().replace("\"", "");

            if (!originalFileName.isEmpty()) {
                part.write(sDirectory + File.separator + originalFileName);
            }

            listFileName.add(originalFileName);
        }

        return listFileName;
    }
}