<<<<<<< HEAD
<!-- productList.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="shop.UtilMgr"%>
<%@page import="shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<%
		Vector<ProductBean> pvlist = pMgr.getProductList();
		
%>

<html>
<head>
<title>Simple Shopping Mall</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="top.jsp" %>
	<table width="75%" align="center" bgcolor="#FFFFFF">
	<tr> 
	<td align="center" bgcolor="#FFFFFF">
		<table width="95%" bgcolor="#FFFFFF" border="1">
			<tr align="center" bgcolor="#FFFFFF"> 
				<td><font color= black>�̸�</font></td>
				<td><font color= black>����</font></td>
				<td><font color= black>��¥</font></td>
				<td><font color= black>���</font></td>
				<td><font color= black>�󼼺���</font></td>
			</tr>
		<%
				for(int i=0;i<pvlist.size();i++){
					ProductBean pbean = pvlist.get(i);
		%>
		<tr align="center">
			<td><%=pbean.getName()%></td>
			<td><%=UtilMgr.monFormat(pbean.getPrice())%></td>
			<td><%=pbean.getDate()%></td>
			<td><%=UtilMgr.monFormat(pbean.getStock())%></td>
			<td><input type="button" value="�󼼺���"
			 onclick="productDetail('<%=pbean.getNo()%>')"></td>
		</tr>		
		
		<%}//---for%>	
		</table>
	</td>
	</tr>
	</table>
	<form name="detail" method="post" action="productDetail.jsp" 
	target="_blank">
		<input type="hidden" name="no">
	</form>
	<%@ include file="bottom.jsp" %>
</body>
</html>