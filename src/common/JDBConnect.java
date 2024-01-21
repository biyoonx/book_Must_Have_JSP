package common;

import jakarta.servlet.ServletContext;
import java.sql.*;

public class JDBConnect {
    public Connection conn;
    public Statement stmt;
    public PreparedStatement pstmt;
    public ResultSet rs;

    // 기본 생성자
    /* public JDBConnect() {
        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.OracleDriver");

            // DB에 연결
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String id = "musthave";
            String pwd = "1234";
            conn = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(기본 생성자)");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    } */
    public JDBConnect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/musthave";
            String id = "musthave";
            String pwd = "1234";
            conn = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(기본 생성자)");
        } catch (SQLException | ClassNotFoundException e) {
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

            System.out.println("JDBC 자원 해제");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 컨텍스트 초기화 매개변수 간접 활용
    public JDBConnect(String driver, String url, String id, String pwd) {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(인수 생성자 1)");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // 컨텍스트 초기화 매개변수 직접 활용
    public JDBConnect(ServletContext application) {
        try {
            // JDBC 드라이버 로드
            String driver = application.getInitParameter("MySQLDriver");
            Class.forName(driver);

            // DB에 연결
            String url = application.getInitParameter("MySQLURL");
            String id = application.getInitParameter("MySQLId");
            String pwd = application.getInitParameter("MySQLPwd");
            conn = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(인수 생성자 2)");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}