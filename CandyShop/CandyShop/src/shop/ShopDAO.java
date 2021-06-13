package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ShopDAO {
	String id = "zinkki";
	String pw = "12341234";
	String url = "jdbc:oracle:thin:@zinkki.ctdiplvlu9sn.ap-northeast-2.rds.amazonaws.com:1521:zinkki";
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//jdbc연동
	public void getCon() {
		try {
			Class.forName(id);
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연동성공!ㅊㅋㅊㅋ");
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}
}
