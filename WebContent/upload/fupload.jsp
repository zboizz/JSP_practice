<!-- fupload.jsp  -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if(document.forms[0].upFile.value==0){
			alert("������ �����ϼ���.");
			return;
		}
		document.forms[0].submit();
	}
</script>
</head>
<body>
<div align="center">
<h2>File Upload</h2>
<form method="post" enctype="multipart/form-data" action="fuploadProc.jsp">
<table border="1">
 <tr>
 	<td>���ϼ���</td>
 	<td><input type="file" name="upFile"></td>
 </tr>
 <tr>
 	<td colspan="2">
 		<input type="button" value="���Ͼ��ε�" onclick="check()">
 	</td>
 </tr>
</table>
</form><p/>
<a href="flist.jsp">���ϸ���Ʈ</a>
</div>
</body>
</html>