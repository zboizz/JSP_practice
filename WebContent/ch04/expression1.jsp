<!-- expression1.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
	String name[] = {"Java","JSP","Android","Spring"};
%>
<table border="1">
	<tr>
		<th>��ȣ</th>
		<th>����</th>
	</tr>
	<%
		for(int i=0;i<name.length;i++){ // �߰��� scriptlet
	%>
	<tr>
		<td><%=i+1%></td> <!-- ���⼭ �� scriptlet -->
		<td><%=name[i]%></td>
	</tr>
	<% 
		}//---for
	%>
</table>