<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String cookieName = "myCookie";
		Cookie cookie = new Cookie(cookieName, "Apple");
		cookie.setMaxAge(60); //1��
		
		cookie.setValue("Melone");
		response.addCookie(cookie);
%>

��Ű�� ����ϴ�.
��Ű ������ <a href="tasteCookie.jsp">�����!!!</a>

