package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminDAO {
	
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
		con = DriverManager.getConnection(url,user,pw);
	}catch(Exception e) {
		e.printStackTrace();
	}
}

//회원리스트뽑기
public ArrayList<Bean> memberList() {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT * FROM shop_member WHERE m_drop=1 ORDER BY m_joindate asc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setM_id(rs.getString(1));
			bean.setM_name(rs.getString(3));
			bean.setM_email(rs.getString(4));
			bean.setM_joindate(rs.getString(8).toString());
			list.add(bean);
		}con.close();
	}catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

//회원리스트에서 선택한id의 정보보기
public Bean memberInfo(String m_id) {
	Bean bean = new Bean();
	getCon();
	try {
		String sql = "SELECT * FROM shop_member WHERE m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			bean.setM_id(rs.getString(1));
			bean.setM_pass(rs.getString(2));
			bean.setM_name(rs.getString(3));
			bean.setM_email(rs.getString(4));
			bean.setM_address(rs.getString(5));
			bean.setM_post(rs.getString(6));
			bean.setM_tel(rs.getString(7));
			bean.setM_joindate(rs.getString(8).toString());
			bean.setM_birth(rs.getString(9));
			bean.setM_buy(rs.getString(10));
			bean.setM_drop(rs.getInt(11));
			bean.setM_jibunAddress(rs.getString(12));
		} con.close();
	}catch(Exception e) {
		e.printStackTrace();
	}
	return bean;
}

//회원리스트에서 선택한id 탈퇴시키기(m_drop=0(탈퇴회원))
public void memberWithdrawal(Bean bean) {
	getCon();
	try {
		String sql = "UPDATE shop_member SET m_drop=0 WHERE m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.executeUpdate();
		con.close();
	}catch(Exception e) {
		e.printStackTrace();
	}
}

//탈퇴한회원(m_drop=0)리스트보기
public ArrayList<Bean> withdrawalList() {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql ="SELECT * FROM shop_member WHERE m_drop=0 ORDER BY m_joindate asc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
		Bean bean = new Bean();
		bean.setM_id(rs.getString(1));
		bean.setM_name(rs.getString(3));
		bean.setM_email(rs.getString(4));
		bean.setM_joindate(rs.getString(8).toString());
		list.add(bean);
		}con.close();
	}catch(Exception e) {
		e.printStackTrace();
	}
	return list;
}

//탈퇴한회원(m_drop=0)정보보기
public Bean withdrawalMemberInfo(String m_id) {
	Bean bean = new Bean();
	getCon();
	try {
		String sql = "SELECT * FROM shop_member WHERE m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			bean.setM_id(rs.getString(1));
			bean.setM_pass(rs.getString(2));
			bean.setM_name(rs.getString(3));
			bean.setM_email(rs.getString(4));
			bean.setM_address(rs.getString(5));
			bean.setM_post(rs.getString(6));
			bean.setM_tel(rs.getString(7));
			bean.setM_joindate(rs.getString(8).toString());
			bean.setM_birth(rs.getString(9));
			bean.setM_buy(rs.getString(10));
			bean.setM_drop(rs.getInt(11));
			bean.setM_jibunAddress(rs.getString(12));
		} con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return bean;
}

//탈퇴한회원정보 완전삭제하기
public void dropMember(String m_id) {
	getCon();
	try {
		String sql = "DELETE FROM shop_member WHERE m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		pstmt.executeUpdate();
		con.close();
	}catch(Exception e) {
		e.printStackTrace();
	}
}

//탈퇴한회원되살리기(Restore버튼)m_drop=1로 만들기
public void restoreMember(Bean bean) {
	getCon();
	try {
		String sql = "UPDATE shop_member SET m_drop=1 WHERE m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

//Candy(p_category=1)리스트
public ArrayList<Bean> candyList() {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT * FROM shop_product WHERE p_category=1 order by p_id asc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
		Bean bean = new Bean();
		bean.setP_id(rs.getInt(1));
		bean.setP_name(rs.getString(2));
		bean.setP_price(rs.getInt(3));
		bean.setP_stock(rs.getInt(4));
		bean.setP_img(rs.getString(5));
		bean.setP_img2(rs.getString(6));
		bean.setP_img3(rs.getString(7));
		bean.setP_img4(rs.getString(8));
		bean.setP_detail(rs.getString(9));
		list.add(bean);
		}con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

//Chocolate(p_category=2)리스트
public ArrayList<Bean> chocoList() {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql ="SELECT * FROM shop_product WHERE p_category=2 order by p_id asc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
		Bean bean = new Bean();
		bean.setP_id(rs.getInt(1));
		bean.setP_name(rs.getString(2));
		bean.setP_price(rs.getInt(3));
		bean.setP_stock(rs.getInt(4));
		bean.setP_img(rs.getString(5));
		bean.setP_img2(rs.getString(6));
		bean.setP_img3(rs.getString(7));
		bean.setP_img4(rs.getString(8));
		bean.setP_detail(rs.getString(9));
		list.add(bean);
		}con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

//Jelly(p_category=3)리스트
public ArrayList<Bean> jellyList() {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT * FROM shop_product WHERE p_category=3 order by p_id asc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
		Bean bean = new Bean();
		bean.setP_id(rs.getInt(1));
		bean.setP_name(rs.getString(2));
		bean.setP_price(rs.getInt(3));
		bean.setP_stock(rs.getInt(4));
		bean.setP_img(rs.getString(5));
		bean.setP_img2(rs.getString(6));
		bean.setP_img3(rs.getString(7));
		bean.setP_img4(rs.getString(8));
		bean.setP_detail(rs.getString(9));
		list.add(bean);
		}con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

//JellyBean(p_category=4)리스트
public ArrayList<Bean> jellyBeanList() {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT * FROM shop_product WHERE p_category=4 order by p_id asc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
		Bean bean = new Bean();
		bean.setP_id(rs.getInt(1));
		bean.setP_name(rs.getString(2));
		bean.setP_price(rs.getInt(3));
		bean.setP_stock(rs.getInt(4));
		bean.setP_img(rs.getString(5));
		bean.setP_img2(rs.getString(6));
		bean.setP_img3(rs.getString(7));
		bean.setP_img4(rs.getString(8));
		bean.setP_detail(rs.getString(9));
		list.add(bean);
		}con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

//Marshmallow(p_category=5)리스트
public ArrayList<Bean> marshList() {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT * FROM shop_product WHERE p_category=5 order by p_id asc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
		Bean bean = new Bean();
		bean.setP_id(rs.getInt(1));
		bean.setP_name(rs.getString(2));
		bean.setP_price(rs.getInt(3));
		bean.setP_stock(rs.getInt(4));
		bean.setP_img(rs.getString(5));
		bean.setP_img2(rs.getString(6));
		bean.setP_img3(rs.getString(7));
		bean.setP_img4(rs.getString(8));
		bean.setP_detail(rs.getString(9));
		list.add(bean);
		}con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

//Gum(p_category=6)리스트
public ArrayList<Bean> gumList() {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT * FROM shop_product WHERE p_category=6 order by p_id asc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
		Bean bean = new Bean();
		bean.setP_id(rs.getInt(1));
		bean.setP_name(rs.getString(2));
		bean.setP_price(rs.getInt(3));
		bean.setP_stock(rs.getInt(4));
		bean.setP_img(rs.getString(5));
		bean.setP_img2(rs.getString(6));
		bean.setP_img3(rs.getString(7));
		bean.setP_img4(rs.getString(8));
		bean.setP_detail(rs.getString(9));
		list.add(bean);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

//Insert Candy(p_category=1)
public void insertCandy(Bean bean) {
	getCon();
	try {
		String sql = "INSERT INTO shop_product VALUES(?,?,?,?,?,?,?,?,?,SYSDATE,1)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, bean.getP_id());
		pstmt.setString(2, bean.getP_name());
		pstmt.setInt(3, bean.getP_price());
		pstmt.setInt(4, bean.getP_stock());
		pstmt.setString(5, bean.getP_img());
		pstmt.setString(6, bean.getP_img2());
		pstmt.setString(7, bean.getP_img3());
		pstmt.setString(8, bean.getP_img4());
		pstmt.setString(9, bean.getP_detail());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

//Insert Chocolate(p_category=2)
public void insertChoco(Bean bean) {
	getCon();
	try {
		String sql = "INSERT INTO shop_product VALUES(?,?,?,?,?,?,?,?,?,SYSDATE,2)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, bean.getP_id());
		pstmt.setString(2, bean.getP_name());
		pstmt.setInt(3, bean.getP_price());
		pstmt.setInt(4, bean.getP_stock());
		pstmt.setString(5, bean.getP_img());
		pstmt.setString(6, bean.getP_img2());
		pstmt.setString(7, bean.getP_img3());
		pstmt.setString(8, bean.getP_img4());
		pstmt.setString(9, bean.getP_detail());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

//Insert Jelly(p_category=3)
public void insertJelly(Bean bean) {
	getCon();
	try {
		String sql = "INSERT INTO shop_product VALUES(?,?,?,?,?,?,?,?,?,SYSDATE,3)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, bean.getP_id());
		pstmt.setString(2, bean.getP_name());
		pstmt.setInt(3, bean.getP_price());
		pstmt.setInt(4, bean.getP_stock());
		pstmt.setString(5, bean.getP_img());
		pstmt.setString(6, bean.getP_img2());
		pstmt.setString(7, bean.getP_img3());
		pstmt.setString(8, bean.getP_img4());
		pstmt.setString(9, bean.getP_detail());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

//Insert JellyBean(p_category=4)
public void insertJellyBean(Bean bean) {
	getCon();
	try {
		String sql = "INSERT INTO shop_product VALUES(?,?,?,?,?,?,?,?,?,SYSDATE,4)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, bean.getP_id());
		pstmt.setString(2, bean.getP_name());
		pstmt.setInt(3, bean.getP_price());
		pstmt.setInt(4, bean.getP_stock());
		pstmt.setString(5, bean.getP_img());
		pstmt.setString(6, bean.getP_img2());
		pstmt.setString(7, bean.getP_img3());
		pstmt.setString(8, bean.getP_img4());
		pstmt.setString(9, bean.getP_detail());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

//Insert Marshmallow(p_category=5)
public void insertMarsh(Bean bean) {
	getCon();
	try {
		String sql = "INSERT INTO shop_product VALUES(?,?,?,?,?,?,?,?,?,SYSDATE,5)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, bean.getP_id());
		pstmt.setString(2, bean.getP_name());
		pstmt.setInt(3, bean.getP_price());
		pstmt.setInt(4, bean.getP_stock());
		pstmt.setString(5, bean.getP_img());
		pstmt.setString(6, bean.getP_img2());
		pstmt.setString(7, bean.getP_img3());
		pstmt.setString(8, bean.getP_img4());
		pstmt.setString(9, bean.getP_detail());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

//Insert Gum(p_category=6)
public void insertGum(Bean bean) {
	getCon();
	try {
		String sql = "INSERT INTO shop_product VALUES(?,?,?,?,?,?,?,?,?,SYSDATE,6)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, bean.getP_id());
		pstmt.setString(2, bean.getP_name());
		pstmt.setInt(3, bean.getP_price());
		pstmt.setInt(4, bean.getP_stock());
		pstmt.setString(5, bean.getP_img());
		pstmt.setString(6, bean.getP_img2());
		pstmt.setString(7, bean.getP_img3());
		pstmt.setString(8, bean.getP_img4());
		pstmt.setString(9, bean.getP_detail());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

//선택한 product정보보기
public Bean candyInfo(int p_id) {
	Bean bean = new Bean();
	getCon();
	try {
		String sql = "SELECT * FROM shop_product WHERE p_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, p_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
		bean.setP_id(rs.getInt(1));
		bean.setP_name(rs.getString(2));
		bean.setP_price(rs.getInt(3));
		bean.setP_stock(rs.getInt(4));
		bean.setP_img(rs.getString(5));
		bean.setP_img2(rs.getString(6));
		bean.setP_img3(rs.getString(7));
		bean.setP_img4(rs.getString(8));
		bean.setP_detail(rs.getString(9));
		bean.setP_category(rs.getInt(11));
		}con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return bean;
}

//ProductInfo에서 선택한 Product삭제하기
public void deleteProduct(int p_id) {
	getCon();
	try {
		String sql = "DELETE FROM shop_product WHERE p_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, p_id);
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

}
