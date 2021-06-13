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
String m_id = request.getParameter("m_id");
adao.memberWithdrawal(bean);
response.sendRedirect("MemberList.jsp");
%>
</body>
</html>