<!-- empty.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		if(id!=null){
			
		}else{
			
		}
%>
name�� ��û���� : ${empty param.id}<br/>
<a href = "empty.jsp?id=aaa">id���� ��û</a><br/>
<a href = "empty.jsp">id�� ��û����</a><br/>