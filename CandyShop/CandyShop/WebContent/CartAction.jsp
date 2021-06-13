<%@ page import="shop.CartDAO" %>
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
<jsp:useBean id="cbean" class="shop.Bean">
	<jsp:setProperty  name="cbean" property="*"/>
</jsp:useBean>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<%
CartDAO cdao = new CartDAO();
String m_id = (String)session.getAttribute("m_id");
int cp_count = Integer.parseInt(request.getParameter("cp_count"));
int p_price = Integer.parseInt(request.getParameter("p_price"));
int p_id = Integer.parseInt(request.getParameter("p_id"));
int cp_price = p_price*cp_count;
String p_img = request.getParameter("p_img");
String p_name = request.getParameter("p_name");

if(m_id==null) {
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('You need Login!')");
	p.println("location.href ='LoginForm.jsp'");
	p.println("</script>");
}else {
	PrintWriter p = response.getWriter();
	cbean.setM_id(m_id);
	cbean.setCp_count(cp_count);
	cbean.setP_price(p_price);
	cbean.setP_id(p_id);
	cbean.setCp_price(cp_price);
	cbean.setP_img(p_img);
	cbean.setP_name(p_name);
	cdao.addCart(cbean);

	response.sendRedirect("Cart.jsp");
}
%>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>