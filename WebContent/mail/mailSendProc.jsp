<!-- mailSendProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="mail.MailSend"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		boolean result = mgr.sendPwd(id, email);
		String msg = "�������� ����";
		if(result)
			msg = "�������� ����";
%>
<!-- <form method="post" action="MailSend.jsp">
</form> -->
<script>
	alert("<%=msg%>");
	location.href = "mailSend.jsp";
</script>
