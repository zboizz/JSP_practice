<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		response.setCharacterEncoding("EUC-KR");
		//includeTag1.html에서 입력한 이름의 값을 받아준다.
		//String name = request.getParameter("name");		
%>

<!-- 요청정보(request)도 같이 넘어간다. -->
<jsp:include page="includeTagTop1.jsp"/>
include ActionTag의 Body입니다.