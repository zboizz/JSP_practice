<%@ page pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("idKey");
	
	String log="";
	if(id == null) log ="<a href=login.jsp>�α���</a>";
	else log = "<a href=logout.jsp>�α׾ƿ�</a>";

	String reg="";
	if(id == null) reg ="<a href=member.jsp>ȸ������</a>";
	else reg = "<a href=memberUpdate.jsp>ȸ������</a>";
%>
<table align="center" bgcolor="#080808" width="55%">
<tr bgcolor="#ffffff">
  <th width="50%" height="40%"
  style="background-image: url(data/data10.jpg);">
 WELCOME TO THE<br/>
  <span style="Font-size: 50pt; line-height: 200%; color: black;" id="spanTag" >�ܹ��� õ��</span><br/>
  (the HAMBURGER HEAVEN)
  </th>
  </tr>
</table>

<table width="50%" align="center" bgcolor="#080808" >
    <tr bgcolor="#ffffff"> 
    <th><%=log%></th>
    <th><%=reg%></th>
    <th><a href="productList.jsp">��ǰ���</a></th>
    <th><a href="cartList.jsp">��ٱ���</a></th>
    <th><a href="orderList.jsp">���Ÿ��</a></th>
  </tr>
</table>
