<%@ page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="tag" uri="/WEB-INF/tlds/PageTag.tld" %>
<%
		int start = 1;
        int end = 10;
        int nowPage = 1;
        if(request.getParameter("nowPage")!=null){
        	nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }
%>
<h1>속성값이 있는 태그 만들기</h1>
현재 페이지는 <b><%=nowPage %></b>
<font color="red">
<tag:page from="<%=start%>" to="<%=end%>"/>
</font>
