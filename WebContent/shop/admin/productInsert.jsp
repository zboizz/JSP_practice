<!-- productInsert.jsp -->
<%@ page contentType="text/html;charset=EUC-KR" %>
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="top.jsp" %>
	<form method="post" action="productProc.jsp?flag=insert" enctype="multipart/form-data">
	<!-- enctype="multipart/form-data" 일때에는 post방식으로 보낸다. 
	대신에 action을 통해서 action="productProc.jsp?flag=insert" 를 해줘야한다.-->
	<table width="75%" align="center" bgcolor="#FFFFFF">
	<tr> 
	<td align="center" bgcolor="#FFFFFF">
		<table width="95%" bgcolor="#FFFFFF" border="1">
		<tr bgcolor="#FFFFFF"> 
		<td colspan="2" align="center">
			<font color="#FFFFFF">상품 등록</font>
		</td>
		</tr>
		<tr> 
			<td align="center">상품이름</td>
			<td align="left"><input name="name" size="20"></td>
		</tr>
		<tr> 
			<td align="center">상품가격</td>
			<td align="left"><input name="price" size="20">원</td>
		</tr>
		<tr> 
			<td align="center">상품설명</td>
			<td><textarea rows="10" cols="45" name="detail"></textarea></td>
		</tr>
		<tr> 
			<td align="center">상품수량</td>
			<td><input name="stock" size="10">개</td>
		</tr>
		<tr> 
			<td align="center">상품이미지</td>
			<td><input type="file" name="image"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"> 
			<input type="submit" value="상품등록">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="다시쓰기">
		</td>
		</tr>
		</table>
	</td>
	</tr>
	</table>
	</form>
	<%@ include file="bottom.jsp" %>
</body>
</html>