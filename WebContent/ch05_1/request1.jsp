<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		//from�� post ��Ŀ� ��û�� �ѱ� ó���� ���� ���, �ݵ�� ù��° ����
	    //form�� get��� server.xml 67���� URIEEncoding = "EUC-KR" ����
		request.setCharacterEncoding("EUC-KR");

		//form���� �Է��� ���� �ޱ� ���� �޼ҵ�. �Ű����� name��
		String name = request.getParameter("name");
		String studentNum = request.getParameter("studentNum");
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");
		
		//hobby�� checkbox�� ������ ������ �ݵ�� �迭�� �޾ƾ���.
		//String hobby = request.getParameter("hobby");
		String hobby[] = request.getParameterValues("hobby");
		String hobbys = "";
		for(int i = 0;i<hobby.length;i++){
			hobbys+=hobby[i]+"&nbsp;";
		}
		
		//String page = null;
		if(gender.equals("man")){
			gender = "����";
		}else if(gender.equals("woman")){
			gender = "����";
		}
%>



���� : <%=name%><br/>
�й� : <%=studentNum%><br/>
���� : <%=gender%><br/>
���� : <%=major%><br/>
��� : <%=hobbys%><br/>

