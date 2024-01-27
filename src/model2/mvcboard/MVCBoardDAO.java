package model2.mvcboard;

import common.DBConnPool;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class MVCBoardDAO extends DBConnPool {
    public MVCBoardDAO() {
        super();
    }

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
        String query = "SELECT * FROM mvcbaord";

        if (map.get("searchWord") != null) {
            query += String.format(" WHERE %s LIKE '%%%s%%'", map.get("searchField"), map.get("searchWord"));
        }

/*        query += """
                        ORDER BY idx DESC
                    ) Tb
                ) WHERE rNum BETWEEN ? AND ?
                """;*/
        query += "LIMIT ? OFFSET ?";

        try {
            pstmt = conn.prepareStatement(query);

/*            pstmt.setString(1, map.get("start"));
            pstmt.setString(2, map.get("end"));*/
            pstmt.setString(1, map.get("pageSize").toString());
            pstmt.setString(2, map.get("start").toString());

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
}