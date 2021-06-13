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
%>
<h2 align="center">MarshMallow Info</h2>
<table border="1" align="center">
<tr height="40">
<td width="120" align="center">Product ID</td>
<td width="380" align="center"><%=bean.getP_id() %></td>
</tr>
<tr height="40">
<td width="120" align="center">Product Category</td>
<td width="380" align="center"><%=bean.getP_category() %></td>
</tr>
<tr height="40">
<td width="120" align="center">Product Name</td>
<td width="380" align="center"><%=bean.getP_name() %></td>
</tr>
<tr height="300">
<td width="120" align="center">Product Image</td>
<td width="380" align="center"><img class="product" src="img/<%=bean.getP_img() %>"></td>
</tr>
<tr height="300">
<td width="120" align="center">Product Image2</td>
<td width="380" align="center"><img class="product" src="img/<%=bean.getP_img2() %>"></td>
</tr>
<tr height="300">
<td width="120" align="center">Product Image3</td>
<td width="380" align="center"><img class="product" src="img/<%=bean.getP_img3() %>"></td>
</tr>
<tr height="300">
<td width="120" align="center">Product Image4</td>
<td width="380" align="center"><img class="product" src="img/<%=bean.getP_img4() %>"></td>
</tr>
<tr height="40">
<td width="120" align="center">Product Price</td>
<td width="380" align="center">\<%=bean.getP_price() %></td>
</tr>
<tr height="40">
<td width="120" align="center">Product Stock</td>
<td width="380" align="center"><%=bean.getP_stock() %></td>
</tr>
<tr height="40">
<td width="120" align="center">Product Detail</td>
<td width="380" align="center"><%=bean.getP_detail() %></td>
</tr>
<tr height="40">
<td align="center" colspan="2">
<input type="button" value="UPDATE" onclick=""> &nbsp;
<input type="button" value="DELETE" 
onclick="if(confirm('Are you sure you want to delete it?')){
location.href='ProductDeleteAction.jsp?p_id=<%=bean.getP_id() %>&p_category=<%=bean.getP_category()%>'
alert('Ok'); }else {alert('Cancele');}"> &nbsp;
<input type="button" value="LIST" onclick="location.href='MarshList.jsp'">
</table>
<br><br>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>