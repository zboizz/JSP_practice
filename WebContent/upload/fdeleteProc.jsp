<!-- fdeleteProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="upload.FileloadMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		//üũ�� fch���� ����
		String snum[]=request.getParameterValues("fch");
		//���ڿ� snum�� int�� �迭 ��ȯ, num�� ũ��� snum�� ũ��� ����
		int num[] = new int[snum.length];
		//���ڿ� �迭�� ������ �迭�� ��ȯ ���� ����(����)
		for(int i=0;i<num.length;i++){
			num[i] = Integer.parseInt(snum[i]);
		}
		mgr.deleteFile(num);
		response.sendRedirect("flist.jsp");
%>

