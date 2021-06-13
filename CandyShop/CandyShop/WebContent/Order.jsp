<%@ page import="shop.OrderDAO" %>
<%@ page import="shop.Bean" %>
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
width: 100px;
height: 100px;
}
</style>
<script>
function btn_click(str) {
	if(str=="buy"){
		if(confirm("Are you going to buy it?")==true){
			product.action="BuyAction.jsp";
		}else {
			return;
		}		
	}else if(str=="cancel"){
		product.action="OrderCancelAction.jsp";
	}
}
</script>
</head>
<body>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<%
OrderDAO odao = new OrderDAO();
String m_id = (String)session.getAttribute("m_id");
Bean bean = new Bean();
ArrayList<Bean> list = odao.orderList(m_id);
%>
<h2 align="center">Order</h2>
<form name="product" method="post">
<table align="center" border="1">
<tr height="40">
<td width="50" align="center">Num</td>
<td width="200" align="center">Product Img</td>
<td width="100" align="center">Product Name</td>
<td width="100" align="center">Amount</td>
<td width="100" align="center">Price</td>
</tr>
<%
int allPrice=0;
for(int i=0;i<list.size();i++) {
	bean = list.get(i);
%>
<tr height="40">
<td width="50" align="center"><%=i+1 %>
<input type="hidden" name="p_id" value="<%=bean.getP_id() %>"></td>
<td width="200" align="center"><img class="product" src="img/<%=bean.getP_img() %>"></td>
<td width="100" align="center"><%=bean.getP_name() %></td>
<td width="100" align="center"><%=bean.getCp_count() %></td>
<td width="100" align="center"><%=bean.getCp_price() %></td>
</tr>
<%
allPrice += bean.getCp_price();
}
%>
<tr height="90">
<td colspan="4" align="center">
* \10,000 or more free shipping!! *<br><br>
<input type="submit" value="BUY" onclick='btn_click("buy")'>&nbsp;&nbsp;
<input type="submit" value="CANCEL" onclick='btn_click("cancel")'></td>
<td colspan="2" align="center"><h3><b>\<%=allPrice %></b></h3></td>
</tr>
</table>
</form>
<br><br><br><br>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>