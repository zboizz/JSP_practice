<%@ page language ="java" contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<html>
<head>
<title>회원가입폼</title>
<style>
#formArea{
			margin : auto;
			width : 400px;
		 	border : 1px solid gray;
			text-align : center;}
h1{			text-align : center;}
table{		width : 380px;
	  		margin : auto;
	  		text-align : center;}
</style>
</head>
<body>
<section id = "formArea">
<h1>회원정보 입력</h1>
<form action = "joinChk.jsp" method = "post">
<table>
<tr>
		<td><label for = "id">아이디 : </label></td>
		<td><input type = "text" name = "id" id = "id"></td>
</tr>
<tr>
		<td><label for = "pwd">비밀번호 : </label> </td>
		<td><input type = "password" name="pwd" id = "pwd" > </td>
</tr>
<tr>
		<td><label for = "gender">성별 : </label> </td>
		<td><input type="radio" name = "gender" value="1" id = "gender" checked>남
		<input type="radio" name = "gender" value="2" >여 </td>
</tr>




</table>
</section>
</body>

</html>