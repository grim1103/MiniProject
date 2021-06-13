<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.loginForm {
margin: 30px;
}
</style>
</head>

<body>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<br><br><br><br><br>
<form action="LoginAction.jsp" method="post">
<div class="loginForm">
	<table align="center" border="1">
		<tr height="40">
			<td width="100" align="center">I D</td>
			<td align="center">
			<input type="text" name="m_id" size="20" placeholder="I D"></td>
		</tr>
		<tr height="40">
			<td width="100" align="center">PASSWORD</td>
			<td align="center">
			<input type="password" name="m_pass" size="20" placeholder="PASSWORD"></td>
		</tr>
		<tr height="30">
			<td width="100" align="center" colspan="2">
			<input type="button" value="JOIN" onclick="location.href='JoinForm.jsp'">&nbsp;
			<input type="submit" value="LOGIN">
			</td>
</table>
</div>
</form>
<br><br><br><br><br><br><br><br><br><br><br>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>

</body>
</html>