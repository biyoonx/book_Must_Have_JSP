package membership;

import common.JDBConnect;

import java.sql.SQLException;

public class MemberDAO extends JDBConnect {
    // 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체 생성
    public MemberDAO(String drv, String url, String id, String pw) {
        super(drv, url, id, pw);
    }

    // 명시한 아이디/패스워드와 일치하는 회원 정보 반환
    public MemberDTO getMemberDTO(String uid, String upass) {
        MemberDTO dto = new MemberDTO();
        String query = "SELECT * FROM member WHERE id = ? AND pass = ?";

        try {
            // 쿼리 실행
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, uid);
            pstmt.setString(2, upass);
            rs = pstmt.executeQuery();

            // 결과 처리
            if (rs.next()) {
                // 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                dto.setName(rs.getString(3));;
                dto.setRegidate(rs.getString(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dto;
    }
}