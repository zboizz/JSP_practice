<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- SUN의 정책: JSP에 자바코드를 0%화가 진행중이다. -->
<%
		response.setCharacterEncoding("EUC-KR");
		String s = new String();
		int i = s.length();
%>
<jsp:declaration>
	public int max(int a, int b) {
	return a>b? a:b;
	}
</jsp:declaration>>

<jsp:scriptlet>
	int a = 22;
	int b = 33;
</jsp:scriptlet>

a=<jsp:expression>a</jsp:expression>와
b=<jsp:expression>b</jsp:expression> 중에 더 큰 숫자는?
   <jsp:expression>max(a,b)</jsp:expression>
