<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,shop.*"%>
<jsp:useBean id="pMgr" class="shop.ProductMgr" />
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#FFFFFF" topmargin="100">
<%@ include file="top.jsp"%>
<table width="75%" align="center" bgcolor="#FFFFFF">
	<tr>
		<td align="center" bgcolor="#FFFFFF">
		<table width="95%" align="center" bgcolor="#FFFFFF" border="1">
			<tr  align="center" bgcolor="#FFFFFF">
				<td><font color= black>�̸�</font></td>
				<td><font color= black>����</font></td>
				<td><font color= black>��¥</font></td>
				<td><font color= black>���</font></td>
				<td>&nbsp;</td>
			</tr>
			<%
				Vector<ProductBean> vResult = pMgr.getProductList();
				if (vResult.size() == 0) {
			%>
			<tr>
				<td align="center" colspan="5">��ϵ� ��ǰ�� �����ϴ�.</td>
			</tr>
			<%
				} else {
					for (int i = 0; i < vResult.size(); i++) {
						ProductBean product = vResult.get(i);
			%>
			<tr  align="center">
				<td><%=product.getName()%></td>
				<td><%=UtilMgr.intFormat(product.getPrice())%></td>
				<td><%=product.getDate()%></td>
				<td><%=UtilMgr.intFormat(product.getStock())%></td>
				<td>
				<a href="javascript:productDetail('<%=product.getNo()%>')">�󼼺���</a></td>
			</tr>
			<%
					}//for
				}//if
			%>
			<tr>
				<td colspan="5" align="center">
					<a href="productInsert.jsp">��ǰ���</a>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<%@ include file="bottom.jsp"%>
<form name="detail" method="post" action="productDetail.jsp">
	<input type="hidden" name="no">
</form>
</body>
</html>