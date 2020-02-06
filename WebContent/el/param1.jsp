<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");					
%>
id:${param.id}<br/>
pwd:${param["pwd"]}<br/>