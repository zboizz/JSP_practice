<!--  scriptlet1.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int one=1;
	int two=2;
	// ��ũ��Ʈ���� _jspService �޼ҵ� ������ ������ �Ǵ� ����̴�. �׷��� ������ �ݵ�� �ʱ�ȭ
	int three = one + two;
	String msg = "���� �̷������.";
%>
<!-- ǥ���� ������ �ڹ� ����������, �����ݷ�(;)�� ���ʿ�. -->
<%=three%><br/>
<%=msg%><br/>