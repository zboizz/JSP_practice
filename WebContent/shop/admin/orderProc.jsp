<!-- orderProc.jsp -->
<%@page import="shop.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="orderMgr" class="shop.OrderMgr"/>
<%
		//�ֹ��� ���� ���� ó��
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		int no = UtilMgr.parseInt(request, "no");
		boolean result = false;
		String msg = "������ �߻� �Ͽ����ϴ�.";
		if(flag.equals("update")){
			String state = request.getParameter("state");
			result = orderMgr.updateOrder(no, state);
			if(result) msg = "�����Ͽ����ϴ�.";
		}else if(flag.equals("delete")){
			result = orderMgr.deleteOrder(no);
			if(result) msg = "�����Ͽ����ϴ�.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "orderMgr.jsp";
</script>
