<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String siteName = request.getParameter("siteName");
%>
��û�� ����Ʈ �� : <%=siteName%><br/>
<jsp:include page="includeTagTop2.jsp">
	<jsp:param value="aaa" name="id"/>
	<jsp:param value="1234" name="pwd"/>
</jsp:include>