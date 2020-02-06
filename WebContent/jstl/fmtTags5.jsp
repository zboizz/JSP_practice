<!-- fmtTags5.jsp -->
<%@page import="java.util.Date"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setBundle var="note" basename="jstl.note"/>
<fmt:message bundle="${note}" key="country"/><br/>
<fmt:message bundle="${note}" key="siteName"/><br/>
<fmt:message bundle="${note}" key="msg">
	<fmt:param value="${param.msg}"/>
</fmt:message>














