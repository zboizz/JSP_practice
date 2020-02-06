
<!-- viewSession.jsp -->
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//저장한 세션만 확인하기 위해서는 지정한 키값만 알면 됨
		String id = (String)session.getAttribute("logID");
		String pwd = (String)session.getAttribute("logPWD");
		out.println("id : " + id +", pwd : " + pwd +"<p/>");
		
		Enumeration<String> en = session.getAttributeNames();
		
		while(en.hasMoreElements()) {
			String name = en.nextElement();
			Object obj = session.getAttribute(name);
			out.println("session name : " + name+"<br/>");
			out.println("session value : " + obj+"<p/>");
			
		}
%>