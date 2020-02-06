<!-- fmtTags4.jsp  -->
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dayTime" value="<%=new Date()%>"/>

³¯Â¥ : <fmt:formatDate value="${dayTime}" type="date" dateStyle="full"/><br/>
½Ã°£ : <fmt:formatDate value="${dayTime}" type="time"/><br/>

<fmt:timeZone value="Asia/Hong_Kong">
È«Äá : <fmt:formatDate value="${dayTime}" type="both" dateStyle="full"/><br/>
</fmt:timeZone>

<fmt:timeZone value="Europe/LONDON">
·±´ø : <fmt:formatDate value="${dayTime}" type="both" dateStyle="full"/><br/>
</fmt:timeZone>

<fmt:timeZone value="America/New_York"> 
´º¿å : <fmt:formatDate value="${dayTime}" type="both" dateStyle="full" /><br/>
</fmt:timeZone>

<fmt:timeZone value="Europe/Berlin"> 
º£¸¦¸° : <fmt:formatDate value="${dayTime}" type="both" dateStyle="full" timeStyle="full"/><br/>
</fmt:timeZone>

