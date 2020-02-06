<!--  declaration1.jsp  -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%  // service 메소드 영역에 사용
		response.setCharacterEncoding("EUC-KR");
		String msg = team+"파이팅!!";
		//public void m() {}
%>	
<%! // 필드 및 메소드를 선언하는 영역
		String team = "Korea";
		public void m() {}
%>
출력되는 결과는? <%=msg%>