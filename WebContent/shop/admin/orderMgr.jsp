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
		<td><font color= black>�ֹ���ȣ</font></td>
		<td><font color= black>�ֹ���</font></td>
		<td><font color= black>��ǰ</font></td>
		<td><font color= black>�ֹ�����</font></td>
		<td><font color= black>�ֹ���¥</font></td>
		<td><font color= black>�ֹ�����</font></td>
		<td><font color= black>�󼼺���</font></td>
		</tr>
		<%
			Vector<OrderBean> vlist = orderMgr.getOrderList();
			if(vlist.isEmpty()){		
		%>
		<tr>
		<td align ="center" colspan="7">�ֹ������� �����ϴ�.</td>
		</tr>
		<%}else{ 
		for(int i=0; i<vlist.size(); i++){
		OrderBean order/* �ֹ����� */ = vlist.get(i);
		ProductBean product /* ��ǰ����  */ = pMgr.getProduct(order.getProductNo());		
		%>
		<tr align ="center">
		<td><%=order.getNo() %></td>
		<td><%=order.getId() %></td>
		<td><%=product.getName() %></td>
		<td><%=order.getQuantity() %></td>
		<td><%=order.getDate() %></td>
		<td>
		<%
		switch(Integer.parseInt(order.getState())){
		/* switch�� int�� �����ߴµ� ������ �������������� String���� �����ϴ�.  */
		case 1 : out.println("������");break;
		case 2 : out.println("����");break;
		case 3 : out.println("�Ա�Ȯ��");break;
		case 4 : out.println("����غ�");break;
		case 5 : out.println("�����");break;
		default : out.println("�Ϸ�");
	}	
		%>
		</td>
		<td><a href="javascript:orderDetail('<%=order.getNo()%>')">�󼼺���</a></td>
		</tr>
		<%
		}//--for
		}//--if
		
		%>
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
