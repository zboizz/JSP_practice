<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		//����޼ҵ�: setAttribute, getAttribute
		pageContext.setAttribute("msg","���ڳ� ���� �� ���� ��������.");
%>
msg : ${pageScope.msg}<br/>
msg : ${msg}<br/>
sum : <%=request.getAttribute("sum")%><br/>
sum : ${requestScope.sum}<br/>