<%@ page import="java.io.PrintWriter" %>
<%@ page import="shop.MemberDAO" %>
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
MemberDAO mdao = new MemberDAO();
int result = mdao.login(bean.getM_id(), bean.getM_pass());

if(result==1) {
	//로그인성공
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('Welcome!')");
	p.println("</script>");
	session.setAttribute("m_id", bean.getM_id());
	session.setAttribute("m_pass", bean.getM_pass());
	session.setMaxInactiveInterval(60*30);
	response.sendRedirect("Main.jsp");
}else if(result==0) {
	//비밀번호틀림
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('Password is not corrected!')");
	p.println("history.go(-1)");
	p.println("</script>");
}else if(result==-1) {
	//존재하지않는 아이디
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('Non-existent ID')");
	p.println("history.go(-1)");
	p.println("</script>");
}else {
	//db연결실패
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('Failed db connected')");
	p.println("history.go(-1)");
	p.println("</script>");
}
%>
</body>
</html>