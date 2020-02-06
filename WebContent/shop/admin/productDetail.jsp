<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,shop.*"%>
<jsp:useBean id="pMgr" class="shop.ProductMgr" />
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script  src="script.js"></script>
</head>
<body bgcolor="#FFFFFF" topmargin="100">
<%@ include file="top.jsp"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	ProductBean product = pMgr.getProduct(no);
%>
<table width="75%" align="center" bgcolor="#FFFFFF">
	<tr>
		<td align="center" bgcolor="#FFFFFF">
		<table width="95%" align="center" bgcolor="#FFFFFF" border="1">
			<tr bgcolor="#FFFFFF">
				<td colspan="3" align="center"><font color="#FFFFFF"><%=product.getName()%></font></td>
			</tr>
			<tr>
				<td width="20%">
					<img src="../data/<%=product.getImage()%>"
					height="150" width="150">
				</td>
				<td width="30%" valign="top">
				<table border="1" width="100%" height="100%">
					<tr>
						<td><b>��ǰ�̸� : </b><%=product.getName()%></td>
					</tr>
					<tr>
						<td><b>�� �� : </b><%=UtilMgr.intFormat(product.getPrice())%></td>
					</tr>
					<tr>
						<td><b>�԰�¥ : </b><%=product.getDate()%></td>
					</tr>
					<tr>
						<td><b>�� �� : </b><%=UtilMgr.intFormat(product.getStock())%></td>
					</tr>
				</table>
				</td>
				<td width="50%" valign="top"><b>�󼼼���</b><br/>
				<pre><%=product.getDetail()%></pre></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
				<a href="javascript:productUpdate('<%=product.getNo()%>')">�����ϱ�</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:productDelete('<%=product.getNo()%>')">�����ϱ�</a>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<%@ include file="bottom.jsp"%>
<form name="update" method="post" action="productUpdate.jsp"><input
	type=hidden name=no></form>
<form name="del" method="post" action="productProc.jsp?flag=delete">
<input type=hidden name=no></form>
</body>
</html>
