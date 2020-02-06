<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, shop.*"%>
<jsp:useBean id="mMgr" class="shop.MemberMgr" />
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#FFFFFF" topmargin="100">
	<%@ include file="top.jsp" %> 
	<%Vector<MemberBean> vlist = mMgr.getMemberList();%>
	<table width="75%" align="center" bgcolor="#FFFFFF">
	<tr> 
	<td align="center" bgcolor="#FFFFFF">

		<table width="95%" align="center" bgcolor="#FFFFFF" border="1">
		<tr align="center" bgcolor=black> 
			<td><font color="#FFFFFF">ȸ���̸�</font></td>
			<td><font color="#FFFFFF">ȸ�����̵�</font></td>
			<td><font color="#FFFFFF">�н�����</font></td>
			<td><font color="#FFFFFF">����</font></td> 
			<td><font color="#FFFFFF">�������</font></td> 
			<td><font color="#FFFFFF">�̸���</font></td>
			<td><font color="#FFFFFF">����</font></td>
			<td><font color="#FFFFFF">���Ϻ�����</font></td>
		</tr>
		<%
		for(int i=0; i<vlist.size(); i++){
			MemberBean mBean = vlist.get(i);
		%>
		<tr align="center"> 
			<td><%=mBean.getName()%></td>
			<td><%=mBean.getId()%></td>
			<td><%=mBean.getPwd()%></td>
			<td>
			<%=mBean.getGender().equals("1")?"����":"����"%>
			</td>
			<td><%=mBean.getBirthday()%></td>
			<td><%=mBean.getEmail()%></td>
			<td><a href="javascript:update('<%=mBean.getId()%>')">�����ϱ�</a></td>
			<td><font color="#FFFFFF">
			<a href="sendAccount.jsp?id=<%=mBean.getId()%>">���Ϻ�����</a>
			</font></td>
		</tr>
		<%}%>
		</table>
	</td>
	</tr>
	</table>
	<%@ include file="bottom.jsp" %>
	<form name="update" method="post" action="memberUpdate.jsp">
	<input type=hidden name="id">
	</form>
</body>
</html>
