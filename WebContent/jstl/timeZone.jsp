<!-- timeZone.jsp  -->
<%@page import="java.util.TimeZone" %>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		String tzArr[] = TimeZone.getAvailableIDs();
		for(int i=0; i<tzArr.length; i++){
			out.println(tzArr[i]+"<br/>");
		}
		
%>