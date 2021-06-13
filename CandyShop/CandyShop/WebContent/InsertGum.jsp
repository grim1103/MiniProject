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
<form action="InsertGumAction.jsp" method="post">
<h2 align="center">Add Gum</h2>
<table align="center" border="1">
<tr height="40">
<td align="center" width="150">Product ID :</td>
<td align="center"><input type="text" name="p_id"></td>
</tr>
<tr height="40">
<td align="center">Product Price :</td>
<td align="center"><input type="text" name="p_price"></td>
</tr>
<tr height="40">
<td align="center">Product Name :</td>
<td align="center"><input type="text" name="p_name"></td>
</tr>
<tr height="40">
<td align="center">Product Stock :</td>
<td align="center"><input type="text" name="p_stock"></td>
</tr>
<tr height="40">
<td align="center">Product Image :</td>
<td align="center"><input type="file" name="p_img"></td>
</tr>
<tr height="40">
<td align="center">Product Image2 :</td>
<td align="center"><input type="file" name="p_img2"></td> 
</tr>
<tr height="40">
<td align="center">Product Image2 :</td>
<td align="center"><input type="file" name="p_img3"></td>
</tr>
<tr height="80">
<td align="center">Product Detail :</td>
<td align="center"><textarea rows="5" cols="40" name="p_detail"></textarea></td>
</tr>
<tr height="40">
<td colspan="2" align="center">
<input type="reset" value="RESET">&nbsp;
<input type="submit" value="ADD">
</tr>
</table>
</form>
<br><br><br><br>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>