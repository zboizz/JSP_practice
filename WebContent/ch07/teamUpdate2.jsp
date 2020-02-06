<!-- teamUpdate2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bean" scope="session" class="ch07.TeamBean"/>

<!-- 
��ȣ: <%=bean.getNum() %><br/>
�̸�: <%=bean.getName() %><br/>

��ü �����ϱ����� session �˻��Ѵ�. ������ id(key)���� ���� ��ü�� �ִٸ�
������ ���� �ʰ� ������ �Ѵ�. teamRead���� ����� ������ ���� ���ǿ� ����Ǿ� �ִ�
�����͸� �״�� ����� �� �ִ�.

@teamRead-16��
#���ǿ� bean Ű������ bean ��ü�� ����
session.setAttribute("bean",bean); 

#scope
page(default) 
request(a�� b ����������)
session()
application
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
<h1>Team Update2</h1>
<form method="post" action="teamUpdateProc.jsp">
<table border="1">
<tr>
	<td width="50" align="center">��ȣ</td>
	<td width="150">
		<input name="num" readonly value="<%=bean.getNum()%>">
	</td>
</tr>
<tr>
	<td  align="center">�̸�</td>
	<td>
		<input name="name" value="<%=bean.getName()%>">
	</td>
</tr>
<tr>
	<td align="center">��°�</td>
	<td>
		<input name="city" value="<%=bean.getCity()%>">
	</td>
</tr>
<tr>
	<td align="center">����</td>
	<td >
		<input name="age" value="<%=bean.getAge()%>">
	</td>
</tr>
<tr>
	<td align="center">����</td>
	<td>
		<input name="team" value="<%=bean.getTeam()%>">
	</td>
</tr>	
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="UPDATE">
	</td>
</tr>
</table><p/>
</form>
<a href="teamRead.jsp?num=<%=bean.getNum()%>">READ</a>
</div>
</body>
</html>