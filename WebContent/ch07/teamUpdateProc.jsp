<!-- teamUpdateProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- request.getParameter or setProperty ���� �׻� �־�� �� -->
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id = "mgr" class = "ch07.TeamMgr"/>
<jsp:useBean id = "bean" class = "ch07.TeamBean">
	<jsp:setProperty property="*" name="bean"/>
</jsp:useBean>

<%
boolean result = mgr.updateTeam(bean);
String msg = "��������";
String url = "teanList.jsp";
if(result){
	msg = "��������";
	url = "teamRead.jsp?num="+bean.getNum();
}
%>

<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>