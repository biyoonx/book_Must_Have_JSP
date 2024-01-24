package model1.board;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class BoardDAO extends JDBConnect {
    public BoardDAO(ServletContext application) {
        super(application);
    }

    // 검색 조건에 맞는 게시물의 개수 반환
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0; // 결과(게시물 수)를 담을 변수

        // 게시물 수를 얻어오는 쿼리문
        String query = "SELECT COUNT(*) FROM board";
        if (map.get("searchWord") != null) {
            query += String.format(" WHERE %s LIKE '%%%s%%'", map.get("searchField").toString(), map.get("searchWord").toString());
        }

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        } catch (SQLException e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount;
    }

    // 검색 조건에 맞는 게시물 목록 반환
    public List<BoardDTO> selectList(Map<String, Object> map) {
        List<BoardDTO> bbs = new Vector<BoardDTO>(); // 결과(게시물 목록)을 담을 변수

        String query = "SELECT * FROM board";
        if (map.get("searchWord") != null) {
            query += String.format(" WHERE %s LIKE '%%%s%%'", map.get("searchField").toString(), map.get("searchWord").toString());
        }
        query += " ORDER BY num DESC";

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                BoardDTO dto = new BoardDTO();

                dto.setNum(rs.getLong("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getLong("visitcount"));

                bbs.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }
    
    // 검색 조건에 맞는 게시물 목록 반환(페이징 기능 지원)
    public List<BoardDTO> selectListPage(Map<String, Object> map) {
        List<BoardDTO> bbs = new Vector<BoardDTO>();

        String query = """
                SELECT * FROM (
                    SELECT Tb.*, ROWNUM AS rNum FROM (
                        SELECT * FROM board
                """;

        // 검색 조건 추가
        if (map.get("searchWord") != null) {
            query += String.format(" WHERE %s LIKE '%%%s%%'", map.get("searchField"), map.get("searchWord"));
        }

        query += """
                        ORDER BY num DESC
                    ) Tb
                ) WHERE rNum BETWEEN ? AND ?
                """;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, map.get("start").toString());
            pstmt.setString(2, map.get("end").toString());

            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardDTO dto = new BoardDTO();
                dto.setNum(rs.getLong("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getLong("visitcount"));

                bbs.add(dto);
            }
        } catch (SQLException e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }

    // DAO에 글쓰기 메서드 추가
    public int insertWrite(BoardDTO dto) {
        int result = 0;

        try {
            String query = """
                    INSERT INTO board (
                        num, title, content, id, visitcount
                    ) VALUES (
                        NULL, ?, ?, ?, 0)
                    """; // 오라클은 NULL이 아니라 seq_board_num.NEXTVAL이어야 함

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getId());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }

        return result;
    }

    // 지정한 게시물을 찾아 내용 반환
    public BoardDTO selectView(long num) {
        BoardDTO dto = new BoardDTO();

        String query = """
                SELECT B.*, M.name
                FROM member M
                  INNER JOIN board B
                    ON M.id = B.id
                  WHERE num = ?
                """;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setLong(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto.setNum(rs.getLong("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getLong("visitcount"));
                dto.setName(rs.getString("name"));
            }
        } catch (SQLException e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }

        return dto;
    }

    // 지정한 게시물의 조회수 1 증가
    public void updateVisitCount(long num) {
        String query = """
                UPDATE board
                SET visitcount = visitcount + 1
                WHERE num = ?
                """;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setLong(1, num);
//            pstmt.executeQuery();
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            e.printStackTrace();
        }
    }

    // 지정한 게시물 수정
    public int updateEdit(BoardDTO dto) {
        int result = 0;

        try {
            String query = """
                    UPDATE board
                    SET title = ?,
                        content = ?
                      WHERE num = ?
                    """;

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setLong(3, dto.getNum());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }

        return result;
    }

    // 지정한 게시물 삭제
    public int deletePost(BoardDTO dto) {
        int result = 0;

        try {
            String query = "DELETE FROM board WHERE num = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setLong(1, dto.getNum());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }

        return result;
    }
}