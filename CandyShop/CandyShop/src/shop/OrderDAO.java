package shop;

import java.util.ArrayList;

public class OrderDAO extends CartDAO{

//orderTable에담기!그리고 orderTable에담긴데이터는 cart_num=1로 바꿔주고 cartTabe에서빼기
//얘도 삭제해야할듯...?
public void addOrder(Bean bean) {
	getCon();
	try {
		String sql = "INSERT INTO shop_order VALUES(o_seq.NEXTVAL,?,?,SYSDATE,0)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.setInt(2, bean.getP_id());
		pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	}
}
//CartList에서 선택한것만 OrderList로가져가기
public void changeCart_num(Bean bean) {
	getCon();
	try {
	String sql2 = "UPDATE shop_cart SET cart_num=1 WHERE m_id=? and p_id=?";
		pstmt = con.prepareStatement(sql2);
		pstmt.setString(1, bean.getM_id());
		pstmt.setInt(2, bean.getP_id());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
//BuyNow눌렀을때 그값만 BuyNowList로 가져가기
public void changeCart_num2(Bean bean) {
	getCon();
	try {
	String sql = "UPDATE shop_cart SET cart_num=-1 WHERE m_id=? and p_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.setInt(2, bean.getP_id());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

//CartTable에서 cart_num=1인것보기(cart.jsp에서 선택한제품을 Order시 OrderList)
public ArrayList<Bean> orderList(String m_id) {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT p.p_id, p.p_img, p.p_name, c.cp_count, c.cp_price"+
				" FROM shop_cart c, shop_product p,"+
				 "shop_member m WHERE p.p_id=c.p_id and"+
				 " m.m_id=c.m_id and"+
				 " c.cart_num=1 and c.m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setP_id(rs.getInt(1));
			bean.setP_img(rs.getString(2));
			bean.setP_name(rs.getString(3));
			bean.setCp_count(rs.getInt(4));
			bean.setCp_price(rs.getInt(5));
			list.add(bean);
		}	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}
public ArrayList<Bean> buyNowList(String m_id) {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT p.p_id, p.p_img, p.p_name, c.cp_count, c.cp_price"+
				" FROM shop_cart c, shop_product p,"+
				 "shop_member m WHERE p.p_id=c.p_id and"+
				 " m.m_id=c.m_id and"+
				 " c.cart_num=-1 and c.m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setP_id(rs.getInt(1));
			bean.setP_img(rs.getString(2));
			bean.setP_name(rs.getString(3));
			bean.setCp_count(rs.getInt(4));
			bean.setCp_price(rs.getInt(5));
			list.add(bean);
		}	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}
public void buyNowCancel(String m_id, int p_id) {
	getCon();
	try {
		String sql = "DELETE shop_cart WHERE cart_num=-1 and m_id=? and p_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		pstmt.setInt(2, p_id);
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}
public void OrderCancel(Bean bean) {
	getCon();
	try {
		String sql = "UPDATE shop_cart SET cart_num=0 WHERE m_id=? and p_id=? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.setInt(2, bean.getP_id());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

public void addBuy(Bean bean) {
	getCon();
	try {
		String sql = "UPDATE shop_cart SET cart_num=-1 WHERE m_id=? and p_id=? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.setInt(2, bean.getP_id());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
public ArrayList<Bean> buyList(String m_id) {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT p.p_id, p.p_img, p.p_name, c.cp_count, c.cp_price, p.p_price"+
				",p.p_stock FROM shop_cart c, shop_product p,"+
				 "shop_member m WHERE p.p_id=c.p_id and"+
				 " m.m_id=c.m_id and"+
				 " c.cart_num=-1 and c.m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setP_id(rs.getInt(1));
			bean.setP_img(rs.getString(2));
			bean.setP_name(rs.getString(3));
			bean.setCp_count(rs.getInt(4));
			bean.setCp_price(rs.getInt(5));
			bean.setP_price(rs.getInt(6));
			bean.setP_stock(rs.getInt(7));
			list.add(bean);
		}	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

/*
 * public void buyNow(Bean bean) { getCon(); try { String sql =
 * "INSERT INTO shop_order VALUES(o_seq.NEXTVAL,?,?,SYSDATE,0)"; pstmt =
 * con.prepareStatement(sql); pstmt.setString(1, bean.getM_id());
 * pstmt.setInt(2, bean.getP_id()); pstmt.executeUpdate(); con.close(); } catch
 * (Exception e) { e.printStackTrace(); } }
 */

//이거 없앨지고민중..
public Bean buyNowOrder(String m_id) {
	getCon();
	Bean bean = new Bean();
	try {
		String sql = "SELECT DISTINCT p.p_img, p.p_name, c.cp_count, c.cp_price, p.p_id "
				+ "FROM shop_product p , shop_member m, shop_cart c,"
				+ " shop_order o WHERE p.p_id=o.p_id and m.m_id=o.m_id and "
				+ "o.m_id=? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			bean.setP_img(rs.getString(1));
			bean.setP_name(rs.getString(2));
			bean.setCp_count(rs.getInt(3));
			bean.setCp_price(rs.getInt(4));
			bean.setP_id(rs.getInt(5));
		}	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return bean;
}
//payment(결제)클릭시 OrderTable에 데이터 insert하기 후후..
public void insertOrder(Bean bean) {
	getCon();
	try {
		  String sql2 ="INSERT INTO shop_order VALUES(o_seq.NEXTVAL,?,?,SYSDATE,?,?,0)";
		  pstmt =con.prepareStatement(sql2);
		  pstmt.setString(1, bean.getM_id());
		  pstmt.setInt(2, bean.getP_id());
		  pstmt.setInt(3, bean.getO_cp_count());
		  pstmt.setInt(4, bean.getO_cp_price());
		  pstmt.executeUpdate();
		  con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

//OrderTable에 데이터 insert됐으면 이제 cartTable에서는 빼기~ㅋㅋ
public void pay_deleteCart(String m_id) {
	getCon();
	try {
		String sql = "DELETE shop_cart WHERE cart_num=-1 AND m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

//OrderTable에담긴 데이터 뽑아오기 후후
public ArrayList<Bean> payment(String m_id) {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT DISTINCT o.o_date, o.p_id, p.p_img, p.p_name,"
				+ "o.o_cp_count, o.o_cp_price FROM shop_order o, shop_member m,"
				+ "shop_cart c, shop_product p WHERE m.m_id=o.m_id and p.p_id=o.p_id"
				+ " AND o.order_num=0 AND o.m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setO_date(rs.getString(1).toString());
			bean.setP_id(rs.getInt(2));
			bean.setP_img(rs.getString(3));
			bean.setP_name(rs.getString(4));
			bean.setO_cp_count(rs.getInt(5));
			bean.setO_cp_price(rs.getInt(6));
			list.add(bean);
		}	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

//주문까지완료후, 쇼핑계속하기버튼눌렀을때!order_num=1로바꾸기
public void change_OrderNum(String m_id) {
	getCon();
	try {
		String sql = "UPDATE shop_order SET order_num=1 where order_num=0 AND m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
public ArrayList<Bean> order(String m_id) {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT DISTINCT o.o_date, o.p_id, p.p_img, p.p_name,"
				+ "o.o_cp_count, o.o_cp_price FROM shop_order o, shop_member m,"
				+ "shop_cart c, shop_product p WHERE m.m_id=o.m_id and p.p_id=o.p_id"
				+ " AND o.order_num=1 AND o.m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setO_date(rs.getString(1).toString());
			bean.setP_id(rs.getInt(2));
			bean.setP_img(rs.getString(3));
			bean.setP_name(rs.getString(4));
			bean.setO_cp_count(rs.getInt(5));
			bean.setO_cp_price(rs.getInt(6));
			list.add(bean);
		}	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

//Awaiting Payment눌렀을때 >> 배송지,정보뜨게하기
public Bean deliveryStatus(String m_id) {
	getCon();
	Bean bean = new Bean();
	try {
		String sql = "SELECT m_id, m_name, m_post, m_jibunaddress, m_address, m_tel"
				+ " FROM shop_member where m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			bean.setM_id(rs.getString(1));
			bean.setM_name(rs.getString(2));
			bean.setM_post(rs.getString(3));
			bean.setM_jibunAddress(rs.getString(4));
			bean.setM_address(rs.getString(5));
			bean.setM_tel(rs.getString(6));
		}	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return bean;
}

//stockUpdate(주문완료시 stock(재고)-주문갯수)
public void updateStock(int p_stock,int p_id) {
	getCon();
	try {
		String sql = "UPDATE shop_product SET p_stock=? WHERE p_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, p_stock);
		pstmt.setInt(2, p_id);
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}


}
