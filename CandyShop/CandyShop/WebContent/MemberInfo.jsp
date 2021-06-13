<%@ page import="shop.Bean" %>
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
<jsp:useBean id="mbean" class="shop.Bean">
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<%
AdminDAO adao = new AdminDAO();
Bean bean = adao.memberInfo(mbean.getM_id());
%>
<h2 align="center">MemberInfo</h2>
<table align="center" border="1">
<tr height="40">
<td width="120" align="center">MemberID</td>
<td width="380" align="center"><%=bean.getM_id() %></td>
</tr>
<tr height="40">
<td width="120" align="center">Name</td>
<td width="380" align="center"><%=bean.getM_name() %></td>
</tr>
<tr height="40">
<td width="120" align="center">Email</td>
<td width="380" align="center"><%=bean.getM_email() %></td>
</tr>
<tr height="40">
<td width="120" align="center">Tel</td>
<td width="380" align="center"><%=bean.getM_tel() %></td>
</tr>
<tr height="70">
<td width="120" align="center">Address</td>
<td width="380" align="center">
(<%=bean.getM_post() %>)<%=bean.getM_jibunAddress() %>
<%=bean.getM_address() %>
</td>
</tr>
<tr height="40">
<td width="120" align="center">Birth</td>
<td width="380" align="center"><%=bean.getM_birth() %></td>
</tr>
<tr height="40">
<td width="120" align="center">Buy</td>
<td width="380" align="center"><%=bean.getM_buy() %></td>
</tr>
<tr height="40">
<td align="center" colspan="2">
<input type="button" value="DELETE"
onclick="if(confirm('Are you sure you want to delete it?')){
location.href='MemberDeleteAction.jsp?m_id=<%=bean.getM_id() %>'
alert('Ok'); }else {alert('Cancele');}">
<input type="button" value="MemberLIST" onclick="location.href='MemberList.jsp'">
</td>
</tr>
</table>
<br><br>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>