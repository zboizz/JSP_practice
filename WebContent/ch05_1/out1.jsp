<%@ page contentType="text/html; charset=EUC-KR" buffer = "5kb"	%>
<%
		request.setCharacterEncoding("EUC-KR");
		int totalBuffer = out.getBufferSize();
		int remainBuffer = out.getRemaining();
		int useBuffer = totalBuffer - remainBuffer;
		out.print("<b>������</b>");
		out.println("<b>������</b>");
		out.print("<b>������</b><br/>");
%>

��¹����� ��ü ũ�� : <%=totalBuffer %><br/>
���� ������ ũ�� : <%=remainBuffer %><br/>
���� ������ ��뷮 : <%=useBuffer %><br/>

