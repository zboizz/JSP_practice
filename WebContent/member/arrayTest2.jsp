<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//form���� �ΰ��̻��� ������ name���� �Ѿ���� ���� �迭ó��
		String hobby[] = request.getParameterValues("hobby");
		for(int i=0; i<hobby.length;i++){
			out.println(hobby[i]+ "&nbsp;");
		}
		//Memberbean���� hobby�� �迭�� ���� : setProperty
		//bean.setHobby(request.getParameterValues("hobby"));
%>