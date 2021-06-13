package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@zinkki.ctdiplvlu9sn.ap-northeast-2.rds.amazonaws.com:1521:zinkki";
	String user = "zinkki";
	String pw = "12341234";
	
Connection con;
PreparedStatement pstmt;
ResultSet rs;
	
//db연동
public void getCon() {		
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, pw);
	}catch(Exception e) {
			e.printStackTrace();
	}
}
//JOIN
public int m_join(Bean bean) {
	try {
		getCon();
		String sql ="INSERT INTO shop_member VALUES(?,?,?,?,?,?,?,SYSDATE,?,null,1,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.setString(2, bean.getM_pass());
		pstmt.setString(3, bean.getM_name());
		pstmt.setString(4, bean.getM_email());	
		pstmt.setString(5, bean.getM_address());
		pstmt.setString(6, bean.getM_post());
		pstmt.setString(7, bean.getM_tel());
		pstmt.setString(8, bean.getM_birth());
		pstmt.setString(9, bean.getM_jibunAddress());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
			e.printStackTrace();
			return -1; //DB오류
	} return 0; 
}
//LOGIN
public int login(String m_id, String m_pass) {
	try {
		getCon();
		String sql = "SELECT m_pass FROM shop_member WHERE m_id=? and m_drop=1";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
	if(rs.next()) {
		if(rs.getString(1).equals(m_pass))
			return 1; //로그인성공(아이디와 패스워드가 일치)
		else
			return 0; //로그인실패(비밀번호불일치)
		}	return -1;    //존재하지않는아이디
	}catch(Exception e) {
		e.printStackTrace();
	} return -2;        //db연동실패
}
	
	
	
	
	
	
	
	
	
}
