<%@ page import="shop.AdminDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bean" class="shop.Bean">
	<jsp:setProperty name="bean" property="*"/>
</jsp:useBean>
<%
AdminDAO adao = new AdminDAO();
int p_id = Integer.parseInt(request.getParameter("p_id"));
int p_category = Integer.parseInt(request.getParameter("p_category"));
adao.deleteProduct(p_id);
if(p_category==1) {
	response.sendRedirect("CandyList.jsp");
}else if(p_category==2) {
	response.sendRedirect("ChocoList.jsp");
}else if(p_category==3) {
	response.sendRedirect("JellyList.jsp");
}else if(p_category==4) {
	response.sendRedirect("JellyBeanList.jsp");
}else if(p_category==5) {
	response.sendRedirect("MarshList.jsp");
}else if(p_category==6) {
	response.sendRedirect("GumList.jsp");
}else {
	response.sendRedirect("Main.jsp");
}
%>
</body>
</html>