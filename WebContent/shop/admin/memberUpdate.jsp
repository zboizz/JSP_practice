<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,shop.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mMgr" class="shop.MemberMgr" />
<html>
<head>
<title>ȸ������</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#FFFFFF">
	<br>
	<%@ include file="top.jsp"%>
	<%
		String id = request.getParameter("id");
		MemberBean mBean = mMgr.getMember(id);
	%>
	<form name="regForm" method="post" action="memberUpdateProc.jsp">
		<table width="75%" align="center" bgcolor="#FFFFFF">
			<tr>
				<td align="center" bgcolor="#FFFFFF">
					<table width="95%" align="center" bgcolor="#FFFFFF" border="1">
						<tr align="center" bgcolor="#FFFFFF">
							<td colspan="3"><font color="#FFFFFF"><b> <%=mBean.getName()%>
										ȸ������ ������ �����մϴ�.
								</b></font></td>
						</tr>
						<tr>
							<td>���̵�</td>
							<td><%=mBean.getId()%></td>
						</tr>
						<tr>
							<td>�н�����</td>
							<td><input name="pwd" value="<%=mBean.getPwd()%>"></td>
						</tr>
						<tr>
							<td>�̸�</td>
							<td><input name="name" value="<%=mBean.getName()%>"></td>
						</tr>
						<tr>
							<td>����</td>
							<td>��<input type="radio" name="gender" value="1"
								<%=mBean.getGender().equals("1") ? "checked" : ""%>> ��<input
								type="radio" name="gender" value="2"
								<%=mBean.getGender().equals("2") ? "checked" : ""%>>
							</td>
						</tr>
						<tr>
							<td>�̸���</td>
							<td><input name="email" size="30"
								value="<%=mBean.getEmail()%>"></td>
						</tr>
						<tr>
							<td>�������</td>
							<td><input name="birthday" value="<%=mBean.getBirthday()%>"></td>
						</tr>
						<tr>
							<td>�����ȣ</td>
							<td><input name="zipcode" value="<%=mBean.getZipcode()%>">
								<input type="button" value="�����ȣã��" onClick="zipCheck()">
							</td>
						</tr>
						<tr>
							<td>�ּ�</td>
							<td><input name="address" size="50"
								value="<%=mBean.getAddress()%>"></td>
						</tr>
						<tr>
							<td>����</td>
							<td><select name="job">
									<option value="0">�����ϼ���.</option>
									<option value="ȸ���">ȸ���</option>
									<option value="����������">����������</option>
									<option value="�����л�">�����л�</option>
									<option value="�Ϲ��ڿ���">�Ϲ��ڿ���</option>
									<option value="������">������</option>
									<option value="�Ƿ���">�Ƿ���</option>
									<option value="������">������</option>
									<option value="����,���,������">����.���/������</option>
									<option value="��,��,����,������">��/��/����/������</option>
									<option value="�ֺ�">�ֺ�</option>
									<option value="����">����</option>
									<option value="��Ÿ">��Ÿ</option>
							</select> 
							<script>document.regForm.job.value="<%=mBean.getJob()%>"</script>
							</td>
						</tr>
						<tr>
							<td>���</td>
							<td>
								<%
									String list[] = { "���ͳ�", "����", "����", "��ȭ", "�" };
									String hobbys[] = mBean.getHobby();
									for (int i = 0; i < list.length; i++) {
										out.println("<input type=checkbox name=hobby ");
										out.println("value=" + list[i] + " " + (hobbys[i].equals("1") ? "checked" : "") + ">" + list[i]);
									}
								%>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="�����Ϸ�"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<input type="reset" value="�ٽþ���"></td>
						</tr>
						<input type="hidden" name="id" value="<%=id%>">
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="bottom.jsp"%>
</body>
</html>
