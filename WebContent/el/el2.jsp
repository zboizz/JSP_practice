<!-- el2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"
		 isELIgnored = "true" 
%>
<%
		request.setCharacterEncoding("EUC-KR");
		//�����: page, request, session, application
		request.setAttribute("siteName", "JSPStudy.co.kr");
%>
����Ʈ��: ${siteName}<br>