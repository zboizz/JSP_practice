<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,shop.*"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mBean" class="shop.MemberBean" />
<jsp:setProperty name="mBean" property="*" />
<html>
<head>
<title>ȸ������ Ȯ��</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600">
	<br>

	<%@ include file="top.jsp"%>

	<table width="75%" align="center" bgcolor="#FFFF99">
		<tr>
			<td align="center" bgcolor="#FFFFCC">

				<table width="95%" align="center" bgcolor="#FFFF99" border="1">
					<form name="regForm" method="post" action="memberProc.jsp">
						<tr align="center" bgcolor="#996600">
							<td colspan="3"><font color="#FFFFFF"><b> <jsp:getProperty
											name="mBean" property="name" /> ȸ������ �ۼ��Ͻ� �����Դϴ�. Ȯ���� �ּ���
								</b></font></td>
						</tr>
						<tr>
							<td>���̵�</td>
							<td><input name="id"
								value="<jsp:getProperty name="mBean" property="id" />"></td>
						</tr>
						<tr>
							<td>�н�����</td>
							<td><input name="pwd"
								value="<jsp:getProperty name="mBean" property="pwd" />"></td>
						</tr>
						<tr>
							<td>�̸�</td>
							<td><input name="name"
								value="<jsp:getProperty name="mBean" property="name" />"></td>
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
							<td>�������</td>
							<td><input name="birthday"
								value="<jsp:getProperty name="mBean" property="birthday" />"></td>
						</tr>
					<tr>
						<td>�̸���</td>
						<td><input name="email" size="30"
							value="<jsp:getProperty name="mBean" property="email" />"></td>
					</tr>
					<tr>
						<td>�����ȣ</td>
						<td><input name="zipcode"
							value="<jsp:getProperty name="mBean" property="zipcode" />"></td>
					</tr>
					<tr>
						<td>�ּ�</td>
						<td><input name="address" size="50"
							value="<jsp:getProperty name="mBean" property="address" />"></td>
					</tr>
					<tr>
						<td>����</td>
						<td><input name="job"
							value="<jsp:getProperty name="mBean" property="job" />"></td>
					</tr>
					<tr>
						<td>���</td>
						<td>
							<%
								if (mBean.getHobby() != null) {
									String list[] = {"���ͳ�", "����", "����", "��ȭ", "�"}; 
									String hobbys[] = mBean.getHobby();

									for (int i = 0; i < hobbys.length; i++) {
										out.print("<input type=checkbox name=hobby" + " checked value=" + hobbys[i] + ">" + hobbys[i]);
									}
								} else {
									out.println("���õ� ��̰� �����ϴ�.");
								}
							%>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Ȯ�οϷ�"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input
							type="button" value="�ٽþ���" onClick="history.back()"></td>
					</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
	<%@ include file="bottom.jsp"%>
</body>
</html>