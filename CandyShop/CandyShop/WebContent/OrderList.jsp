<%@ page import="shop.OrderDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="shop.Bean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.product {
width: 100px;
height: 100px;
}
</style>
<script>
function openWin(f,s) {
	adWindow = window.open(f,s,'width=600,height=500,status=no,scropllbars=auto');
}
</script>
</head>
<body>

<%
OrderDAO odao = new OrderDAO();
Bean bean = new Bean();
String m_id = (String)session.getAttribute("m_id");
ArrayList<Bean> list = odao.order(m_id);
%>
<h2 align="center"><b>Order List</b></h2>
<form action="Main.jsp" method="post">
<table align="center" border="1">
<tr height="40">
<td width="100" align="center">Date</td>
<td width="200" align="center">Product Information</td>
<td width="200" align="center">Delivery Status</td>
<td width="100" align="center">Cancel</td>
</tr>
<tr height="100">

<%
for(int i=0;i<list.size();i++){
	bean = list.get(i);
%>
<td align="center"><%=bean.getO_date() %></td>
<td width="200" align="center">
<img align="left" class="product" src="img/<%=bean.getP_img() %>">
<br><%=bean.getP_name() %>(*<%=bean.getO_cp_count() %>)
<h3 align="right">\<%=bean.getO_cp_price() %></h3>
</td>
<td width="200" align="center">
<a href="javascript:openWin('Delivery.jsp?m_id=<%=bean.getM_id()%>','0')">Awaiting Payment</a></td>
<td width="100" align="center"><input type="button" value="CANCEL" onclick=""></td>
</tr>
<%
}
%>
<tr height="50">
<td colspan="4" align="center"><input type="submit" value="MAIN">
</table>
</form>

</body>
</html>