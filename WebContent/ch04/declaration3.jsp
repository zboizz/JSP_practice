<!--  declaration3.jsp -->
<%@page import="ch03.MyUtil" %>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		response.setCharacterEncoding("EUC-KR");
		
%>	
<body bgColor="<%=MyUtil.randomColor()%>"></body> <!-- 이거 안되는데 간단한거라 상관없습니다 -->