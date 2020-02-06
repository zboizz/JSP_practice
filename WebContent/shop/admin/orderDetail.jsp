<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,shop.*"%>
<jsp:useBean id="orderMgr" class="shop.OrderMgr" />
<jsp:useBean id="pMgr" class="shop.ProductMgr" />
<%
		request.setCharacterEncoding("EUC-KR");
		int no = Integer.parseInt(request.getParameter("no"));
		OrderBean order = orderMgr.getOrderDetail(no);
		ProductBean product = pMgr.getProduct(order.getProductNo());
%>
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
<%@ include file="top.jsp"%>
<form method="post" name="order" action="orderProc.jsp">
<table width="75%" align="center" bgcolor="#FFFFFF">
	<tr>
		<td align="center" bgcolor="#FFFFFF">
		<table width="95%" align="center" bgcolor="#FFFFFF" border="1">
			<tr bgcolor="#FFFFFF">
				<td colspan="2" align="center">
					<font color=black>�ֹ��󼼳���</font>
				</td>
			</tr>
			<tr align="center">
				<td>�����̵�</td>
				<td><%=order.getId()%></td>
			</tr>
			<tr align="center">
				<td>�ֹ���ȣ</td>
				<td><%=order.getNo()%></td>
			</tr>
			<tr align="center">
				<td>��ǰ��ȣ</td>
				<td><%=product.getNo()%></td>
			</tr>
			<tr align="center">
				<td>��ǰ�̸�</td>
				<td><%=product.getName()%></td>
			</tr>
			<tr align="center">
				<td>��ǰ����</td>
				<td><%=UtilMgr.intFormat(product.getPrice())%>��</td>
			</tr>
			<tr align="center">
				<td>�ֹ�����</td>
				<td><%=order.getQuantity() + ""%>��</td>
			</tr>
			<tr align="center">
				<td>������</td>
				<td><%=product.getStock()%>��</td>
			</tr>
			<tr align="center">
				<td>�ֹ���¥</td>
				<td><%=order.getDate()%></td>
			</tr>
			<tr align="center">
				<td>�ݾ�</td>
				<td><%=UtilMgr.intFormat(order.getQuantity() * product.getPrice())%>��</td>
			</tr>
			<tr align="center">
				<td>�ֹ�����</td>
				<td>
					<select name="state">
						<option value="1">������</option>
						<option value="2">����</option>
						<option value="3">�Ա�Ȯ��</option>
						<option value="4">����غ�</option>
						<option value="5">�����</option>
						<option value="6">�Ϸ�</option>
					</select> 
				<script>document.order.state.value=<%=order.getState()%></script>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="button" value="����"
					size="3" onclick="javascript:orderUpdate(this.form)"> / 
					<input type="button" value="����" size="3"
					onclick="javascript:orderDelete(this.form)">
				</td>
			</tr>
		</table>
		<input type="hidden" name="no" value="<%=order.getNo()%>"> 
		<input type="hidden" name="flag">
		</td>
	</tr>
</table>
</form>
<%@ include file="bottom.jsp"%>
</body>
</html>