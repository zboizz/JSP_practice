<!-- scope1.jsp  -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	int sum = 0;
	for(int i=1; i<11; i++){
		sum+=i;
	}
	request.setAttribute("sum", sum); 
	//sum이라는 이름으로 sum값을 넣겠다.
	//auto boxing 저장		
%>
<jsp:forward page ="scope2.jsp"/>