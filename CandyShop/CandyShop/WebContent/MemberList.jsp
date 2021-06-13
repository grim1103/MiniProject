<%@ page import="java.util.ArrayList" %>
<%@ page import="shop.AdminDAO" %>
<%@ page import="shop.Bean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<%
AdminDAO adao = new AdminDAO();
ArrayList<Bean> list = adao.memberList();
%>
<h2 align="center">MemberList</h2>
<table align="center" border="1">
<tr height="40">
<td align="center" width="30">NUM</td>
<td align="center" width="100">Member ID</td>
<td align="center" width="120">Member Name</td>
<td align="center" width="150">Member E-Mail</td>
<td align="center" width="190">Join DATE</td>
</tr>
<%
for(int i=0;i<list.size();i++){
	Bean bean = list.get(i);
%>
<tr height="40">
<td align="center"><%=i+1 %></td>
<td align="center">
	<a href="MemberInfo.jsp?m_id=<%=bean.getM_id()%>"><%=bean.getM_id() %></a>
</td>
<td align="center"><%=bean.getM_name() %></td>
<td align="center"><%=bean.getM_email() %></td>
<td align="center"><%=bean.getM_joindate() %></td>
</tr>
<%
}
%>
<tr height="40">
<td align="center" colspan="5">
	<input type="button" align="center" value="AdminPage"
	onclick="location.href='AdminPage.jsp'">
</td>
</tr>
</table>

<br><br><br><br>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>