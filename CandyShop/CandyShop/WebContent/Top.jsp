<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.guest {
position:absolute;
top : 50px;
right : 30px;
}
.admin {
position:absolute;
top : 50px;
right : 30px;
}
.member {
position:absolute;
top : 50px;
right : 30px;
}
.logo {
margin-top: 20px;
text-align : center;
}
</style>
</head>
<body>
<%
String m_id = (String)session.getAttribute("m_id");
if(m_id==null){
	m_id="GUEST";
%>
<div class="guest">
	<h3>Welcome <%=m_id %> !!</h3>
	<button id="login" type="button" onclick="location.href='LoginForm.jsp'">LOGIN</button>
	<button id="join" type="button" onclick="location.href='JoinForm.jsp'">JOIN</button>
</div>
<%
}else if(m_id.equals("admin")){
	m_id="admin";
%>
<div class="admin">
	<h3>Welcome <%=m_id %> !!</h3>
	<button id="adminpage" type="button" onclick="location.href='AdminPage.jsp'">AdminPage</button>
	<button id="logout" type="button" onclick="location.href='LogoutAction.jsp'">LOGOUT</button>
</div>
<%
}else {
	m_id =(String)session.getAttribute("m_id");
%>
<div class="member">
	<h3>Welcome <%=m_id %> !!</h3>
	<button id="mypage" type="button" onclick="location.href='Cart.jsp'">MYPAGE</button>
	<button id="logout" type="button" onclick="location.href='LogoutAction.jsp'">LOGOUT</button>
</div>
<% 
}
%>
<div class="logo">
	<a href="Main.jsp"><img alt="" src="img/main2.jpg" height="150" width="400"></a>
</div>
</body>
</html>