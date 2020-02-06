<!-- teamPostProc2.jsp : 빈즈 액션태그를 사용하여 테이블에 저장 기능 -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>


<jsp:useBean id="mgr" class = "ch07.TeamMgr"/>
<jsp:useBean id="bean" class = "ch07.TeamBean"/>

<!-- 위와 동일한 표현법
TeamMgr mgr = new TeamMgr();
TeamBean bean = new TeamBean();	
-->

<jsp:setProperty property="*" name="bean"/>
<!-- 
요청된 값을 받고 또 빈즈에 저장까지 하는 기능
*는 bean에 있는 모든 값들 
-->

<!-- 위와 동일한 표현법
		String name = request.getParameter("name");
		String city = request.getParameter("city");
		int age = Integer.parseInt(request.getParameter("age"));
		String team = request.getParameter("team");
		
		bean.setName(name);	bean.setCity(city);	bean.setAge(age); bean.setTeam(team);
 -->
 
<%
		boolean result = mgr.postTeam(bean);
		
		String msg = "가입실패";
		String url = "teamPost.html";
		if(result){
			msg = "가입성공";
			url = "teamList.jsp";
		}		
%>
<script>	
	alert("<%=msg%>");
	lacation.href="<%=url%>";	
</script>









