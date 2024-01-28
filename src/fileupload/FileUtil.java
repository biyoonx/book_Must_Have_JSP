package fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;
import java.nio.charset.StandardCharsets;
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

    // 명시한 파일을 찾아 다운로드
    public static void download(HttpServletRequest req, HttpServletResponse resp, String directory, String sfileName, String ofileName) {
        String sDirectory = req.getServletContext().getRealPath(directory);

        try {
            // 파일을 찾아 입력 스트림 생성
            File file = new File(sDirectory, sfileName);
            InputStream iStream = new FileInputStream(file);

            // 한글 파일명 깨짐 방지
            String client = req.getHeader("User-Agent");
            String encodingType = !client.contains("WOW64") ? "UTF-8" : "KSC5601";
            ofileName = new String(ofileName.getBytes(encodingType), StandardCharsets.ISO_8859_1);

            // 파일 다운로드용 응답 헤더 설정
            resp.reset();
            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition", String.format("attachement; filename\"%s\"", ofileName));
            resp.setHeader("Content-Length", String.valueOf(file.length()));

            // response 내장 객체로부터 새로운 출력 스트림 생성
            OutputStream oStream = resp.getOutputStream();

            // 출력 스트림에 파일 내용 출력
            byte[] b = new byte[(int)file.length()];
            int readBuffer = 0;
            while ((readBuffer = iStream.read(b)) > 0) {
                oStream.write(b, 0, readBuffer);
            }

            // 입출력 스트림 닫음
            iStream.close();
            oStream.close();
        } catch (FileNotFoundException e) {
            System.out.println("파일을 찾을 수 없음.");
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            System.out.println("지원하지 않는 인코딩");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("입출력 예외");
            e.printStackTrace();
        }
    }

    // 지정한 위치의 파일 삭제
    public static void deleteFile(HttpServletRequest req, String directory, String filename) {
        String sDirectory = req.getServletContext().getRealPath(directory);
        File file = new File(sDirectory + File.separator + filename);

        if (file.exists()) {
            boolean result = file.delete();

            if (result) {
                System.out.println("파일 삭제 성공 : " + filename);
            } else {
                System.out.println("파일 삭제 실패 : " + filename);
            }
        }
    }
}