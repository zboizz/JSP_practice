<!--  declaration1.jsp  -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%  // service �޼ҵ� ������ ���
		response.setCharacterEncoding("EUC-KR");
		String msg = team+"������!!";
		//public void m() {}
%>	
<%! // �ʵ� �� �޼ҵ带 �����ϴ� ����
		String team = "Korea";
		public void m() {}
%>
��µǴ� �����? <%=msg%>