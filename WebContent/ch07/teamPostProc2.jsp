<!-- teamPostProc2.jsp : ���� �׼��±׸� ����Ͽ� ���̺� ���� ��� -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>


<jsp:useBean id="mgr" class = "ch07.TeamMgr"/>
<jsp:useBean id="bean" class = "ch07.TeamBean"/>

<!-- ���� ������ ǥ����
TeamMgr mgr = new TeamMgr();
TeamBean bean = new TeamBean();	
-->

<jsp:setProperty property="*" name="bean"/>
<!-- 
��û�� ���� �ް� �� ��� ������� �ϴ� ���
*�� bean�� �ִ� ��� ���� 
-->

<!-- ���� ������ ǥ����
		String name = request.getParameter("name");
		String city = request.getParameter("city");
		int age = Integer.parseInt(request.getParameter("age"));
		String team = request.getParameter("team");
		
		bean.setName(name);	bean.setCity(city);	bean.setAge(age); bean.setTeam(team);
 -->
 
<%
		boolean result = mgr.postTeam(bean);
		
		String msg = "���Խ���";
		String url = "teamPost.html";
		if(result){
			msg = "���Լ���";
			url = "teamList.jsp";
		}		
%>
<script>	
	alert("<%=msg%>");
	lacation.href="<%=url%>";	
</script>









