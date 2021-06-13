<%@ page import="shop.CartDAO" %>
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
	if(str=="order"){
		if(confirm("Would you like to order your choice?")==true){
		cart.action="OrderAction.jsp";
		}else {
			return;
		}
	}
}
</script>
</head>
<body>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<%
CartDAO cdao = new CartDAO();
Bean bean = new Bean();
String m_id = (String)session.getAttribute("m_id");
//list목록
ArrayList<Bean> list = cdao.cartList(m_id);
%>
<h2 align="center">Cart</h2>
<form name="cart" method="post">
<table align="center" border="1">
<tr height="40">
<td width="50" align="center">Num</td>
<td width="200" align="center">Product Img</td>
<td width="100" align="center">Product Name</td>
<td width="100" align="center">Amount</td>
<td width="100" align="center">Price</td>
<td width="50"  align="center">Delete</td>
</tr>
<%
int allPrice = 0;
for(int i=0; i<list.size();i++){
	bean = list.get(i);
%>
<tr height="100">
<td width="50" align="center"><input type="checkbox" name="p_id" value="<%=bean.getP_id()%>"></td>
<td width="200" align="center"><img class="product" src="img/<%=bean.getP_img() %>"></td>
<td align="center"><%=bean.getP_name() %></td>
<td align="center"><%=bean.getCp_count() %></td>
<td align="center">\<%=bean.getCp_price() %><br></td>
<td align="center">
<input type="button" value="X" onclick="if(confirm('Delete it?')){
	location.href='CartDeleteAction.jsp?p_id=<%=bean.getP_id()%>'
	alert('OK');}else {alert('Cancele');}"></td>
</tr>
<% 
allPrice += bean.getCp_price();
}
%>
<tr height="40">
<td colspan="4" align="center">
<input type="submit" value="ORDER" onclick='btn_click("order")'></td>
<td colspan="2" align="center"><h3><b>\<%=allPrice %></b></h3></td>
</tr>
</table>
</form>
<br><br>

<jsp:include page="OrderList.jsp"/>
<br><br><br><br>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>