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
<%
OrderDAO odao = new OrderDAO();
String m_id = (String)session.getAttribute("m_id");
int p_id = Integer.parseInt(request.getParameter("p_id"));
odao.buyNowCancel(m_id,p_id);
response.sendRedirect("Main.jsp");
%>
</body>
</html>