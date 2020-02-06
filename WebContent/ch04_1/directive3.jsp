<%@ page contentType="text/html; charset=EUC-KR"%>
		pageEncoding = "ISO-8859-1"
		trimDirectiveWhitespaces="false"
<!-- 
		charset: client가 받아볼 소스의 인코딩 방식
		pageEncoding: 현재 JSP 소스의 인코딩 방식
		trimDirectiveWhitespaces: 브라우저상에서 코드를 확인할때 글과 글사이의 공백을 줄여줌(true/false)
 -->
trimDirectiveWhitespaces="false"테스트<br/>
<%
		response.setCharacterEncoding("EUC-KR");
		String s = "한글";
%>

<%=s%>