<%@page import="ch07.TeamBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		Vector<TeamBean> tlist = mgr.printTeam();
		String teamList[] = mgr.readTeamName();
		out.println(tlist.size());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	<!--check()�� ���� üũ�ϴ� ���-->
	function check() {
		f = document.frm;
		if(f.name.value.length==0){
			alert("�̸��� �Է��ϼ���.");
			f.name.focus();
			return;
		}
		if(f.city.value.length==0){
			alert("��°��� �Է��ϼ���.");
			f.city.focus();
			return;
		}
		if(f.age.value.length==0){
			alert("���̸� �Է��ϼ���.");
			f.age.focus();
			return;
		}
		if(f.team.value.length==0){
			alert("������ �Է��ϼ���.");
			f.team.focus();
			return;
		}
		f.submit();
	}
	
	function listSelect() {
			f = document.frm;
			tl = f.teamList;
			f.team.value = tl.options[tl.selectedIndex].value;
		}
		
	
</script>
</head>
<body>
<div align="center">
<h1>Team Post</h1>
<!-- form�̶�� ���� ������ ������ �ʴ� ��. ������ form�� table���� ���� �ۼ��Ǿ�� �Ѵ�. -->
<form name="frm" method="post" action="teamPostProc.jsp">
<!-- action: "teamPostProc" ���� ������ �����صξ���. �ڿ� Proc�� ������ ������ ����� �ִ� ������ -->
<table border="1">
<tr>
	<td width="50" align="center">�̸�</td>
	<td width="150"><input name="name" value="ȫ�浿"></td>
</tr>
<tr>
	<td align="center">��°�</td>
	<td><input name="city" value="�λ�"></td>
</tr>
<tr>
	<td align="center">����</td>
	<td ><input name="age" value="27"></td>
</tr>


<tr>
	<td align="center">����</td>
	<td><input name="team" size="10">
		    <select name="teamList" onchange="listSelect()">
		    	<option value="">�����Է�</option>
		    	<%for(int i=0;i<teamList.length;i++){ %>
		    	<option value="<%=teamList[i]%>"><%=teamList[i]%></option>
		    	<%} %>
		    </select>
	</td>
</tr>


<tr>
	<td align="center" colspan="2">
		<input type="button" value="SAVE" onclick="check()">
		<input type="button" value="SAVE2" onclick="check2()">
	</td>
</tr>
</table><p/>
<a href="teamList.jsp">LIST</a>
</form>
</div>
</body>
</html>