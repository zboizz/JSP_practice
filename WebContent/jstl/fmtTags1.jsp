<!-- fmtTags1.jsp  -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Locale ���� ko�� �����ڵ�, kr�� ����ڵ��̴�. -->
<fmt:setLocale value="ko_kr"/>
<fmt:requestEncoding value="EUC-KR"/>

name: ${param.name}

<form method="post">
	name: <input name="name" value="ȫ�浿">
	<input type = "submit">
</form>