<!-- array1.jsp -->
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String arr[] = {"Java", "JSP", "Spring", "Android"};
		pageContext.setAttribute("arr", arr);
		//vector나 arraylist나 동일하게 적용됨 , 차이점은 동기화 유무
		ArrayList<String> arr1 = new ArrayList<String>();
		for(int i = 0; i<arr.length; i++){
			arr1.add(arr[i]);
		}
		pageContext.setAttribute("arr1", arr1);
%>
<b>프로그래밍 과목</b>
<hr width="250" align="left"/>
1.${arr[0]}, ${arr1[0]}<br/>
2.${arr[1]}, ${arr1[1]}<br/>
3.${arr[2]}, ${arr1[2]}<br/>
4.${arr[3]}, ${arr1[3]}<br/>
