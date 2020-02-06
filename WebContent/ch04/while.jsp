<%@page import = "java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String msg = request.getParameter("msg"); // while.html의 msg하고 같아야됨.
	// 모든 통신의 값들은 문자로 변형
	int number = Integer.parseInt(request.getParameter("number")); // while.html의 number하고 같아야됨.
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