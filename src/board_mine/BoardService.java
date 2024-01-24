package board_mine;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardService {
    private DAO dao;

    public BoardService() {
        this.dao = new DAO();
    }

    public long selectTotalCount(String searchField, String searchKeyword) {
        String sql = "SELECT COUNT(*) FROM board";
        if (searchKeyword != null) {
            sql += String.format(" WHERE %s LIKE '%%%s%%'", searchField, searchKeyword);
        }

        long totalCount = 0;
        try {
            dao.stmt = dao.conn.createStatement();
            dao.rs = dao.stmt.executeQuery(sql);
            dao.rs.next();
            totalCount = dao.rs.getLong(1);

            System.out.printf("전체 게시글 수 조회 완료 : %d개\n", totalCount);
        } catch (SQLException e) {
            System.out.println("전체 게시글 수 조회 중 에러 발생");
            e.printStackTrace();
        }

        return totalCount;
    }

    public List<PostDTO> getAllList(String searchField, String searchKeyword) {
        String sql = """
                SELECT B.num, B.title, B.content, B.id, B.postdate, B.visitcount, M.name
                FROM board B
                  INNER JOIN member M ON (B.id = M.id)
                """;
        if (searchKeyword != null) {
            sql += String.format(" WHERE %s LIKE '%%%s%%'", searchField, searchKeyword);
        }
        sql += "ORDER BY num DESC";

        List<PostDTO> posts = new ArrayList<PostDTO>();
        try {
            dao.stmt = dao.conn.createStatement();
            dao.rs = dao.stmt.executeQuery(sql);

            while (dao.rs.next()) {
                PostDTO post = PostDTO.builder()
                        .num(dao.rs.getLong("num"))
                        .title(dao.rs.getString("title"))
                        .content(dao.rs.getString("content"))
                        .id(dao.rs.getString("id"))
                        .postDate(dao.rs.getDate("postdate"))
                        .visitCount(dao.rs.getLong("visitcount"))
                        .name(dao.rs.getString("name"))
                        .build();
                posts.add(post);
            }

            System.out.printf("전체 게시글 조회 완료 : %d개\n", posts.size());
        } catch (SQLException e) {
            System.out.println("전체 게시글 조회하는 중에 에러 발생");
            e.printStackTrace();
        }

        return posts;
    }

    public int insertPost(PostDTO post) {
        String sql = """
                INSERT INTO board (num, title, content, id, postdate, visitcount)
                VALUES (NULL, ?, ?, ?, CURRENT_DATE, 0)
                """;

        int result = 0;
        try {
            dao.pstmt = dao.conn.prepareStatement(sql);
            dao.pstmt.setString(1, post.getTitle());
            dao.pstmt.setString(2, post.getContent());
            dao.pstmt.setString(3, post.getId());
            result = dao.pstmt.executeUpdate();

            System.out.printf("게시글 등록(INSERT) 완료 : %d행 적용\n", result);
        } catch (SQLException e) {
            System.out.println("게시글 등록(INSERT) 중 에러 발생");
            e.printStackTrace();
        }
        return result;
    }

    public PostDTO getPostDetail(long num) {
        String sql = """
                SELECT B.num, B.title, B.content, B.id, B.postdate, B.visitcount, M.name
                  FROM board B
                    INNER JOIN member M ON (B.id = M.id)
                  WHERE num = ?
                """;

        PostDTO post = null;
        try {
            dao.pstmt = dao.conn.prepareStatement(sql);
            dao.pstmt.setLong(1, num);
            dao.rs = dao.pstmt.executeQuery();

            if (dao.rs.next()) {
                post = PostDTO.builder()
                        .num(dao.rs.getLong("num"))
                        .title(dao.rs.getString("title"))
                        .content(dao.rs.getString("content"))
                        .id(dao.rs.getString("id"))
                        .postDate(dao.rs.getDate("postdate"))
                        .visitCount(dao.rs.getLong("visitcount"))
                        .name(dao.rs.getString("name"))
                        .build();
                System.out.printf("게시글 상세 조회 완료 : %d번\n", post.getNum());
            } else {
                System.out.printf("조회할 게시글 없음 : %d", num);
            }
        } catch (SQLException e) {
            System.out.println("게시글 상세 조회 중에 에러 발생");
            e.printStackTrace();
        }
        return post;
    }

    public void updateVisitCountUp(long num) {
        String sql = """
                UPDATE board
                SET visitcount = visitcount + 1
                WHERE num = ?
                """;

        try {
            dao.pstmt = dao.conn.prepareStatement(sql);
            dao.pstmt.setLong(1, num);
            int result = dao.pstmt.executeUpdate();

            System.out.printf("조회수 카운트업 완료 : %d행 적용\n", result);
        } catch (SQLException e) {
            System.out.println("조회수 카운트업 중 에러 발생");
            e.printStackTrace();
        }
    }

    public int updateEditPost(PostDTO post) {
        String sql = """
                UPDATE board
                SET title = ?,
                    content = ?
                WHERE num = ?
                """;

        int result = 0;
        try {
            dao.pstmt = dao.conn.prepareStatement(sql);
            dao.pstmt.setString(1, post.getTitle());
            dao.pstmt.setString(2, post.getContent());
            dao.pstmt.setLong(3, post.getNum());
            result = dao.pstmt.executeUpdate();

            System.out.printf("게시글 수정 등록 완료 : %d행 적용\n", result);
        } catch (SQLException e) {
            System.out.println("게시글 수정 등록(UPDATE) 중 에러 발생");
            e.printStackTrace();
        }
        return result;
    }

    public int deletePost(long num) {
        String sql = "DELETE FROM board WHERE num = ?";

        int result = 0;
        try {
            dao.pstmt = dao.conn.prepareStatement(sql);
            dao.pstmt.setLong(1, num);
            result = dao.pstmt.executeUpdate();

            System.out.printf("게시글 삭제 완료 : %d행 적용\n", result);
        } catch (SQLException e) {
            System.out.println("게시글 삭제 중 에러 발생");
            e.printStackTrace();
        }
        return result;
    }

    public void close() {
        dao.close();
    }
}