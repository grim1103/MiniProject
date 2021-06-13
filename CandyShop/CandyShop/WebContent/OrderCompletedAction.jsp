<%@ page import="shop.OrderDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obean" class="shop.Bean">
	<jsp:setProperty name="obean" property="*"/>
</jsp:useBean>
<%
OrderDAO odao = new OrderDAO();
String m_id=(String)session.getAttribute("m_id");
String [] pid = request.getParameterValues("p_id");
String [] ocp_c= request.getParameterValues("cp_count");
String [] ocp_p = request.getParameterValues("cp_price");
String [] pstock = request.getParameterValues("p_stock");
if(m_id==null) {
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('You need Login!')");
	p.println("hitory.go(-1)");
	p.println("</script>");
}else {	
	int j= pid.length;
	for(int i=0;i<j;i++) {
		int p_id = Integer.parseInt(pid[i]);
		obean.setP_id(p_id);
		int o_cp_count = Integer.parseInt(ocp_c[i]);
		obean.setO_cp_count(o_cp_count);
		int o_cp_price = Integer.parseInt(ocp_p[i]);
		obean.setO_cp_price(o_cp_price);
		obean.setM_id(m_id);
		odao.insertOrder(obean);
		int p_stock = Integer.parseInt(pstock[i]);
		p_stock = p_stock-o_cp_count;
		odao.updateStock(p_stock, p_id);
	}
	
	response.sendRedirect("OrderCompleted.jsp");
}
%>
</body>
</html>