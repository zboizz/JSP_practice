<%@page import = "java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String msg = request.getParameter("msg"); // while.html�� msg�ϰ� ���ƾߵ�.
	// ��� ����� ������ ���ڷ� ����
	int number = Integer.parseInt(request.getParameter("number")); // while.html�� number�ϰ� ���ƾߵ�.
	int cnt = 0;
	while(number>cnt){
%>
	<font color=<%="black"%>>
	<b><%=msg%></b>
	</font><br/>
<%
	cnt++;
	}//---while
%>