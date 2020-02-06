<!-- cartProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="order" class="shop.OrderBean"/>
<!-- � ��ǰ(productNo)�� ����(id) �(quantity)�� ��°�? -->
<jsp:setProperty property="*" name="order"/>
<%
		//quantity=3&productNo=3&flag=insert
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		if(id==null){ //�α����� �ȵ� ����
			response.sendRedirect("login.jsp");		
		}else{//�α��� ����
			String flag = request.getParameter("flag");
			String msg="";
			order.setId(id); //���� �ֹ��ߴ��� �ֹ���ü�� id ����
			//3������ ��찡 ����: ��ٱ��Ͽ� insert, update, delete
			if(flag.equals("insert")){
				cMgr.addCart(order);
				msg = "��ٱ��Ͽ� ��ҽ��ϴ�.";
			}else if(flag.equals("update")){
				cMgr.updateCart(order);
				msg = "��ٱ��ϸ� �����Ͽ����ϴ�.";
			}else if(flag.equals("del")){
				cMgr.deleteCart(order);
				msg = "��ٱ��ϸ� �����Ͽ����ϴ�.";
			}
		%>
		<script>
		alert("<%=msg%>");
		location.href="cartList.jsp";
		</script>		
		<%} %>