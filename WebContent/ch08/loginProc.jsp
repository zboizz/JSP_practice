<!-- loginProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch08.RegisterMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
				
		boolean result = mgr.loginRegister(id, pwd);
		String msg = "�α��� ���� �ʽ��ϴ�.";
		String url = "login.jsp";
		if(result){
			msg = "�α��� �Ǿ����ϴ�.";
			url = "loginOK.jsp";
			session.setAttribute("idKey", id);
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>