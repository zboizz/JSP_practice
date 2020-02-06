<!-- fmtTags1.jsp  -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Locale 지정 ko는 국가코드, kr은 언어코드이다. -->
<fmt:setLocale value="ko_kr"/>
<fmt:requestEncoding value="EUC-KR"/>

name: ${param.name}

<form method="post">
	name: <input name="name" value="홍길동">
	<input type = "submit">
</form>