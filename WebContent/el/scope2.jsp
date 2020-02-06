<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		//공통메소드: setAttribute, getAttribute
		pageContext.setAttribute("msg","경자년 새해 복 많이 받으세요.");
%>
msg : ${pageScope.msg}<br/>
msg : ${msg}<br/>
sum : <%=request.getAttribute("sum")%><br/>
sum : ${requestScope.sum}<br/>