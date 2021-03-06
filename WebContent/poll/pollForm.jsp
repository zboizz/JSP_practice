<!-- pollForm.jsp -->
<%@page import="poll.PollListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="poll.MyUtil"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="poll.PollMgr"/>

<%
	request.setCharacterEncoding("EUC-KR");
	int num=0;
	if(request.getParameter("num")!=null){
		num=MyUtil.parseInt(request, "num");
	}
	PollListBean plBean = mgr.getPollRead(num);
	//질문
	Vector<String> vlist = mgr.getItem(num);
	//항목들
	String question = plBean.getQuestion();
	int type = plBean.getType();
	int active = plBean.getActive();
	int sumCount = mgr.sumCount(num); //현재 설문의 총 투표수
	
%>
<link href="style.css" rel="stylesheet" type="text/css">
<form action="pollFormProc.jsp">
<table border="1">
	<tr>
		<td colspan="2" width="300">Q : <%=question%> 
		<font color="blue">(<%=sumCount %>)</font></td>
	</tr>
	<tr>
		<td style="text-align:left;" colspan="2">
<%
	for(int i=0; i<vlist.size();i++){
		String item = vlist.get(i); //elementAt
		%>
		<%if(type==1){ %>
		<input type="checkbox" name="itemnum" value="<%=i%>">
		<%}else{ %>
		<input type="radio" name="itemnum" value="<%=i%>">
		<%} %>
		<%=item%><br/>
	<%}//--for%>
		</td>
	</tr>
	<tr>
		<td width="150">
			<%if(active==1){ %>
			<input type="submit" value="투표">
			<%}else{ %>
			투표종료
			<%}%>
		</td>
		<td width="150">
			<input type="button" value="결과" 
			onclick="javascript:window.open('pollView.jsp?num=<%=num%>'
			,'pollView','width=650, height=550')">
		</td>
	</tr>
</table>
<input type="hidden" name="num" value="<%=num%>">
</form>