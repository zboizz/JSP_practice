<!-- index.jsp -->
<%@page contentType="text/html;charset=EUC-KR"%>
<html>
<head>
<title>Simple Shopping Mall </title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
<%@ include file="top.jsp" %>
<table width="75%" align="center" bgcolor="#FFFFFF" height="30%">
	<%if(id != null){%>
	<tr> 
		<td align="center"><span style="font-size: 50pt"><%=id%></span>��<br/> �α����Ͻ� ���� ȯ���մϴ�.</td>
	</tr>
	<%}else{%>
	<tr>
		<td align="center">�α��� �Ͻ� �� �̿��� �ּ���.</td>
	</tr>
	<%}%>
</table>
<%@ include file="bottom.jsp" %>
</body>
</html>