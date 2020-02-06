<%@ page pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("idKey");
	
	String log="";
	if(id == null) log ="<a href=login.jsp>로그인</a>";
	else log = "<a href=logout.jsp>로그아웃</a>";

	String reg="";
	if(id == null) reg ="<a href=member.jsp>회원가입</a>";
	else reg = "<a href=memberUpdate.jsp>회원수정</a>";
%>
<table align="center" bgcolor="#080808" width="55%">
<tr bgcolor="#ffffff">
  <th width="50%" height="40%"
  style="background-image: url(data/data10.jpg);">
 WELCOME TO THE<br/>
  <span style="Font-size: 50pt; line-height: 200%; color: black;" id="spanTag" >햄버거 천국</span><br/>
  (the HAMBURGER HEAVEN)
  </th>
  </tr>
</table>

<table width="50%" align="center" bgcolor="#080808" >
    <tr bgcolor="#ffffff"> 
    <th><%=log%></th>
    <th><%=reg%></th>
    <th><a href="productList.jsp">상품목록</a></th>
    <th><a href="cartList.jsp">장바구니</a></th>
    <th><a href="orderList.jsp">구매목록</a></th>
  </tr>
</table>
