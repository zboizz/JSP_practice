<!-- if.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// jsp templates���� ����
	// if.html�� ��û�� ���� ���� ���ڵ��� EUC-KR�� �����϶�. �׷��� �ѱ��� �� ����
	request.setCharacterEncoding("EUC-KR");
	// if.html���� name�� color ������. (�Ű������� �������� �ݵ�� form�� name���� ��ġ�ؾ���. ������)
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String msg = null;
	
	if(color.equals("blue")){
		msg="�Ķ���";
	}else if(color.equals("red")){
		msg="������";
	}else if(color.equals("orange")){
		msg="��������";
	}else{
		msg="��Ÿ";
		color="white";
	}
%>
<body bgcolor="<%=color%>">
<%=name%>���� �����ϴ� ������ <%=msg%>�Դϴ�.
</body>