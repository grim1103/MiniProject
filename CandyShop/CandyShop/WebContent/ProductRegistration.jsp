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
<h2 align="center">Registration</h2>
<table align="center">
<tr height="40">
<td width="300" align="center">Go Candy Registration! >></td>
<td align="center">
<button type="button" onclick="location.href='CandyList.jsp'">Candy</button>
</td>
</tr>
<tr height="40">
<td width="300" align="center">Go Chocolate Registration! >></td>
<td align="center">
<button type="button" onclick="location.href='ChocoList.jsp'">Chocolate</button>
</td>
</tr>
<tr height="40">
<td width="300" align="center">Go Jelly Registration! >></td>
<td align="center">
<button type="button" onclick="location.href='JellyList.jsp'">Jelly</button>
</td>
</tr>
<tr height="40">
<td width="300" align="center">Go JellyBean Registration! >></td>
<td align="center">
<button type="button" onclick="location.href='JellyBeanList.jsp'">JellyBean</button>
</td>
</tr>
<tr height="40">
<td width="300" align="center">Go MarshMallow Registration! >></td>
<td align="center">
<button type="button" onclick="location.href='MarshList.jsp'">MarshMallow</button>
</td>
</tr>
<tr height="40">
<td width="300" align="center">Go Gum Registration! >></td>
<td align="center">
<button type="button" onclick="location.href='GumList.jsp'">Gum</button>
</td>
</tr>
</table>
<br><br><br><br>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>