<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String teams [] = {"����Ǯ","�ǽ�Ƽ","������","ÿ��","�ƽ���"};
		int wins[] = {10,8,7,7,4};
		int tie[] = {1,1,2,2,5};
		int lose[] = {0,2,2,2,2};
		int point[] = {31,25,23,23,17};
%>

<link href="style.css" rel="stylesheet" type="text/css">
<div align="center">
<h2>�����̸��� ����</h2>
<table border="1">
	<tr> 
		<th width="40">����</th>
		<th width="70">����</th>
		<th width="50">��</th>
		<th width="50">��</th>
		<th width="50">��</th>
		<th width="50">����</th>
	</tr>
	<%
			for(int i=0;i<teams.length;i++){
				out.println("<tr  align='center'>");	
				out.println("<td>"+(i+1)+"</td>");	
				out.println("<td>"+teams[i]+"</td>");	
				out.println("<td>"+wins[i]+"</td>");	
				out.println("<td>"+tie[i]+"</td>");	
				out.println("<td>"+lose[i]+"</td>");	
				out.println("<td>"+point[i]+"</td>");	
				out.println("</tr>");	
			}
	%>
	
</table><p/>
<table border="1">
	<tr> 
		<th width="40">����</th>
		<th width="70">����</th>
		<th width="50">��</th>
		<th width="50">��</th>
		<th width="50">��</th>
		<th width="50">����</th>
	</tr>
 <%
		for(int i = 0 ; i<teams.length;i++){
			%>
			 <tr align="center">
   				<td><%=i+1 %></td>
    			<td><%=teams[i] %></td>
    			<td><%=wins[i] %></td>
    			<td><%=tie[i] %></td>
    			<td><%=lose[i] %></td>
    			<td><%=point[i] %></td>
  			</tr>
			<%
		}
  %>
</table><p/>

</div>




