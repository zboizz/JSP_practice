<!-- fmtTags3.jsp  -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="num" value="12345678"/>

���� : <fmt:formatNumber value="${num}" type="number"/><br/>
�ۼ�Ʈ : <fmt:formatNumber value="${num}" type="percent" groupingUsed="true"/><br/>
�޷� : <fmt:formatNumber value="${num}" type="currency" currencySymbol="$"/><br/>
���� : <fmt:formatNumber value="${num}" pattern="0.0000" groupingUsed="false"/><br/>
<fmt:parseNumber var="i" integerOnly="true" value="123,456"/>
�Ǽ��� ������ ���� : <c:out value="${i}"/>