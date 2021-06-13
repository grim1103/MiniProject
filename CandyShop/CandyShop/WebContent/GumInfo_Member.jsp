<%@ page import="java.io.PrintWriter" %>
<%@ page import="shop.Bean" %>
<%@ page import="shop.AdminDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.product {
width: 300px;
height: 300px;
}
</style>
<script>
function btn_click(str){
	if(str=="buy"){
		product.action="Buynow.jsp";
	}else if(str=="cart"){
		if(confirm("NOW CART?")==true){
		product.action="CartAction.jsp";
		}else {
		product.action="AddCart.jsp";
		}
	}else {
		
	}
}
</script>
</head>
<body>
<jsp:useBean id="mbean" class="shop.Bean">
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<%
AdminDAO adao = new AdminDAO();
Bean bean = adao.candyInfo(mbean.getP_id());
String m_id = (String)session.getAttribute("m_id");
%>
<form name="product" method="post">
<table align="center">
<tr height="300">
<td width="380" align="center"><img class="product" src="img/<%=bean.getP_img() %>"></td>
<td width="200" align="center">
<h4 align="left">Name: <%=bean.getP_name() %></h4>
<h4 align="left">Price: <%=bean.getP_price() %></h4>
<h4 align="left">Stock: <%=bean.getP_stock() %></h4>
<h4 align="left">num: &nbsp;&nbsp;
	<select name="cp_count">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	</select>
</h4>
<input type="hidden" name="p_img" value="<%=bean.getP_img() %>">
<input type="hidden" name="m_id" value="<%=m_id %>">
<input type="hidden" name="p_id" value="<%=bean.getP_id() %>">
<input type="hidden" name="p_price" value="<%=bean.getP_price()%>">
<input type="hidden" name="p_name" value="<%=bean.getP_name() %>">
<input type="submit" onclick='btn_click("cart");' value="ADD_CART">&nbsp;
<input type="submit" onclick='btn_click("buy");' value="BUY_NOW">
</td>
</tr>
<tr height="300">
<td colspan="2"><img src="img/<%=bean.getP_img2() %>"></td>
</tr>
<tr height="300">
<td colspan="2"><img src="img/<%=bean.getP_img3() %>"></td>
</tr>
<tr height="300">
<td colspan="2"><img src="img/<%=bean.getP_img3() %>"></td>
</tr>
<tr height="300">
<td colspan="2"><img src="img/<%=bean.getP_img4() %>"></td>
</tr>
</table>
</form>
<br><br><br><br>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>