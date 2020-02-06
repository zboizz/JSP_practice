<!-- zipSearch.jsp -->
<%@page import="member.zipCodeBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		//�˻��� �ƴϰ� â�� open������ search�� n�̰� �˻��϶��� y
		String search = request.getParameter("search");	
		Vector<zipCodeBean> vlist = null;
		String area3=null;
		if(search.equals("y")){
			area3 = request.getParameter("area3");
			vlist = mgr.zipcodeRead(area3);
			out.print(vlist.size());	
		}
		
%>

<html>
<head>
<title>�����ȣ �˻�</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function loadSearch() {
		frm = document.zipFrm;
		if(frm.area3.value==""){
			alert("���θ��� �Է��ϼ���.");
			return;
		}
		frm.action = "zipSearch.jsp";
		frm.submit();
	}
	<!--�˻��� ����� �����ȣ�� ���ּҷ� ���� ���̾� �ԷµǴ� ���-->
	function sendAdd(zipcode, adds) {
		opener.document.regFrm.zipcode.value = zipcode;
		opener.document.regFrm.address.value = adds;
		self.close();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<form name="zipFrm" method="post">
			<table>
				<tr>
					<td>
					<br/>���θ� �Է� : 	<input name="area3">
						<input type="button" value="�˻�" 
						onclick="loadSearch()">
					</td>
				</tr>				
				<% 
				if(search.equals("y")){
						if(vlist.isEmpty()){
						%>							
				<tr>
					<td align="center"><br/>�˻��� ����� �����ϴ�.</td>
				</tr>
				<%}else{%>
				<tr>
					<td align="center"><br/>�ذ˻� ��, �Ʒ� �����ȣ�� Ŭ���ϸ� �ڵ����� �Էµ˴ϴ�.</td>
				</tr>
				<%
					for(int i=0; i<vlist.size(); i++){
						zipCodeBean bean = vlist.get(i);
						String zipcode = bean.getZipcode();
						String adds = bean.getArea1()+" ";
						adds+=bean.getArea2()+" ";
						adds+=bean.getArea3()+" ";
						%>
					<tr>
					<td><a href="#" onclick="sendAdd('<%=zipcode%>','<%=adds%>')">
					<%=zipcode+" "+adds%></a></td>
				</tr>
					<%
					}//--for				
				} //--if 1 
				} //--if 2
				%>
				<tr>
					<td align="center"><br/>
					<a href="#" onClick="self.close()">�ݱ�</a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
		</form>
	</div>
</body>
</html>