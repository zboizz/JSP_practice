<%@ page contentType="text/html; charset=EUC-KR" buffer = "5kb"	%>
<%
		request.setCharacterEncoding("EUC-KR");
		int totalBuffer = out.getBufferSize();
		int remainBuffer = out.getRemaining();
		int useBuffer = totalBuffer - remainBuffer;
		out.print("<b>가나다</b>");
		out.println("<b>가나다</b>");
		out.print("<b>가나다</b><br/>");
%>

출력버퍼의 전체 크기 : <%=totalBuffer %><br/>
남은 버퍼의 크기 : <%=remainBuffer %><br/>
현재 버퍼의 사용량 : <%=useBuffer %><br/>

