<!-- fmtTags3.jsp  -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="num" value="12345678"/>

숫자 : <fmt:formatNumber value="${num}" type="number"/><br/>
퍼센트 : <fmt:formatNumber value="${num}" type="percent" groupingUsed="true"/><br/>
달러 : <fmt:formatNumber value="${num}" type="currency" currencySymbol="$"/><br/>
패턴 : <fmt:formatNumber value="${num}" pattern="0.0000" groupingUsed="false"/><br/>
<fmt:parseNumber var="i" integerOnly="true" value="123,456"/>
실수를 제외한 정수 : <c:out value="${i}"/>