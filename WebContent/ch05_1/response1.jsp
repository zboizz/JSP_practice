<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//기본적으로 응답 페이지는 form에 action 값
		response.sendRedirect("response2.jsp");
		/*
		-이 페이지는 쿠키에 저장이 되지않고 반드시 서버를 통해서만
		응답이 되는 페이지로 설정
		-쿠키&캐쉬에 저장하지 않겠다.
		*/
		
		response.setHeader("Pragma","no-cache");
		if(request.getProtocol().equals("HTTP/1.1")){
			response.setHeader("Cache-Control","no-cache");
		}
%>