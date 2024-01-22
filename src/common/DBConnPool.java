package common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class DBConnPool {
    public Connection conn;
    public Statement stmt;
    public PreparedStatement pstmt;
    public ResultSet rs;

    // 기본 생성자
    public DBConnPool() {
        try {
            // 커넥션 풀(DataSource) 얻기
            Context initCtx = new InitialContext();
            Context ctx = (Context)initCtx.lookup("java:comp/env");
//            DataSource dataSource = (DataSource)ctx.lookup("dbcp_myoracle");
            DataSource dataSource = (DataSource)ctx.lookup("dbcp_mymysql");

            // 커넥션 풀을 통해 연결 얻기
            conn = dataSource.getConnection();

            System.out.println("DB 커넥션 풀 연결 성공");
        } catch (NamingException | SQLException e) {
            System.out.println("DB 커넥션 풀 연결 실패");
            e.printStackTrace();
        }
    }

    // 연결 해제(자원 반납)
    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();

            System.out.println("DB 커넥션 풀 자원 반납");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}