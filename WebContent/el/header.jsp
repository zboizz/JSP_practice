<!-- header.jsp  -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");		
%>
ȣ����: ${haeder.host}<br/>
��������: ${header["user-agent"]}<br/>
�����: ${header["accept-language"]}<br/>