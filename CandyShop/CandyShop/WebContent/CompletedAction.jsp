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
odao.pay_deleteCart(m_id);
odao.change_OrderNum(m_id);
response.sendRedirect("Cart.jsp");
%>
</body>
</html>