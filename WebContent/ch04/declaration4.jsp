<!--  declaration4.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%!
		int one; // �ʵ尡 �ʱ�ȭ �� �ʿ����.
		int two = 1;
		public int plusMethod() {
			return one+two;
		}
		String msg;
		int three;
%>	

one�� two�� ����? <%=plusMethod()%><br/>
String msg ����? <%=plusMethod()%><br/>
int three��? <%=three%><br/>