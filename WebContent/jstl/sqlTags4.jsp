<!-- sqlTags1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource url="jdbc:mysql://127.0.0.1:3306/mydb?useUnicode=true&characterEncoding=EUC_KR" 
 driver="org.gjt.mm.mysql.Driver"
 user="root"
 password="1234"
 var="db"
 scope="application"/>
 
<h2>SQL Tag2</h2>
<sql:update dataSource="${db}">
	update tblMember set name =? where id=?
	<sql:param value="${param.name}"/>
	<sql:param value="${param.id}"/>
</sql:update>
업데이트 하였습니다.
<c:redirect url="sqlTags3.jsp"/>











