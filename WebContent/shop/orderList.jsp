<%@page import="shop.ProductBean"%>
<%@page import="shop.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="orderMgr" class="shop.OrderMgr"/>
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
		<table width="95%"  bgcolor="#FFFFFF" border="1">
		<tr bgcolor="#FFFFFF" align="center"> 
			<td><font color= black>�ֹ���ȣ</font></td>
			<td><font color= black>��ǰ</font></td>
			<td><font color= black>�ֹ�����</font></td>
			<td><font color= black>�ֹ���¥</font></td>
			<td><font color= black>�ֹ�����</font></td>
		</tr>
		<%
				Vector<OrderBean> vlist = orderMgr.getOrder(id);
				if(vlist.isEmpty()){
		%>
		<tr>
			<td colspan="5">
			�ֹ��Ͻ� ��ǰ�� �����ϴ�.
			</td>
		</tr>
		<%			
				}else{
					for(int i=0;i<vlist.size();i++){
						OrderBean order = vlist.get(i);
						int productNo = order.getProductNo();
						ProductBean pbean = pMgr.getProduct(productNo);
		%>
		<tr align="center">
			<td><%=order.getNo()%></td>
			<td>
			<a href="javascript:productDetail('<%=productNo%>')">
				<%=pbean.getName()%></a>
			</td>
			<td><%=order.getQuantity()%></td>
			<td><%=order.getDate()%></td>
			<td>
				<%
					switch(order.getState()){
						case "1": out.print("������"); break;
						case "2": out.print("����"); break;
						case "3": out.print("�Ա�Ȯ��"); break;
						case "4": out.print("����غ�"); break;
						case "5": out.print("�����"); break;
						case "6": out.print("�Ϸ�"); break;
					}//---switch
				%>
			</td>
		</tr>	
		<%						
					}//---for
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