<!-- cartProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="order" class="shop.OrderBean"/>
<!-- 어떤 상품(productNo)을 누가(id) 몇개(quantity)를 사는가? -->
<jsp:setProperty property="*" name="order"/>
<%
		//quantity=3&productNo=3&flag=insert
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		if(id==null){ //로그인이 안된 상태
			response.sendRedirect("login.jsp");		
		}else{//로그인 상태
			String flag = request.getParameter("flag");
			String msg="";
			order.setId(id); //누가 주문했는지 주문객체에 id 저장
			//3가지의 경우가 존재: 장바구니에 insert, update, delete
			if(flag.equals("insert")){
				cMgr.addCart(order);
				msg = "장바구니에 담았습니다.";
			}else if(flag.equals("update")){
				cMgr.updateCart(order);
				msg = "장바구니를 수정하였습니다.";
			}else if(flag.equals("del")){
				cMgr.deleteCart(order);
				msg = "장바구니를 삭제하였습니다.";
			}
		%>
		<script>
		alert("<%=msg%>");
		location.href="cartList.jsp";
		</script>		
		<%} %>