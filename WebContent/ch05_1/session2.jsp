<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String season = request.getParameter("season");
		String fruit = request.getParameter("fruit");
		//id�� ���ǿ��� �����´�.
		String id = (String)session.getAttribute("idKey");
		String sessionId = session.getId();
		int intelvalTime = session.getMaxInactiveInterval();
		if(id!=null){

%>
<%=id%>���� �����ϴ� ������ ������
<%=season %>�� <%=fruit %>�Դϴ�.<br/>
���� id : <%=sessionId %><br/>	
���� ���� �ð� : <%=intelvalTime %><br/>	
<%
	//���ǿ� ������ key���� ����
	session.removeAttribute("idKey");
	//������ü�� ���� ����
	session.invalidate(); //�α׾ƿ�		
		
		}else{
	out.println("������ �ð��� ����� �Ͽ��ų� �ٸ� ������ ������ �� ���� �����ϴ�.");
	  }
%>

