<%@ page contentType="text/html; charset=EUC-KR"%>
		pageEncoding = "ISO-8859-1"
		trimDirectiveWhitespaces="false"
<!-- 
		charset: client�� �޾ƺ� �ҽ��� ���ڵ� ���
		pageEncoding: ���� JSP �ҽ��� ���ڵ� ���
		trimDirectiveWhitespaces: �������󿡼� �ڵ带 Ȯ���Ҷ� �۰� �ۻ����� ������ �ٿ���(true/false)
 -->
trimDirectiveWhitespaces="false"�׽�Ʈ<br/>
<%
		response.setCharacterEncoding("EUC-KR");
		String s = "�ѱ�";
%>

<%=s%>