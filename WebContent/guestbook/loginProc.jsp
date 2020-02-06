<!-- loginProc.jsp -->
<%@page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="login" class="guestbook.JoinBean" scope="session"/>
<jsp:setProperty name="login" property="*"/>
<%
		String url="login.jsp";
		if(request.getParameter("url")!=null&&
				!request.getParameter("url").equals("null")){
			url=request.getParameter("url");
		}
		boolean flag = mgr.loginJoin(login.getId(), login.getPwd());
		String msg = "일치합니다.";
		if(flag){
			msg = "불일치합니다.";
			login = mgr.getJoin(login.getId());
			session.setAttribute("idKey", login.getId());
			session.setAttribute("login", login);
		}
%>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>





