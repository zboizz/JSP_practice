<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- SUN�� ��å: JSP�� �ڹ��ڵ带 0%ȭ�� �������̴�. -->
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

a=<jsp:expression>a</jsp:expression>��
b=<jsp:expression>b</jsp:expression> �߿� �� ū ���ڴ�?
   <jsp:expression>max(a,b)</jsp:expression>
