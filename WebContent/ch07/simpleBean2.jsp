<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>

<!-- SimpleBean ��ü ���� -->
<jsp:useBean id = "bean" class="ch07.SimpleBean"/>
<!-- SimpleBean bean = new SimpleBean(); -->

<!-- ��û�� msg���� �ް� ���� ���� ��� ���� -->
<!--<jsp:setProperty property="msg" name="bean"/>-->
<jsp:setProperty property="*" name="bean"/>
<!-- String msg = request.getParameter("msg");
bean.setMsg(msg); 
10����� 10���� ������ ����ϴµ� ���� ���ٷ� ��� �ڷῡ ����� �� �ִ�.-->

msg2 : <jsp:getProperty property="msg" name="bean"/><br/>
cnt2: <jsp:getProperty property="cnt" name="bean"/><br/>
msg2 : <%=bean.getMsg() %><br/>

