<%@ page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:catch var="ex">
	<%
		int arr[] = {1,2,3};
		int sum = arr[0] + arr[1] + arr[2] + arr[3];
	%>
</c:catch>
${ex}