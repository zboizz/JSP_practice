<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//�⺻������ ���� �������� form�� action ��
		response.sendRedirect("response2.jsp");
		/*
		-�� �������� ��Ű�� ������ �����ʰ� �ݵ�� ������ ���ؼ���
		������ �Ǵ� �������� ����
		-��Ű&ĳ���� �������� �ʰڴ�.
		*/
		
		response.setHeader("Pragma","no-cache");
		if(request.getProtocol().equals("HTTP/1.1")){
			response.setHeader("Cache-Control","no-cache");
		}
%>