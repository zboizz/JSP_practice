<!-- login.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		String id = (String)session.getAttribute("idKey");
%>
<html>
<body>
<h3>�α��� Servlet ���</h3>

<%
	if(id!=null){
		%>
		<%=id %>�� �ݰ����ϴ�<p/>
		<a href ="logout.jsp">�α׾ƿ�</a>
<%}else{%>
		<!-- id: aaa, pwd: 1234  -->

<form method="post" action="loginServlet">
id : <input name="id"><br/>
pwd : <input type="password" name="pwd"><br/>
<input type="submit" value="�α���">
</form>

<%}%>

</body>
</html>