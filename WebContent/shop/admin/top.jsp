<%@ page pageEncoding="EUC-KR"%>
<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("adminLogin.jsp");
	}
%>
<table width="75%" align="center" bgcolor="#FFFFFF">
  <tr bgcolor="#FFFFFF"> 
    <th><a href="../index.jsp">Ȩ</a></th>
    <th><a href="adminLogout.jsp">�α׾ƿ�</a></th>
    <th><a href="memberMgr.jsp">ȸ������</a></th>
    <th><a href="productMgr.jsp">��ǰ����</a></th>
    <th><a href="orderMgr.jsp">�ֹ�����</a></th>
  </tr>
