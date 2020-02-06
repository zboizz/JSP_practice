<%@page import="ch07.TeamBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<jsp:useBean id="mgr" class="ch07.TeamMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		Vector<TeamBean> vlist = mgr.listTeam();
		//out.println(vlist.size());
		//벡터값이 제대로 전달되는지 확인하기 위해서
		//vlist.size를 출력해본다. (결과값 5가 나옴)		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">

<body>
<div align = "center">
<h1>TEAM LIST</h1>
<table border = "1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>사는곳</th>
			<th>나이</th>
			<th>팀명</th>
		</tr>
		<% 
			for(int i=0; i<vlist.size();i++){
				//Vector에 저장된 TeamBean 객체를 반환
				TeamBean bean = vlist.get(i);
				int num = bean.getNum();			
		%>
		<tr align='center'>
<!-- 번호에 하이퍼링크를 달아서 teamRead.jsp로 이동하게끔 만듦 -->
		<td><a href="teamRead.jsp?num=<%=num%>">
		<%=i+1%></a></td>		
		<td><%=bean.getName()%></td>
		<td><%=bean.getCity()%></td>
		<td><%=bean.getAge()%></td>
		<td><%=bean.getTeam()%></td>				
		</tr>		
		<%}//---for %>
		
				
</table><p/>
<a href="teamPost.html">POST</a>
</div>
</body>
</html>










