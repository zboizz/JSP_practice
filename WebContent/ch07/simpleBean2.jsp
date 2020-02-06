<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>

<!-- SimpleBean 객체 생성 -->
<jsp:useBean id = "bean" class="ch07.SimpleBean"/>
<!-- SimpleBean bean = new SimpleBean(); -->

<!-- 요청된 msg값을 받고 받은 값을 빈즈에 저장 -->
<!--<jsp:setProperty property="msg" name="bean"/>-->
<jsp:setProperty property="*" name="bean"/>
<!-- String msg = request.getParameter("msg");
bean.setMsg(msg); 
10개라면 10개의 문장을 써야하는데 위의 한줄로 모든 자료에 사용할 수 있다.-->

msg2 : <jsp:getProperty property="msg" name="bean"/><br/>
cnt2: <jsp:getProperty property="cnt" name="bean"/><br/>
msg2 : <%=bean.getMsg() %><br/>

