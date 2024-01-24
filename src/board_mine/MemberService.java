package board_mine;

import java.sql.SQLException;

public class MemberService {
    private DAO dao;

    public MemberService() {
        this.dao = new DAO();
    }

    public boolean isMember(String id, String pw) {
        String sql = """
                SELECT COUNT(*) FROM member
                  WHERE id = ? AND pass = ?
                """;

        int result = 0;
        try {
            dao.pstmt = dao.conn.prepareStatement(sql);
            dao.pstmt.setString(1, id);
            dao.pstmt.setString(2, pw);
            dao.rs = dao.pstmt.executeQuery();
            dao.rs.next();
            result = dao.rs.getInt(1);
        } catch (SQLException e) {
            System.out.println("회원 조회 중 에러 발생");
            e.printStackTrace();
        }

        if (result == 1) {
            System.out.println("회원 조회 성공");
            return true;
        }
        System.out.println("회원 조회 실패");
        return false;
    }

    public UserDTO getMemberDetail(String id) {
        String sql = "SELECT id, name, regidate FROM member WHERE id = ?";

        UserDTO user = null;
        try {
            dao.pstmt = dao.conn.prepareStatement(sql);
            dao.pstmt.setString(1, id);
            dao.rs = dao.pstmt.executeQuery();

            if (dao.rs.next()) {
                user = UserDTO.builder()
                        .id(dao.rs.getString("id"))
                        .name(dao.rs.getString("name"))
                        .regidate(dao.rs.getDate("regidate"))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public void close() {
        dao.close();
    }
}