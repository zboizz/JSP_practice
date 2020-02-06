<%@page import="shop.UtilMgr"%>
<%@page import="shop.ProductBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="shop.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<% 
		if(session.getAttribute("idKey")==null){
			response.sendRedirect("login.jsp");
		}
%>
<html>
<head>
<title>Simple Shopping Mall</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#FFFFFF" topmargin="100">
	<%@ include file="top.jsp" %>
	<table width="75%" align="center" bgcolor="#FFFFFF">
	<tr>
	<td align="center" bgcolor="#FFFFFF">
		<table width="95%" align="center" bgcolor="#FFFFFF" border="1">
			<tr align="center" bgcolor="#FFFFFF">
				<td><font color=black>��ǰ</font></td>
				<td><font color=black>����</font></td>
				<td><font color=black>����</font></td>
				<td><font color=black>����/����</font></td>
				<td><font color=black>��ȸ</font></td>
			</tr>
			<%
					int totalPrice = 0;
					Hashtable<Integer,OrderBean> hCart = 
							cMgr.getCartList();
					if(hCart.isEmpty()){
			%>
			<tr>
				<td colspan="5" align="center">��ٱ��ϴ� ��� �ֽ��ϴ�.</td>
			</tr>	
			<%			
					}else{
						//������ ���� ��ü
						Enumeration<Integer> hCartKey = hCart.keys();
						while(hCartKey.hasMoreElements()){
							//Ű��(productNo)���� �ֹ���ü�� �ؽ����̺� ����
							OrderBean order = 
									hCart.get(hCartKey.nextElement());
							int productNo = order.getProductNo();//��ǰ��ȣ
							//��ǰ�� ������ü
							ProductBean pbean = pMgr.getProduct(productNo);
							//��ǰ��
							String pName = pbean.getName();
							//��ǰ����
							int price = pbean.getPrice();
							//�ֹ�����
							int quantity = order.getQuantity();
							//��ǰ���� * ��ǰ����
							int subTotal = price * quantity;
							//���ֹ�����
							totalPrice+=subTotal;
			%>
			<tr align="center">
		<form method = "post" action = "cartProc.jsp">
				<input type="hidden" name="productNo" value="<%=productNo %>">
				<input type="hidden" name="flag">
				<td><%=pName %></td>
				<td><input name="quantity" value="<%=quantity%>" size="3">��</td>
				<td><%=quantity %></td>
				<td><%=UtilMgr.intFormat(subTotal)%></td>
				<td>
				<input type="button" value="����" size="3" onclick="javascript:cartUpdate(this.form)"> /
				<input type="button" value="����" size="3" onclick="javascript:cartDelete(this.form)">
				</td>
				<td>
				<a href="javascript:productDetail('<%=productNo%>')">�󼼺���</a>
				</td>
		</form>				
			</tr>
			<%}//while%>
			<tr>
				<td colspan="4" align="center">
					�� �ֹ��ݾ� : <%=UtilMgr.intFormat(totalPrice)%>��
				</td>
				<td align="center"><a href="orderProc.jsp">�ֹ��ϱ�</a></td>
			</tr>
			<%				
					}//---if-else
			%>
		</table>
	</td>
	</tr>
	</table>
	<%@ include file="bottom.jsp" %>
	<form name="detail" method="post" action="productDetail.jsp" >
		<input type="hidden" name="no">
	</form>	
</body>
</html>