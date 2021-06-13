<%@ page import="shop.Bean" %>
<%@ page import="shop.OrderDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.product {
width: 130px;
height: 130px;
}
</style>
</head>
<body>

<%
OrderDAO odao = new OrderDAO();
Bean bean = new Bean();
String m_id = (String)session.getAttribute("m_id");
ArrayList<Bean> list = odao.payment(m_id);
%>


<form action="CompletedAction.jsp" method="post">
<table align="center" border="1">
<tr height="40">
<td width="100" align="center">Date</td>
<td width="300" align="center">Product Information</td>


</tr>
<tr height="100">
<%
int num=0;
for(int i=0;i<list.size();i++){
	bean = list.get(i);
	num= i+1;
}
%>
<td rowspan="<%=num%>" align="center"><%=bean.getO_date() %></td>
<%
for(int i=0;i<list.size();i++){
	bean = list.get(i);
%>
<td width="200" align="center"><img align="left" class="product" src="img/<%=bean.getP_img() %>">
<br><%=bean.getP_name() %>(*<%=bean.getO_cp_count() %>)
<h3 align="right">\<%=bean.getO_cp_price() %></h3>
</td>


</tr>
<%
} 
%>
<tr height="50">
<td colspan="4" align="center"><input type="submit" value="OK">
</table>
<br><br><br><br>
</form>
</body>
</html>