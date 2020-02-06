<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<style>
h1{
	text-align: center;
	color:#455B71;
}
th {
	background-color: #A4BBC8;
	color:#455B71;
	padding: 10px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

td:nth-child(2n){
	background-color: #FCD1B5;
	color: #455B71;
	padding: 10px;
	
}
td:nth-child(2n+1){
	background-color: #FAECE3;
	color: #455B71;
	padding: 10px;

}

table{
	margin-left: auto;
    margin-right: auto;
}

</style>
<h1 >구구단</h1>
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