<!-- pollFormProc.jsp -->
<%@page import="poll.MyUtil"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- ��û�Ǵ� ���ڿ� ���� ���� ���ڵ� EUC-KR ����, post ��� -->
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="poll.PollMgr"/>

<%
	int num = MyUtil.parseInt(request, "num");
	String itemnum[] = request.getParameterValues("itemnum");
	boolean result = mgr.updatePoll(num, itemnum);
	String msg="��ǥ�� ��ϵ��� �ʾҽ��ϴ�.";
	if(result) msg = "��ǥ�Ͽ����ϴ�.";	
%>

<script>
	alert("<%=msg%>");
	location.href = "pollList.jsp?num=<%=num%>";
</script>