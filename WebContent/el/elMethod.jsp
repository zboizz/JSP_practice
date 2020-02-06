<!-- elMothod.jsp  -->
<%@page import="el.ELMethod"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="m" uri="/WEB-INF/tlds/Functions.tld" %>
<%
	int num = 123456789;		
%>
JSP 방식 : <%=ELMethod.comma(num)%><br/>
TLD 방식 : ${m:comma(123456789)}
