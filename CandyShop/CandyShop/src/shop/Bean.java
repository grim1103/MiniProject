package shop;

public class Bean {

	//member table
	String m_id; //PK
	String m_pass;
	String m_pass2;
	String m_name;
	String m_email;
	String m_address;
	String m_post; //하..우편번혼데..검색/찾아서/입력하는거..아나
	String m_tel;
	String m_joindate;
	String m_birth;
	int m_drop;
	String m_buy;
	String m_jibunAddress;

	//product table
	int p_id; //PK
	String p_name;
	int p_price;
	int p_stock;
	String p_img;
	String p_img2;
	String p_img3;
	String p_img4;
	String p_detail;
	String p_date;
	int p_category;

	//cart table
//	String m_id; //FK    =memberID
//  String p_id; //FK    =productID
	int cp_count; //     =p_id가같은 product의갯수
	int cp_price; //     =p_id.p_price*cp_count
//  int c_seq;   //PK 
	int cart_num;

	//order table
//	int o_seq; //PK
//	String m_id; FK
//  int p_id;    FK
	String o_date;
	int o_cp_count; //=shop_cart. cp_count
	int o_cp_price; //=shop_cart. cp_price
	int order_num;

	//review table
	String r_id; //PK
//	int o_id; FK
//	int p_id; FK
	String r_write;
	String r_pass;
	String r_title;
	String r_date;
	
	//order_detail table
//	int od_id; //PK
//  int p_id; FK
//  int o_id; FK
	int od_amount;

	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getO_cp_count() {
		return o_cp_count;
	}
	public void setO_cp_count(int o_cp_count) {
		this.o_cp_count = o_cp_count;
	}
	public int getO_cp_price() {
		return o_cp_price;
	}
	public void setO_cp_price(int o_cp_price) {
		this.o_cp_price = o_cp_price;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public String getM_pass2() {
		return m_pass2;
	}
	public void setM_pass2(String m_pass2) {
		this.m_pass2 = m_pass2;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_post() {
		return m_post;
	}
	public void setM_post(String m_post) {
		this.m_post = m_post;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getM_joindate() {
		return m_joindate;
	}
	public void setM_joindate(String m_joindate) {
		this.m_joindate = m_joindate;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public int getM_drop() {
		return m_drop;
	}
	public void setM_drop(int m_drop) {
		this.m_drop = m_drop;
	}
	public String getM_buy() {
		return m_buy;
	}
	public void setM_buy(String m_buy) {
		this.m_buy = m_buy;
	}
	public String getM_jibunAddress() {
		return m_jibunAddress;
	}
	public void setM_jibunAddress(String m_jibunAddress) {
		this.m_jibunAddress = m_jibunAddress;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getP_img2() {
		return p_img2;
	}
	public void setP_img2(String p_img2) {
		this.p_img2 = p_img2;
	}
	public String getP_img3() {
		return p_img3;
	}
	public void setP_img3(String p_img3) {
		this.p_img3 = p_img3;
	}
	public String getP_img4() {
		return p_img4;
	}
	public void setP_img4(String p_img4) {
		this.p_img4 = p_img4;
	}
	public String getP_detail() {
		return p_detail;
	}
	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public int getP_category() {
		return p_category;
	}
	public void setP_category(int p_category) {
		this.p_category = p_category;
	}
	public int getCp_count() {
		return cp_count;
	}
	public void setCp_count(int cp_count) {
		this.cp_count = cp_count;
	}
	public int getCp_price() {
		return cp_price;
	}
	public void setCp_price(int cp_price) {
		this.cp_price = cp_price;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getR_write() {
		return r_write;
	}
	public void setR_write(String r_write) {
		this.r_write = r_write;
	}
	public String getR_pass() {
		return r_pass;
	}
	public void setR_pass(String r_pass) {
		this.r_pass = r_pass;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public int getOd_amount() {
		return od_amount;
	}
	public void setOd_amount(int od_amount) {
		this.od_amount = od_amount;
	}
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}	
}