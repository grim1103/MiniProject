<%@ page import="shop.OrderDAO" %>
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
<%
OrderDAO odao = new OrderDAO();
if(request.getParameter("p_id")==null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('There is Nothing')");
	script.println("history.go(-1)");
	script.println("</script>");
	
}else {
	String m_id = (String)session.getAttribute("m_id");
	String [] p = request.getParameterValues("p_id");
	for(int i=0;i<p.length;i++) {
	int p_id = Integer.parseInt(p[i]);
	bean.setM_id(m_id);
	bean.setP_id(p_id);
	odao.changeCart_num(bean);
}
	response.sendRedirect("Order.jsp");
}
%>
</body>
</html>