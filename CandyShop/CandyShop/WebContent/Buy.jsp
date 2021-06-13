<%@ page import="shop.OrderDAO" %>
<%@ page import="shop.AdminDAO" %>
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
width: 130px;
height: 110px;
}
</style>
<script>
function btn_click(str) {
	if(str=="pay"){
		if(confirm("Are you really going to buy this?")==true){
		buy.action="OrderCompletedAction.jsp";
		}else {
			return;
		}
	}else if(str=="cancel"){
		buy.action="OrderCancelAction.jsp";
	}
}
</script>
</head>
<body>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<%
OrderDAO odao = new OrderDAO();
AdminDAO adao = new AdminDAO();
Bean bean = new Bean();
String m_id = (String)session.getAttribute("m_id");
bean = adao.memberInfo(m_id);
%>
<br>
<br>
<h2 align="center">Shipping Destination</h2>
<form name="buy" method="post">
<table align="center" border="1">
<tr height="40">
<td width="150" align="center">NAME</td>
<td width="350" align="center"><%=bean.getM_name() %></td>
</tr>
<tr height="80">
<td width="150" align="center">Destination</td>
<td width="350" align="center"><%=bean.getM_jibunAddress() %><br><%=bean.getM_address() %>
</tr>
<tr height="40">
<td width="150" align="center">TEL</td>
<td width="350" align="center"><%=bean.getM_tel() %></td>
</tr>
<tr height="40">
<td width="150" align="center">E-Mail</td>
<td width="350" align="center"><%=bean.getM_email() %></td>
</table>
<br>
<br>
<%
ArrayList<Bean> list = odao.buyList(m_id);
%>
<h2 align="center">Order Information</h2>
<table align="center" border="1">
<tr height="40">
<td width="50" align="center">Num</td>
<td width="100" align="center">Product Img</td>
<td width="100" align="center">Product Information</td>
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
<td width="100" align="center"><img class="product" src="img/<%=bean.getP_img() %>"></td>
<td width="100" align="center"><%=bean.getP_name() %><br>( \<%=bean.getP_price() %> )</td>
<td width="100" align="center"><%=bean.getCp_count() %>
<input type="hidden" name="cp_count" value="<%=bean.getCp_count() %>"></td>
<td width="100" align="center">\<%=bean.getCp_price() %>
<input type="hidden" name="p_stock" value="<%=bean.getP_stock() %>">
<input type="hidden" name="cp_price" value="<%=bean.getCp_price() %>"></td>
</tr>
<%
allPrice += bean.getCp_price();
}
int deliveryCharge;
if(allPrice>=10000){
	 deliveryCharge=0;
}else{
	 deliveryCharge=2000;
}
%>
<tr height="40">
<td colspan="3" align="center"><h3>allPrice</h3></td>
<td colspan="2" align="center"><h3><b>\<%=allPrice %></b></h3></td>
</tr>
</table>
<br>
<br>
<h2 align="center">Payment Information</h2>
<table align="center" border="1">
<tr height="40">
<td width="150" align="center">Payment method</td>
<td width="350" align="center">Bank Transfer</td>
</tr>
<tr height="170">
<td width="150" align="center">Account<br>Information</td>
<td width="350" align="center">Bank : KAKAOBANK<br>ACCOUNTNUMBER : 333303-3240286
<br>NAME : JEONG-YUJIN<br><br>* Please make the payment with the above information. *<br></td>
</tr>
</table>
<br>
<br>
<h2 align="center">Payment Amount Information</h2>
<table align="center" border="1">
<tr height="60">
<td width="100" align="center">Product Price</td>
<td width="250" align="center"><h3>+ \<%=allPrice %></h3></td>
</tr>
<tr height="60">
<td width="100" align="center">Delivery Charge</td>
<td width="250" align="center"><h3>+ \<%=deliveryCharge %></h3></td>
</tr>
<tr height="60">
<td width="100" align="center">Sale</td>
<td width="250" align="center"><h3>- \<%=0 %></h3></td>
</tr>
<tr height="90">
<td width="100" align="center">Payment</td>
<td width="250" align="center"><h2>\<%=allPrice+deliveryCharge %></h2>
</table>
<br>
<div align="center">
<input type="submit" value="PAYMENT" onclick='btn_click("pay")'>&nbsp;&nbsp;
<input type="submit" value="CANCEL" onclick='btn_click("cancel")'>
</div>
</form>
<br>
<br>
<br>
<br>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>