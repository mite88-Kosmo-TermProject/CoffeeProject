package common;

import java.sql.*;

public class ConnTest {
    public static void main(String[] args) {
        // Connection 객체를 생성한다.
        Connection conn = null;
         
        // 데이터베이스 연결 중 오류 처리를 위해 try-catch로 감싼다.
        try {
            // 드라이버 파일에 있는 클래스를 불러온다.
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // @ 앞부분은 데이터베이스마다 다르다. 그리고 IP주소, 포트, SID를 입력한다.
            String driver = "jdbc:oracle:thin:@3.39.142.94:1521/xe"; 
            // 계정 이름
            String user = "kosmo";
            // 계정 비밀번호
            String pass = "1234";
            // 앞의 정보들을 이용해 Connection 객체를 초기화한다.
            conn = DriverManager.getConnection(driver, user, pass);
            System.out.println("Success connecting Oracle!");
        } catch (SQLException se) {
            // SQL 예외일 경우 여기로 온다.
            System.out.println("Fail connecting: " + se);
        } catch (Exception e) {
            System.out.println("Exception1: " + e);
        } finally {
            // 테스트이기 때문에 연결이 정상적으로 되었던 예외가 나왔던 상관없이 종료가 이루어져야 한다.
            // 실제로 사용하기 위해서라면 이 코드는 예외 발생 시에만 불러오게 해야할 것이다.
            if (conn != null) {
                try {
                    // Connection 객체를 닫는다.
                    conn.close();
                    System.out.println("Stop connecting Oracle!");
                } catch (SQLException se) {
                    // 닫는 도중 오류가 나면 여기로 오게 된다.
                    System.out.println("Exception2: " + se);
                }
            }
        }
    }
}