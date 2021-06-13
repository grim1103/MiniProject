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
<%
AdminDAO adao = new AdminDAO();
ArrayList<Bean> list = adao.jellyBeanList();
%>
<h2 align="center">JellyBean List</h2>
<div class="insert_bt">
<button type="button" value="AddBean"
 onclick="location.href='InsertJellyBean.jsp'">AddBean</button>
</div>
<br>
<div class="parent">
<%
for(int i=0;i<list.size();i++) {
	Bean bean = list.get(i);
%>
<div class="child">
<div class="img">
<a href="JellyBeanInfo.jsp?p_id=<%=bean.getP_id() %>">
<img src="img/<%=bean.getP_img() %>">
</a>
</div>
<div align="center"><%=bean.getP_name() %></div>
<div align="center"><%=bean.getP_price() %>&nbsp;\</div>
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