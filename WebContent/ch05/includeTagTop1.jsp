<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		response.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");		
%>
include ActionTag의 TOP입니다.<p/>
<b><%=name %></b>파이팅!!!
<hr/>