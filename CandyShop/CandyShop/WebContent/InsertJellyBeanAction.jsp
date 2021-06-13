<%@ page import="shop.AdminDAO" %>
<%@ page import="java.io.PrintWriter" %>
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
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<%
AdminDAO adao = new AdminDAO();
//입력안된사항있을때
if(bean.getP_id()<=0 || bean.getP_name()==null || bean.getP_price()<=0 ||
	bean.getP_stock()<=0 || bean.getP_img()==null || bean.getP_img()==null || bean.getP_detail()==null){
	
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('There is an empty spot!')");
	p.println("history.go(-1)");
	p.println("</script>");
}else {
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('Added JellyBean!')");
	p.println("</script>");
	adao.insertJellyBean(bean);
	response.sendRedirect("JellyBeanList.jsp");
}
%>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>