<%@page import = "java.util.Random" %>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%!
		// ������ ������ ���� �޼ҵ�
		public String randomColor(){
			Random r = new Random();
			String rgb = Integer.toHexString(r.nextInt(256));
	 		rgb += Integer.toHexString(r.nextInt(256));
	 		rgb += Integer.toHexString(r.nextInt(256));
	 		return "#"+rgb;
		}
%>	

<font color="<%=randomColor()%>">����ȭ���� �Ǿ����ϴ�.</font><br/>
<font color="<%=randomColor()%>">����ȭ���� �Ǿ����ϴ�.</font><br/>
<font color="<%=randomColor()%>">����ȭ���� �Ǿ����ϴ�.</font><br/>
<font color="<%=randomColor()%>">����ȭ���� �Ǿ����ϴ�.</font><br/>
<font color="<%=randomColor()%>">����ȭ���� �Ǿ����ϴ�.</font><br/>