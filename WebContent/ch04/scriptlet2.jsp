<!-- scriptlet2.jsp -->
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 response.setCharacterEncoding("EUC-KR");
 float f = 2.3f;
 int i = Math.round(f);
 Date d = new Date();
%>
�Ǽ� f�ݿø���? <%=i%><br/>
������ ��¥�� �ð���? <%=d.toString()%><br/>
    
