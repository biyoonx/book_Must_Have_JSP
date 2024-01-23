package board_mine;

import java.sql.*;

public class DAO {
    private final String driver = "com.mysql.cj.jdbc.Driver";
    private final String url = "jdbc:mysql://localhost:3306/musthave";
    private final String id = "musthave";
    private final String pw = "1234";

    Connection conn;
    Statement stmt;
    PreparedStatement pstmt;
    ResultSet rs;

    public DAO() {
        try {
            Class.forName(driver);
            this.conn = DriverManager.getConnection(url, id, pw);
            System.out.println("DB 연결 성공");
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver 못찾음");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB 연결 에러 또는 SQL 에러");
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (this.rs != null) {
                this.rs.close();
            }
            if (this.pstmt != null) {
                this.pstmt.close();
            }
            if (this.stmt != null) {
                this.stmt.close();
            }
            if (this.conn != null) {
                this.conn.close();
            }
            System.out.println("JDBC 자원 해제");
        } catch (SQLException e) {
            System.out.println("JDBC 자원 반납 중 에러 발생");
            e.printStackTrace();
        }
    }
}