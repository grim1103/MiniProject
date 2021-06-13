<%@ page import="shop.OrderDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bean" class="shop.Bean">
	<jsp:setProperty name="bean" property="*"/>
</jsp:useBean>
<%
OrderDAO odao = new OrderDAO();
String m_id = (String)session.getAttribute("m_id");
String [] p = request.getParameterValues("p_id");
for(int i=0;i<p.length;i++) {
	int p_id = Integer.parseInt(p[i]);
	bean.setM_id(m_id);
	bean.setP_id(p_id);
	odao.addBuy(bean);
}
	response.sendRedirect("Buy.jsp");
%>
</body>
</html>