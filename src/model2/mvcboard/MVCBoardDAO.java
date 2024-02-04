package model2.mvcboard;

import common.DBConnPool;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class MVCBoardDAO extends DBConnPool {
    // 검색 조건에 맞는 게시물의 개수 반환
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;

        String query = "SELECT COUNT(*) FROM mvcboard";

        if (map.get("searchWord") != null) {
            query += String.format(" WHERE %s LIKE '%%%s%%'", map.get("searchField"), map.get("searchWord"));
        }

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        } catch (SQLException e) {
            System.out.println("게시물 카운트 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount;
    }

    // 검색 조건에 맞는 게시물 목록 반환(페이징 기능 지원)
    public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
        List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();

/*        String query = """
                SELECT * FROM (
                    SELECT Tb.*, ROWNUM rNum FROM (
                        SELECT * FROM mvcboard
                """;*/
        String query = "SELECT * FROM mvcboard";

        if (map.get("searchWord") != null) {
            query += String.format(" WHERE %s LIKE '%%%s%%'", map.get("searchField"), map.get("searchWord"));
        }

/*        query += """
                        ORDER BY idx DESC
                    ) Tb
                ) WHERE rNum BETWEEN ? AND ?
                """;*/
        query += " ORDER BY idx DESC LIMIT ? OFFSET ?";

        try {
            pstmt = conn.prepareStatement(query);

/*            pstmt.setInt(1, (int)map.get("start"));
            pstmt.setInt(2, (int)map.get("end"));*/
            pstmt.setInt(1, (int)map.get("pageSize"));
            pstmt.setInt(2, (int)map.get("start"));

            rs = pstmt.executeQuery();

            while (rs.next()) {
                MVCBoardDTO dto = new MVCBoardDTO();

                dto.setIdx(rs.getLong("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getLong("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getLong("visitcount"));

                board.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return board;
    }

    // 게시글 데이터를 받아 DB에 추가(파일 업로드 지원)
    public int insertWrite(MVCBoardDTO dto) {
        int result = 0;

        try {
            String query = """
                    INSERT INTO mvcboard (
                        idx, name, title, content, ofile, sfile, pass
                    ) VALUES (
                        NULL, ?, ?, ?, ?, ?, ?
                    )
                    """;

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getOfile());
            pstmt.setString(5, dto.getSfile());
            pstmt.setString(6, dto.getPass());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }

        return result;
    }

    // 주어진 일련번호에 해당하는 게시물을 DTO에 담아 반환
    public MVCBoardDTO selectView(long idx) {
        MVCBoardDTO dto = new MVCBoardDTO();

        String query = "SELECT * FROM mvcboard WHERE idx = ?";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setLong(1, idx);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto.setIdx(rs.getLong("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getLong("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getLong("visitcount"));
            }
        } catch (SQLException e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }

        return dto;
    }

    // 주어진 일련번호에 해당하는 게시물의 조회수를 1 증가시킴
    public void updateVisitCount(long idx) {
        String query = """
                UPDATE mvcboard
                SET visitcount = visitcount + 1
                WHERE idx = ?
                """;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setLong(1, idx);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            e.printStackTrace();
        }
    }

    // 다운로드 횟수를 1 증가시킴
    public void downCountPlus(long idx) {
        String query = """
                UPDATE mvcboard
                SET downcount = downcount + 1
                WHERE idx = ?
                """;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setLong(1, idx);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 입력한 비밀번호가 지정한 일련번호의 게시물의 비밀번호와 일치하는지 확인
    public boolean confirmPassword(String pass, long idx) {
        boolean isCorr = false;

        try {
            String query = "SELECT COUNT(*) FROM mvcboard WHERE pass = ? AND idx = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, pass);
            pstmt.setLong(2, idx);
            rs = pstmt.executeQuery();
            rs.next();
            isCorr = rs.getInt(1) != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isCorr;
    }

    // 지정한 일련번호의 게시물 삭제
    public int deletePost(long idx) {
        int result = 0;

        try {
            String query = "DELETE FROM mvcboard WHERE idx = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setLong(1, idx);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }

        return result;
    }

    // 게시글 데이터를 받아 DB에 저장되어 있던 내용 갱신(파일 업로드 지원)
    public int updatePost(MVCBoardDTO dto) {
        int result = 0;

        try {
            String query = """
                    UPDATE mvcboard
                    SET title = ?,
                        name = ?,
                        content = ?,
                        ofile = ?,
                        sfile = ?
                    WHERE idx = ? AND pass = ?
                    """;

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getOfile());
            pstmt.setString(5, dto.getSfile());
            pstmt.setLong(6, dto.getIdx());
            pstmt.setString(7, dto.getPass());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }

        return result;
    }
}