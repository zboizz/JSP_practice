<!-- pageView.jsp -->
<%@page import="board.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		int totalRecord = UtilMgr.parseInt(request, "totalRecord");//�ѰԽù� ����
		int numPerPage = 10;//�������� ���ڵ� ���� (5,10,15,30)
		int pagePerBlock = 15;//���� ������ ����
		int totalPage = 0;//�� ������ ����
		int totalBlock = 0;//�� �� ����
		int nowPage = 1;//���� ������
		int nowBlock = 1;//���� ��
		
		int start = 0;//���̺� ���� ��ȣ
		
		//nowPage�� ��û�� ���
		if(request.getParameter("nowPage")!=null){
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		//���̺� ���� ��ȣ
		start = (nowPage*numPerPage)-numPerPage;
		
		 totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		 nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
		
%>
<html>
<head>
	<title>����¡ & �� ó�� �׽�Ʈ</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function block(block) {
		document.readFrm.nowPage.value = 
			<%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();	
	}
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();	
	}
</script>
<body bgcolor="#FFFFCC">
<div align="center"><br/>
<h2>����¡ & �� ó�� �׽�Ʈ</h2>
<table>
	<tr>
		<td  width="700" align="center">
		Total : <%=totalRecord%>Articles(
		<font color="red"><%=nowPage+"/"+totalPage%>Pages</font>
		)
		</td>
	</tr>
</table>
<table>
	<tr>
		<td>�Խù� ��ȣ : &nbsp;</td>
		<%
				int listSize = totalRecord-start;
				for(int i=0;i<numPerPage;i++){
					if(i==listSize) break;
		%>
		<td align="center">
			<%=totalRecord-start-i%>&nbsp;
		</td>	
		<%}//---for%>
	</tr>
</table>
<!-- ����¡ �� �� Start -->
<table>
	<tr>
		<td>
		<%if(totalPage>0){ %>
			<!-- ���� �� -->
			<%if(nowBlock>1){%>
				<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
			<%}%>
			<!-- ����¡ -->
			<% 
					int pageStart = (nowBlock-1)*pagePerBlock+1;
					int pageEnd = (pageStart+pagePerBlock)<totalPage?
							pageStart+pagePerBlock:totalPage+1;
					for(;pageStart<pageEnd;pageStart++){
			%>
				<a href="javascript:pageing('<%=pageStart%>')">
				<%if(pageStart==nowPage){%><font color="red"><%}%>
					[<%=pageStart%>]
				<%if(pageStart==nowPage){%></font><%}%>
				</a>
			<%}//---for%>
			<!-- ���� �� -->
			<%if(totalBlock>nowBlock){%>
				<a href="javascript:block('<%=nowBlock+1%>')">...next</a>
			<%}%>
		<%}%>
		</td>
	</tr>
</table>
<form name="readFrm">
	<input type="hidden" name="totalRecord" value="<%=totalRecord%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
</form>
<!-- ����¡ �� �� End -->
<hr width="60%"/>
<b>
totalRecord : <%=totalRecord%>&nbsp;
numPerPage : <%=numPerPage%>&nbsp;
pagePerBlock : <%=pagePerBlock%>&nbsp;
totalPage : <%=totalPage%>&nbsp;<br/>
totalBlock : <%=totalBlock%>&nbsp;
nowPage : <%=nowPage%>&nbsp;
nowBlock : <%=nowBlock%>&nbsp;
start : <%=start%>&nbsp;
</b>
<p/>
<input type="button" value="TotalRecord �Է���"
 onClick="javascript:location.href='pageView.html'">
</div>
</html>