<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//���ǿ� ������ Ű���� ����
		session.removeAttribute("idKey");
		//���� ��ü ��ü�� ��ȿȭ
		session.invalidate();
%>
<script>
	alert("�α׾ƿ� �Ͽ����ϴ�.");
	location.href = "login.jsp";
</script>