<!-- coreTags1.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- prefix�� �ۼ��Ҷ� core�� ��쿡�� ���������� c �� ��� -->
<%
		request.setCharacterEncoding("EUC-KR");
		String str1 = "Java�� JSTL";
		String str2 = null;		
%>
<h2>Core Tags1</h2>
<!-- 4���� ����ҿ� ������ ���� -->
<c:set var="str3" value="JSPStudy" scope="page"/>
<c:set var="str4" value="JSTL" scope="session"/>
<!-- ������ ��� -->
- <c:out value="<%=str1%>" default="�⺻��°�"/><br/>
- <c:out value="<%=str2%>" default="�⺻��°�"/><br/>

<!-- ������ ����ҿ��� ���� -->
<c:remove var="str4"/>
<%String s = (String)pageContext.getAttribute("str3");%>
<font color="red">-<%=s%></font>