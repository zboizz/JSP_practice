<%@page import="shop.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		String msg = "������ �߻��Ͽ����ϴ�.";
		
		boolean result = false;
			
		if(flag.equals("insert")){
			result = pMgr.insertProduct(request);
			if(result) msg = "��ǰ�� ����Ͽ����ϴ�.";
		}else if(flag.equals("update")){
			result = pMgr.updateProduct(request);
			if(result) msg ="��ǰ�� �����Ͽ����ϴ�.";
		}else if(flag.equals("delete")){
			int no = UtilMgr.parseInt(request, "no");
			result = pMgr.deleteProduct(no);
			if(result) msg = "��ǰ�� �����Ͽ����ϴ�.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "productMgr.jsp";
