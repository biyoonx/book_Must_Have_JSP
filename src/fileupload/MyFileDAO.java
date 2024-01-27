package fileupload;

import common.DBConnPool;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

public class MyFileDAO extends DBConnPool {
    // 새로운 게시물 입력
    public int insertFile(MyFileDTO dto) {
        int applyResult = 0;

        try {
            String query = """
                    INSERT INTO myfile (
                        idx, title, category, ofile, sfile
                    ) VALUES (
                        NULL, ?, ?, ?, ?
                    )
                    """;

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getCategory());
            pstmt.setString(3, dto.getOfile());
            pstmt.setString(4, dto.getSfile());

            applyResult = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("myfile INSERT 중 예외 발생");
            e.printStackTrace();
        }

        return applyResult;
    }

    // 파일 목록 반환
    public List<MyFileDTO> myFileList() {
        List<MyFileDTO> fileList = new Vector<MyFileDTO>();

        String query = "SELECT * FROM myfile ORDER BY idx DESC";
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                MyFileDTO dto = new MyFileDTO();
                dto.setIdx(rs.getLong("idx"));
                dto.setTitle(rs.getString("title"));
                dto.setCategory(rs.getString("category"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setPostdate(rs.getDate("postdate"));

                fileList.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("파일 목록 반환(SELECT) 중 예외 발생");
            e.printStackTrace();
        }

        return fileList;
    }
}