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
				/*항목의 체크버튼(fch)들이 배열이기에*/
			f.fch[i].checked = true;
		}
		f.btn.disabled = false;//버튼의 활성화
	}else{
		for(i=0;i<f.fch.length;i++){
			f.fch[i].checked = false;
		}
		f.btn.disabled = true;	//버튼의 비활성화			
	}
}
	function chk(){
		f=document.frm;
		for(i=1; i<f.fch.length;i++){
			//alert(f.fch[i].value);
			if(f.fch[i].checked){ //fch 체크박스가 체크가 된 경우
				f.btn.disabled = false;
			return; //밑에 있는 체크박스의 체크 유무는 무의미
			}
		}
		f.allCh.checked= false; //전체체크박스 해제
		f.btn.disabled = true; //버튼 비활성화
	}
	
	/* 다운로드를 받고자하는 파일명을 클릭하였을 때 
	해당하는 파일명을 가지고 downFrm으로 이동 */
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
<!-- 동일한 form에서 두개 이상의 같은 name값이 있어야 배열로 인식이 된다. 
name이 fch인 form이 두개이다, 배열로 인식이 된다.-->
<table border="1" width="300">
	<tr align="center">
		<td><input type="checkbox" name="allCh" onclick="allChk()"></td>
		<td>번호</td>
		<td>파일명</td>
		<td>파일크기</td>
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
		<!-- 다운로드 만들기 시작 하이퍼링크를 달아주었다.
		기능명:downFn 정해주었고 실행되도록 지정하였다.-->
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
<a href="fupload.jsp">입력폼</a>
</div>

<!-- 다운로드 폼 만들기 downFrm은 fdwonload.jsp로 가게 하였다.-->
<form name="downFrm" method="post" action="fdownload.jsp">
	<input type="hidden" name="upFile">
</form>

</body>
</html>






