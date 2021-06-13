<%@ page import="java.io.PrintWriter" %>
<%@ page import="shop.Bean" %>
<%@ page import="shop.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bean" class="shop.Bean">
	<jsp:setProperty name="bean" property="*"/>
</jsp:useBean>

<%
String m_id = (String)session.getAttribute("m_id");

if(m_id != null) {
	PrintWriter script= response.getWriter();
	script.println("<script>");
	script.println("alert('You Already login')");
	script.println("location.href='Main.jsp'");
	script.println("</script>");
}
MemberDAO mdao = new MemberDAO();
//입력안된사항이 있을때
if(bean.getM_id()==null | bean.getM_pass()==null | bean.getM_pass2()==null | bean.getM_name()==null | 
	bean.getM_email()==null | bean.getM_address()==null | bean.getM_post()==null |
	bean.getM_tel()==null | bean.getM_birth()==null  | bean.getM_jibunAddress()==null ) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('There is an empty spot!')");
	script.println("history.go(-1)");
	script.println("</script>");	
//비밀번호,비밀번호확인 다를때	
}else if(!bean.getM_pass().equals(bean.getM_pass2())){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('Password is not corrected!')");
	script.println("history.go(-1)");
	script.println("</script>");
//회원가입 성공
}else {
	int result = mdao.m_join(bean);
	if(result == -1) {     //아이디 중복체크!
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('ID already exists!')");
		script.println("history.go(-1)");
		script.println("</script>");
	}else if(result != -1) {
	PrintWriter script = response.getWriter();
	mdao.m_join(bean);
	script.println("<script>");
	script.println("alert('JOIN Success!'");
	script.println("</script>");
		
	session.setAttribute("m_id", bean.getM_id());
	session.setAttribute("m_pass", bean.getM_pass());
	session.setMaxInactiveInterval(60*3);
	response.sendRedirect("Main.jsp");
	}
}
%>
</body>
</html>