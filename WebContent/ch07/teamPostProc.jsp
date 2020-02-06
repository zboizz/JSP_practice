<!-- teamPostProc.jsp : teamPost.html에서 입력한 값을
테이블에 저장하는 기능이 있는 페이지, 저장 후에 teamList.jsp로 넘어간다. -->

<%@page import="ch07.TeamBean"%>
<%@page import="ch07.TeamMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//TeamMgr, TeamBean을 이 페이지와 연결
		TeamMgr mgr = new TeamMgr();
		TeamBean bean = new TeamBean();		
		
		//name, city, age, team의 자료를 가져옴
		String name = request.getParameter("name");
		String city = request.getParameter("city");
		int age = Integer.parseInt(request.getParameter("age"));
		String team = request.getParameter("team");
		
		//요청한 값들을 빈즈에 저장(set)
		bean.setName(name);
		bean.setCity(city);
		bean.setAge(age);
		bean.setTeam(team);
		
		//테이블에 저장
		boolean result = mgr.postTeam(bean);
		
		String msg = "가입실패";
		String url = "teamPost.html";
		if(result){
			msg = "가입성공";
			url = "teamList.jsp";
		}		
%>
<script>
	<!--알림창-->
	alert("<%=msg%>");
	
	<!--어디로 이동할래? -->
    <!--reponse.sendRedirect 동일기능-->
	
	lacation.href="<%=url%>";	
</script>










