<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="bean" class="el.ELBean"/>
<jsp:setProperty property="siteName" name="bean"/>

����׼��±� : <jsp:getProperty property="siteName" name="bean"/><br/> 
ǥ���� : <%=bean.getSiteName()%><br/>
EL��� : ${bean.siteName}