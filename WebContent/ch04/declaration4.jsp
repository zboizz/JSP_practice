<!--  declaration4.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%!
		int one; // 필드가 초기화 꼭 필요없다.
		int two = 1;
		public int plusMethod() {
			return one+two;
		}
		String msg;
		int three;
%>	

one과 two의 합은? <%=plusMethod()%><br/>
String msg 값은? <%=plusMethod()%><br/>
int three은? <%=three%><br/>