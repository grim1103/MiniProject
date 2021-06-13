package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
public class CartDAO {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@zinkki.ctdiplvlu9sn.ap-northeast-2.rds.amazonaws.com:1521:zinkki";
	String user = "zinkki";
	String pw = "12341234";
Connection con;
PreparedStatement pstmt;
ResultSet rs;
	
//jdbc연동
public void getCon() {
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url,user,pw);
	}catch(Exception e) {
		e.printStackTrace();
	}
}

//cart에 product(상품)담기
public void addCart(Bean bean) {
	getCon();
	try {
		String sql = "INSERT INTO shop_cart VALUES(c_seq.NEXTVAL,?,?,?,?,0)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.setInt(2, bean.getP_id());
		pstmt.setInt(3, bean.getCp_count());
		pstmt.setInt(4, bean.getCp_price());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
//cart에 product(상품)담긴거 (리스트에담고뽑기) 보기
public ArrayList<Bean> cartList(String m_id) {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT p.p_img, p.p_name, "
				+ " c.cp_count, c.cp_price, p.p_id, c.c_seq FROM "
				+ "shop_cart c, shop_product p, shop_member m"
				+ " WHERE p.p_id = c.p_id and c.m_id = m.m_id and c.cart_num=0 and c.m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setP_img(rs.getString(1));
			bean.setP_name(rs.getString(2));
			bean.setCp_count(rs.getInt(3));
			bean.setCp_price(rs.getInt(4));
			bean.setP_id(rs.getInt(5));
			list.add(bean);
		}	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

//Cart에담긴목록 x버튼 클릭해서 지우기
public void deleteCart(int p_id) {
	getCon();
	try {
		String sql = "DELETE FROM shop_cart WHERE p_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, p_id);
		pstmt.executeUpdate();
		con.close();
	}catch(Exception e) {
		e.printStackTrace();
	}
}
}
