<!-- expression1.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
	String name[] = {"Java","JSP","Android","Spring"};
%>
<table border="1">
	<tr>
		<th>번호</th>
		<th>과목</th>
	</tr>
	<%
		for(int i=0;i<name.length;i++){ // 중간에 scriptlet
	%>
	<tr>
		<td><%=i+1%></td> <!-- 여기서 또 scriptlet -->
		<td><%=name[i]%></td>
	</tr>
	<% 
		}//---for
	%>
</table>