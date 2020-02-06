<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="tag" uri="/WEB-INF/tlds/ConnectionTag.tld"%>
<tag:db id="db"/>
<%
		Connection con = db.getConnection();
		String sql = "select id, name from tblMember";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
%>
			id : <%=rs.getString("id") %>, 
			name : <%=rs.getString("name") %><br/>
<%}%>