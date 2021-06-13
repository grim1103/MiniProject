<%@ page import="shop.Bean" %>
<%@ page import="shop.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.product {
width: 800px;
height: 650px;
}
</style>
</head>
<body>
<table align="center">
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<tr>
<td align="center"><img class="product" src="img/main.jpg"></td>
</tr>
</table>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>