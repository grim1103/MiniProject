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
<style>
.parent {
display:flex;
flex-wrap: wrap;
}
.parent .box {
height:500px;
width:500px;
}
.child {
width:250px;
height:300px;
}
.img img {
width: 250px;
height: 250px;
}
.insert_bt {
position: absolute;
right: 80px;
}
</style>
</head>
<body>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>

<h2 align="center">Candy List</h2>
<%
AdminDAO adao = new AdminDAO();
ArrayList<Bean> list = adao.candyList();
%>
<button class="insert_bt" type="button" value="AddCandy"
 onclick="location.href='InsertCandy.jsp'">AddCandy</button>
<br>
<div class="parent">
<%
for(int i=0;i<list.size();i++) {
	Bean bean = list.get(i);
%>
<div class="child">
<div class="img">
<a href="CandyInfo.jsp?p_id=<%=bean.getP_id() %>">
<img src="img/<%=bean.getP_img() %>">
</a>
</div>
<div align="center"><%=bean.getP_name() %></div>
<div align="center">\<%=bean.getP_price() %></div>
</div>
<%
}
%>
</div>
<br><br><br><br>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>