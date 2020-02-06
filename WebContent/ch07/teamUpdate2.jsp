<!-- teamUpdate2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bean" scope="session" class="ch07.TeamBean"/>

<!-- 
번호: <%=bean.getNum() %><br/>
이름: <%=bean.getName() %><br/>

객체 생성하기전에 session 검색한다. 동일한 id(key)값을 가진 객체가 있다면
생성을 하지 않고 참조를 한다. teamRead에서 사용한 문구를 통해 세션에 저장되어 있는
데이터를 그대로 사용할 수 있다.

@teamRead-16행
#세션에 bean 키값으로 bean 객체를 저장
session.setAttribute("bean",bean); 

#scope
page(default) 
request(a와 b 페이지간의)
session()
application
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
<h1>Team Update2</h1>
<form method="post" action="teamUpdateProc.jsp">
<table border="1">
<tr>
	<td width="50" align="center">번호</td>
	<td width="150">
		<input name="num" readonly value="<%=bean.getNum()%>">
	</td>
</tr>
<tr>
	<td  align="center">이름</td>
	<td>
		<input name="name" value="<%=bean.getName()%>">
	</td>
</tr>
<tr>
	<td align="center">사는곳</td>
	<td>
		<input name="city" value="<%=bean.getCity()%>">
	</td>
</tr>
<tr>
	<td align="center">나이</td>
	<td >
		<input name="age" value="<%=bean.getAge()%>">
	</td>
</tr>
<tr>
	<td align="center">팀명</td>
	<td>
		<input name="team" value="<%=bean.getTeam()%>">
	</td>
</tr>	
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="UPDATE">
	</td>
</tr>
</table><p/>
</form>
<a href="teamRead.jsp?num=<%=bean.getNum()%>">READ</a>
</div>
</body>
</html>