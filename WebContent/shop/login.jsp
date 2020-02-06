<!-- login.jsp -->
<!--쇼핑몰 기능 
1. 상품
2. 장바구니: session을 활용한다.
3. 구매 
-->
<%@page contentType="text/html;charset=EUC-KR"%>
<html>
<head>
<title>Simple Shopping Mall Demo</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="100">
<%@ include file="top.jsp" %>
<form method="post" action="loginProc.jsp">
<table width="50%" align="center" bgcolor="#FFFFFF">
	<tr bordercolor="black">  
	<td height="190">
		<table width="60%" border="1" align="center">
		<tr bordercolor="black"> 
			<td colspan="2" align="center">로그인</td>
		</tr>
		<tr  align="center"> 
			<td width="47%">ID</td>
			<td width="53%"><input name="id" value="aaa"></td>
		</tr>
		<tr> 
			<td align="center">Password</td>
			<td align="center"><input name="pwd" value="1234"></td>
		</tr>
		<tr> 
			<td colspan="2" align="center"><input type="submit" value="login">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input type="reset" value="reset">
			</td>
		</tr>
		</table>
	</td>
	</tr>
</table>
</form>
<%@ include file="bottom.jsp" %>
</body>
