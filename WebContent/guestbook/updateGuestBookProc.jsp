<!-- updateGuestBookProc.jsp -->

<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="bean" class="guestbook.GuestBookBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
		if(bean.getSecret()==null){
			bean.setSecret("0");
		}
		mgr.updateGuestBook(bean);
		//â�� ������ showGuestBook.jsp�� ���ΰ�ħ
%>
<script type="text/javascript">
	opener.location.reload(); //showGuestBook.jsp�� ���ΰ�ħ
	self.close();
</script>
