<%@ page contentType="text/html;charset=EUC-KR"%>
<html>
<head>
<title>Simple Shopping Mall</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>

<body bgcolor="#996600" topmargin="100">

	<%@ include file="top.jsp"%>

	<table width="75%" align="center" bgcolor="#FFFF99">
		<tr>
			<td align="center" bgcolor="#FFFFCC">

				<table width="95%" align="center" bgcolor="#FFFF99" border="1">
					<form name="regForm" method="post" action="memberInsert.jsp">
						<tr align="center" bgcolor="#996600">
							<td colspan="3"><font color="#FFFFFF"><b>ȸ�� ����</b></font></td>
						</tr>
						<tr>
							<td width="16%">���̵�</td>
							<td width="57%"><input name="id" size="15"> <input
								type="button" value="ID�ߺ�Ȯ��"
								onClick="idCheck(this.form.id.value)"></td>
							<td width="27%">���̵� ���� �ּ���.</td>
						</tr>
						<tr>
							<td>�н�����</td>
							<td><input type="password" name="pwd" size="15"></td>
							<td>�н����带 �����ּ���.</td>
						</tr>
						<tr>
							<td>�н����� Ȯ��</td>
							<td><input type="password" name="repwd" size="15"></td>
							<td>�н����带 Ȯ���մϴ�.</td>
						</tr>
						<tr>
							<td>�̸�</td>
							<td><input name="name" size="15"></td>
							<td>���Ǹ��� �����ּ���.</td>
						</tr>
						<tr>
							<td>����</td>
							<td>��<input type="radio" name="gender" value="1" checked>
								��<input type="radio" name="gender" value="2">
							</td>
							<td>������ ���� �ϼ���.</td>
						</tr>
						<tr>
							<td>�������</td>
							<td><input name="birthday" size="6"> ex)830815</td>
							<td>������ϸ� ���� �ּ���.</td>
						</tr>
						<tr>
							<td>�̸���</td>
							<td><input name="email" size="27"></td>
							<td>�̸����� �����ּ���.</td>
						</tr>
						<tr>
							<td>�����ȣ</td>
							<td><input name="zipcode" size="5"> <input
								type="button" value="�����ȣã��" onClick="zipCheck()"></td>
							<td>�����ȣ�� �˻� �ϼ���.</td>
						</tr>
						<tr>
							<td>�ּ�</td>
							<td><input name="address" size="40"></td>
							<td>�ּҸ� ���� �ּ���.</td>
						</tr>
						<tr>
							<td>����</td>
							<td><select name=job>
									<option value="0" selected>�����ϼ���.</option>
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
							</select></td>
							<td>������ ���� �ϼ���.</td>
						</tr>
						<tr>
							<td>���</td>
							<td><input type="checkbox" name="hobby" value="���ͳ�" checked>���ͳ�
								<input type="checkbox" name="hobby" value="����">���� <input
								type="checkbox" name="hobby" value="����">���� <input
								type="checkbox" name="hobby" value="��ȭ">��ȭ <input
								type="checkbox" name="hobby" value="�">�</td>
							<td>����� ���� �ϼ���.</td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input type="button"
								value="ȸ������" onclick="inputCheck()"> &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; &nbsp; <input type="reset" value="�ٽþ���">
							</td>
						</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
	<%@ include file="bottom.jsp"%>
</body>
</html>