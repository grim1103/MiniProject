<%@ page import="shop.CartDAO" %>
<%@ page import="shop.OrderDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.product {
width:200px;
height:200px;
}
</style>
</head>
<body>
<jsp:useBean id="bean" class="shop.Bean">
	<jsp:setProperty name="bean" property="*"/>
</jsp:useBean>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<%
CartDAO cdao = new CartDAO();
OrderDAO odao = new OrderDAO();
String m_id = (String)session.getAttribute("m_id");
int p_id = Integer.parseInt(request.getParameter("p_id"));
int cp_count = Integer.parseInt(request.getParameter("cp_count"));
int p_price = Integer.parseInt(request.getParameter("p_price"));
int cp_price = p_price*cp_count;
String p_img = request.getParameter("p_img");
String p_name = request.getParameter("p_name");

if(m_id==null) {
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('You need login')");
	p.println("history.go(-1)");
	p.println("</script>");
}else {
	bean.setM_id(m_id);
	bean.setP_id(p_id);
	bean.setCp_count(cp_count);
	bean.setCp_price(cp_price);
	cdao.addCart(bean);
	odao.changeCart_num2(bean);
	response.sendRedirect("BuynowList.jsp");
}
%>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>