<%--
  Created by IntelliJ IDEA.
  User: biyoonx
  Date: 2024-01-27
  Time: 오후 10:08
--%>

<%@ page import="java.io.*" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="utils.JSFunction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String saveDirectory = application.getRealPath("/Uploads");
    System.out.println(saveDirectory);
    String saveFilename = request.getParameter("sName");
    String originalFilename = request.getParameter("oName");

    try {
        // 파일을 찾아 입력 스트림 생성
        File file = new File(saveDirectory, saveFilename);
        InputStream inStream = new FileInputStream(file);

        // 한글 파일명 깨짐 방지
        String client = request.getHeader("User-Agent");
        String encodingType = !client.contains("WOW64") ? "UTF-8" : "KSC5601";
        originalFilename = new String(originalFilename.getBytes(encodingType), StandardCharsets.ISO_8859_1);

        // 파일 다운로드용 응답 헤더 설정
        response.reset();
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", originalFilename));
        response.setHeader("Content-Length", String.valueOf(file.length()));

        // 출력 스트림 초기화
        out.clear();

        // response 내장 객체로부터 새로운 출력 스트림 생성
        OutputStream outStream = response.getOutputStream();

        // 출력 스트림에 파일 내용 출력
        byte[] b = new byte[(int)file.length()];
        int readBuffer = 0;
        while ((readBuffer = inStream.read(b)) > 0) {
            outStream.write(b, 0, readBuffer);
        }

        // 입출력 스트림 닫음
        inStream.close();
        outStream.close();
    } catch (FileNotFoundException e) {
        JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
    } catch (Exception e) {
        e.printStackTrace();
        JSFunction.alertBack("예외 발생", out);
    }
%>