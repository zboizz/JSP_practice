<<<<<<< HEAD
<!-- orderProc.jsp -->
<%@page import="java.util.Enumeration"%>
<%@page import="shop.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<jsp:useBean id="orderMgr" class="shop.OrderMgr"/>

<%
		/* request.setCharacterEncoding("EUC-KR"); */
		//session�� ����� ��ٱ��ϸ� ����
		Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
		Enumeration<Integer> hCartKey = hCart.keys();
		String msg = "";
		if(!hCart.isEmpty()){
			while(hCartKey.hasMoreElements()){
				//��ٱ��Ͽ� ����� �ֹ� ��ü
				OrderBean order = hCart.get(hCartKey.nextElement());
				//�ֹ�ó��
				orderMgr.insertOrder(order);
				//�������
				pMgr.reduceProduct(order);
				//��ٱ��Ͽ� �ֹ��� ��ǰ ����
				cMgr.deleteCart(order);
			}
			msg="�ֹ�ó�� �Ͽ����ϴ�";	
		}else{
			msg="��ٱ��ϰ� ������ϴ�.";
		}		
%>
<script>
	alert("<%=msg%>");
	location.href="orderList.jsp";
</script>