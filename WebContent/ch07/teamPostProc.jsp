<!-- teamPostProc.jsp : teamPost.html���� �Է��� ����
���̺� �����ϴ� ����� �ִ� ������, ���� �Ŀ� teamList.jsp�� �Ѿ��. -->

<%@page import="ch07.TeamBean"%>
<%@page import="ch07.TeamMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//TeamMgr, TeamBean�� �� �������� ����
		TeamMgr mgr = new TeamMgr();
		TeamBean bean = new TeamBean();		
		
		//name, city, age, team�� �ڷḦ ������
		String name = request.getParameter("name");
		String city = request.getParameter("city");
		int age = Integer.parseInt(request.getParameter("age"));
		String team = request.getParameter("team");
		
		//��û�� ������ ��� ����(set)
		bean.setName(name);
		bean.setCity(city);
		bean.setAge(age);
		bean.setTeam(team);
		
		//���̺� ����
		boolean result = mgr.postTeam(bean);
		
		String msg = "���Խ���";
		String url = "teamPost.html";
		if(result){
			msg = "���Լ���";
			url = "teamList.jsp";
		}		
%>
<script>
	<!--�˸�â-->
	alert("<%=msg%>");
	
	<!--���� �̵��ҷ�? -->
    <!--reponse.sendRedirect ���ϱ��-->
	
	lacation.href="<%=url%>";	
</script>










