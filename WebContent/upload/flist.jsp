<!-- flist.jsp -->
<%@page import="upload.UtilMgr"%>
<%@page import="upload.FileloadBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="upload.FileloadMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		Vector<FileloadBean> vlist = mgr.listFile();
%>

<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function allChk() {
	f= document.frm;
	if(f.allCh.checked){
		for(i=0;i<f.fch.length;i++){
				/*�׸��� üũ��ư(fch)���� �迭�̱⿡*/
			f.fch[i].checked = true;
		}
		f.btn.disabled = false;//��ư�� Ȱ��ȭ
	}else{
		for(i=0;i<f.fch.length;i++){
			f.fch[i].checked = false;
		}
		f.btn.disabled = true;	//��ư�� ��Ȱ��ȭ			
	}
}
	function chk(){
		f=document.frm;
		for(i=1; i<f.fch.length;i++){
			//alert(f.fch[i].value);
			if(f.fch[i].checked){ //fch üũ�ڽ��� üũ�� �� ���
				f.btn.disabled = false;
			return; //�ؿ� �ִ� üũ�ڽ��� üũ ������ ���ǹ�
			}
		}
		f.allCh.checked= false; //��üüũ�ڽ� ����
		f.btn.disabled = true; //��ư ��Ȱ��ȭ
	}
	
	/* �ٿ�ε带 �ް����ϴ� ���ϸ��� Ŭ���Ͽ��� �� 
	�ش��ϴ� ���ϸ��� ������ downFrm���� �̵� */
	function downFn(upFile){
		df=document.downFrm;
		df.upFile.value=upFile;
		df.submit();
	}	
</script>
</head>
<body>
<div align="center">
<h2>File List</h2>
<form name="frm" action="fdeleteProc.jsp">
<input type="hidden" name="fch" value="0">
<!-- ������ form���� �ΰ� �̻��� ���� name���� �־�� �迭�� �ν��� �ȴ�. 
name�� fch�� form�� �ΰ��̴�, �迭�� �ν��� �ȴ�.-->
<table border="1" width="300">
	<tr align="center">
		<td><input type="checkbox" name="allCh" onclick="allChk()"></td>
		<td>��ȣ</td>
		<td>���ϸ�</td>
		<td>����ũ��</td>
	</tr>
	<%
	for(int i=0;i<vlist.size();i++){
		FileloadBean bean = vlist.get(i);
		int num = bean.getNum();
		String upFile = bean.getUpFile();
		int size = bean.getSize();
	%>
	<tr align="center">
		<td><input type="checkbox" name="fch" value="<%=num%>" onclick="chk()"></td>
		<td><%=i+1%></td>
		<!-- �ٿ�ε� ����� ���� �����۸�ũ�� �޾��־���.
		��ɸ�:downFn �����־��� ����ǵ��� �����Ͽ���.-->
		<td><a href="javascript:downFn('<%=upFile%>')">
		<%=upFile %></a></td>		
		
		<td><%=UtilMgr.monFormat(size)%>byte</td>
	</tr>
	<%}//---for%>
	<tr>
		<td colspan="4">
			<input type="submit" name="btn" value="DELETE" disabled>
		</td>
	</tr>
</table>
</form><p>
<a href="fupload.jsp">�Է���</a>
</div>

<!-- �ٿ�ε� �� ����� downFrm�� fdwonload.jsp�� ���� �Ͽ���.-->
<form name="downFrm" method="post" action="fdownload.jsp">
	<input type="hidden" name="upFile">
</form>

</body>
</html>






