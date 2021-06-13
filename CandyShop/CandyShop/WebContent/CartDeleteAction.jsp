<%@ page import="shop.CartDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
CartDAO cdao = new CartDAO();
int p_id = Integer.parseInt(request.getParameter("p_id"));
cdao.deleteCart(p_id);
response.sendRedirect("Cart.jsp");
%>
</body>
</html>