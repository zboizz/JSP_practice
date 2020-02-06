<!-- fmtTags4.jsp  -->
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dayTime" value="<%=new Date()%>"/>

��¥ : <fmt:formatDate value="${dayTime}" type="date" dateStyle="full"/><br/>
�ð� : <fmt:formatDate value="${dayTime}" type="time"/><br/>

<fmt:timeZone value="Asia/Hong_Kong">
ȫ�� : <fmt:formatDate value="${dayTime}" type="both" dateStyle="full"/><br/>
</fmt:timeZone>

<fmt:timeZone value="Europe/LONDON">
���� : <fmt:formatDate value="${dayTime}" type="both" dateStyle="full"/><br/>
</fmt:timeZone>

<fmt:timeZone value="America/New_York"> 
���� : <fmt:formatDate value="${dayTime}" type="both" dateStyle="full" /><br/>
</fmt:timeZone>

<fmt:timeZone value="Europe/Berlin"> 
������ : <fmt:formatDate value="${dayTime}" type="both" dateStyle="full" timeStyle="full"/><br/>
</fmt:timeZone>

