<!-- scope1.jsp  -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	int sum = 0;
	for(int i=1; i<11; i++){
		sum+=i;
	}
	request.setAttribute("sum", sum); 
	//sum�̶�� �̸����� sum���� �ְڴ�.
	//auto boxing ����		
%>
<jsp:forward page ="scope2.jsp"/>