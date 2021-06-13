package shop;

import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC_Connect {

	public static void main(String[] args) {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "system";
		String pw = "1234";
		
		try {
			Class.forName(driver);
			DriverManager.getConnection(url, user, pw);
			System.out.println("DB연결성공!");
		}catch(Exception e) {
			System.out.println("jdbc연결실패");
		}
		
	}

}
