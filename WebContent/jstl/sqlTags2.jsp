<!-- sqlTags2.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<h2>SQL Tag2</h2>
<sql:update dataSource="${db}">
	update tblMember set name =? where id=?
	<sql:param value="${'동호강'}"/>
	<sql:param value="${'aaa'}"/>
</sql:update>
업데이트 하였습니다.
<a href="sqlTags1.jsp">SELECT</a>










