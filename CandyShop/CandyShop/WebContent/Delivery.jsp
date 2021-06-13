<%@ page import="shop.Bean" %>
<%@ page import="shop.OrderDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.picture {
width: 585px;
height: 180px;
}
</style>
</head>
<body>
<jsp:useBean id="obean" class="shop.Bean">
	<jsp:setProperty name="obean" property="*"/>
</jsp:useBean> 
<%
OrderDAO odao = new OrderDAO();
String m_id = (String)session.getAttribute("m_id");
Bean bean = odao.deliveryStatus(m_id);
%>
<br>
<div><img class="picture" src="img/d.png"></div>
<br>
<table align="center" border="1">
<tr height="40">
<td align="center" width="120"> NAME </td>
<td align="center" width="300"><%=bean.getM_name() %></td>
</tr>
<tr height="100">
<td align="center"> Destination </td>
<td align="center">(<%=bean.getM_post() %>)<br>
<%=bean.getM_jibunAddress() %><br>
<%=bean.getM_address() %>
</td>
</tr> 
<tr height="40">
<td align="center">TEL</td>
<td align="center"><%=bean.getM_tel() %></td>
</tr>
</table>
</body>
</html>