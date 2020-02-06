<!-- if.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// jsp templates에서 수정
	// if.html에 요청된 값에 대한 인코딩을 EUC-KR로 세팅하라. 그래서 한글이 안 깨짐
	request.setCharacterEncoding("EUC-KR");
	// if.html에서 name과 color 던진다. (매개변수의 변수명은 반드시 form에 name값이 일치해야함. 문법임)
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String msg = null;
	
	if(color.equals("blue")){
		msg="파란색";
	}else if(color.equals("red")){
		msg="빨간색";
	}else if(color.equals("orange")){
		msg="오렌지색";
	}else{
		msg="기타";
		color="white";
	}
%>
<body bgcolor="<%=color%>">
<%=name%>님이 좋아하는 색깔은 <%=msg%>입니다.
</body>