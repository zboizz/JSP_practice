<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		response.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");		
%>
include ActionTag�� TOP�Դϴ�.<p/>
<b><%=name %></b>������!!!
<hr/>