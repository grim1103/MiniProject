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
<%
AdminDAO adao = new AdminDAO();
String m_id = request.getParameter("m_id");
adao.dropMember(m_id);
response.sendRedirect("WithdrawalMemberList.jsp");
%>
</body>
</html>