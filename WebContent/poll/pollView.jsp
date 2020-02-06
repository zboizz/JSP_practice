<!--  pollView.jsp -->
<%@page import="java.util.Random"%>
<%@page import="poll.PollItemBean"%>
<%@page import="java.util.Vector"%>
<%@page import="poll.PollListBean"%>
<%@page import="poll.MyUtil"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="poll.PollMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int num = MyUtil.parseInt(request, "num");
		PollListBean plBean = mgr.getPollRead(num);
		String question = plBean.getQuestion();
		Vector<PollItemBean> vlist = mgr.getView(num);
		//현재 설문지에서의 총 투표수
		int sumCnt = mgr.sumCount(num);		
		Random r = new Random(); //랜덤객체를 만든다.
		int maxCnt = mgr.getMaxcount(num);		
%>
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#D5D5D5">
<div align="center"><br/>
<h2>투표 결과</h2>
<table border="1" width="400">
	<tr>
		<td colspan="4">
		<b>Q :<%=question%> </b>	
		</td>
	</tr>
	<tr>
		<td colspan="3">
		<b>총 투표자 :<%=sumCnt%> </b>	
		</td>
		<td width="40"><b>count(%)</b></td>
	</tr>
<%
			for(int i=0;i<vlist.size();i++){
				PollItemBean piBean = vlist.get(i);
				String item[] = piBean.getItem();
				int count = piBean.getCount();
				int ratio = new Double(Math.round((double)
						count/sumCnt*100)).intValue();
				String rgb = "#"+
					Integer.toHexString(r.nextInt(255*255*255));
	%>
	<tr>
		<td width="20" align="center"><%=i+1%></td>
		<td width="120">
			<%if(maxCnt==count){%><font color="red"><b><%}%>
				<%=item[0]%>
			<%if(maxCnt==count){%></b></font><%}%>
		</td>
		<td style="background-color:black;">
			<table width="<%=ratio%>">
				<tr>
					<td bgcolor="<%=rgb%>" height="15"><%=ratio%>%</td>
				</tr>
			</table>
		</td>
		<td width="40" align="center"><%=count%>(<%=ratio%>%)</td>
	</tr>	
	<%}//---for%>
</table><br/>
<a href="javascript:window.close()">닫기</a>
</div>
</body>
</html>