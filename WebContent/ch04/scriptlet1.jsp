<!--  scriptlet1.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int one=1;
	int two=2;
	// 스크립트릿은 _jspService 메소드 영역에 선언이 되는 요소이다. 그래서 변수는 반드시 초기화
	int three = one + two;
	String msg = "꿈은 이루어진다.";
%>
<!-- 표현식 영역도 자바 영역이지만, 세미콜론(;)은 불필요. -->
<%=three%><br/>
<%=msg%><br/>