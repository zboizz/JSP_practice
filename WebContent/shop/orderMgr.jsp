<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, shop.*"%>
<jsp:useBean id="orderMgr" class="shop.OrderMgr" />
<jsp:useBean id="pMgr" class="shop.ProductMgr" />
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="top.jsp" %>
	<table width="75%" align="center" bgcolor="#FFFFFF">
	<tr> 
	<td align="center" bgcolor="#FFFFFF">

		<table width="95%" align="center" bgcolor="#FFFFFF" border="1">
		<tr  align="center" bgcolor="#FFFFFF"> 
		<td><font color= black >�ֹ���ȣ</font></td>
		<td><font color= black>�ֹ���</font></td>
		<td><font color= black>��ǰ</font></td>
		<td><font color= black>�ֹ�����</font></td>
		<td><font color= black>�ֹ���¥</font></td>
		<td><font color= black>�ֹ�����</font></td>
		<td><font color= black>�󼼺���</font></td>
		</tr>
		
		</table>
	</td>
	</tr>
	</table>
	<%@ include file="bottom.jsp" %>
	<form name="detail" method="post" action="orderDetail.jsp" >
		<input type="hidden" name="no">
	</form>
</body>
</html>