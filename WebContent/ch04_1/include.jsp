<!-- include.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@include file = "top.jsp"%>
include 지시자의 body부분입니다.
메세지: <%=msg %>
<%@include file = "bottom.jsp"%>

<!-- 
work파일에 top과 bottom은 저장되지않고 include파일만 남는다.
그 이유는 include파일이 불러옴으로써 포함되어지기 때문  -->