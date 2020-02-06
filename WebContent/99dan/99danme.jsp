<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		response.setCharacterEncoding("EUC-KR");
		
%>
<style>
body{background: #FAFAFA; }

h1{
	text-align: center;
	color:#455B71;
	font-size: 100px;
	}
h2{
	text-align: center;
	color:#455B71;
	fonr-size: 40px;
}
th{
  
	background-color: #BDBDBD;
	color:#455B71;
	padding: 10px;	
	font-size: 30;
	border-top-left-radius: 20px;
	border-top-right-radius: 0px;
	
}
td:hover{background: #B40404;}
td{
	background-color: #2E2E2E;
	color: #E6E0F8;
	padding: 10px;
	font-size: 20;	
	border-collapse : collapse;
}

table{
   	
	margin-top: auto;
	margin-left: auto;
	margin-right: auto;
	border-collapse : collapse;
}

</style>

<h1 >구구단</h1>
<h2>2019.11.08</h2>

<table>
	<tr>
		<%for (int i = 2; i <10; i++) {%>
			<th><%=i + " 단"%></th>
		<%}%>
	</tr>
	<%for (int i = 1; i < 10; i++) { %>
	<tr>
		<%
			for (int j = 2; j <10; j++) {
		%>
		<td><%=j + " X " + i + " = " + j * i%></td>
		<%}%>
	</tr>
	<%}%>
</table>