<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//���� or Application �ܺ�ȯ�� ������ ������ �ִ� ��ü�̴�.		
		//Ŭ���̾�Ʈ���� ���۵� ���� Ÿ��
		String mimeType = application.getMimeType("request1.html");
		String realPath = application.getRealPath("/");
		
		//Tomcat ����� �ϸ� Tomcat/logs/�α� ������ �������.
		application.log("application ���� ��ü �α� �׽�Ʈ");
		//application >session > request > page
		application.setAttribute("aaa", "�׽�Ʈ");
%>

�ź� �����̳��� �̸��� ����: <%=application.getServerInfo() %><br/>
mimeType : <%=mimeType %><br/>
���� ���� �ý��� ��� : <%= realPath %>
