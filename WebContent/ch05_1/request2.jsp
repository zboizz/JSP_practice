<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String protocol = request.getProtocol();
		String serverName = request.getServerName();
		int port = request.getServerPort();
		String remoteAddr = request.getRemoteAddr();
		String remoteHost = request.getRemoteHost();
		String method = request.getMethod();
		StringBuffer requestURL = request.getRequestURL();
		String requestURI = request.getRequestURI();
		String query = request.getQueryString();
		String useBrowser = request.getHeader("User-Agent");
		String fileType = request.getHeader("Accept");
%>
�������� : <%=protocol%><p>
������ �̸� : <%=serverName%><p>
������ ��Ʈ ��ȣ :<%=port%><p>
����� ��ǻ���� �ּ� : <%=remoteAddr%><p>
����� ��ǻ���� �̸� : <%=remoteHost%><p>
��� method : <%=method%><p>
��û ���(URL) : <%=requestURL%><p>
��û ���(URI) : <%=requestURI%><p>
query : <%=query%><p>
���� ����ϴ� ������ : <%=useBrowser%><p>
�������� �����ϴ� file�� type : <%=fileType%><p>