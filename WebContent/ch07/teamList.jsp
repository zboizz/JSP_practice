<%@page import="ch07.TeamBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<jsp:useBean id="mgr" class="ch07.TeamMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		Vector<TeamBean> vlist = mgr.listTeam();
		//out.println(vlist.size());
		//���Ͱ��� ����� ���޵Ǵ��� Ȯ���ϱ� ���ؼ�
		//vlist.size�� ����غ���. (����� 5�� ����)		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">

<body>
<div align = "center">
<h1>TEAM LIST</h1>
<table border = "1">
		<tr>
			<th>��ȣ</th>
			<th>�̸�</th>
			<th>��°�</th>
			<th>����</th>
			<th>����</th>
		</tr>
		<% 
			for(int i=0; i<vlist.size();i++){
				//Vector�� ����� TeamBean ��ü�� ��ȯ
				TeamBean bean = vlist.get(i);
				int num = bean.getNum();			
		%>
		<tr align='center'>
<!-- ��ȣ�� �����۸�ũ�� �޾Ƽ� teamRead.jsp�� �̵��ϰԲ� ���� -->
		<td><a href="teamRead.jsp?num=<%=num%>">
		<%=i+1%></a></td>		
		<td><%=bean.getName()%></td>
		<td><%=bean.getCity()%></td>
		<td><%=bean.getAge()%></td>
		<td><%=bean.getTeam()%></td>				
		</tr>		
		<%}//---for %>
		
				
</table><p/>
<a href="teamPost.html">POST</a>
</div>
</body>
</html>










