<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, shop.*"%>
<jsp:useBean id="orderMgr" class="shop.OrderMgr" />
<jsp:useBean id="pMgr" class="shop.ProductMgr" />
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="top.jsp" %>
	<table width="75%" align="center" bgcolor="#FFFFFF">
	<tr> 
	<td align="center" bgcolor="#FFFFFF">

		<table width="95%" align="center" bgcolor="#FFFFFF" border="1">
		<tr  align="center" bgcolor="#FFFFFF"> 
		<td><font color= black>주문번호</font></td>
		<td><font color= black>주문자</font></td>
		<td><font color= black>제품</font></td>
		<td><font color= black>주문수량</font></td>
		<td><font color= black>주문날짜</font></td>
		<td><font color= black>주문상태</font></td>
		<td><font color= black>상세보기</font></td>
		</tr>
		<%
			Vector<OrderBean> vlist = orderMgr.getOrderList();
			if(vlist.isEmpty()){		
		%>
		<tr>
		<td align ="center" colspan="7">주문내역이 없습니다.</td>
		</tr>
		<%}else{ 
		for(int i=0; i<vlist.size(); i++){
		OrderBean order/* 주문정보 */ = vlist.get(i);
		ProductBean product /* 제품정보  */ = pMgr.getProduct(order.getProductNo());		
		%>
		<tr align ="center">
		<td><%=order.getNo() %></td>
		<td><%=order.getId() %></td>
		<td><%=product.getName() %></td>
		<td><%=order.getQuantity() %></td>
		<td><%=order.getDate() %></td>
		<td>
		<%
		switch(Integer.parseInt(order.getState())){
		/* switch는 int만 가능했는데 지금은 버전업으로인해 String값도 가능하다.  */
		case 1 : out.println("접수중");break;
		case 2 : out.println("접수");break;
		case 3 : out.println("입금확인");break;
		case 4 : out.println("배송준비");break;
		case 5 : out.println("배송중");break;
		default : out.println("완료");
	}	
		%>
		</td>
		<td><a href="javascript:orderDetail('<%=order.getNo()%>')">상세보기</a></td>
		</tr>
		<%
		}//--for
		}//--if
		
		%>
		</table>
	</td>
	</tr>
	</table>
	<%@ include file="bottom.jsp" %>
	<form name="detail" method="post" action="orderDetail.jsp" >
		<input type="hidden" name="no">
	</form>
</body>
</html>
