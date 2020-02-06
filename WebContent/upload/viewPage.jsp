<!-- viewPage.jsp -->
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		final String saveFolder = "C:/JSP/myapp/WebContent/upload/filestorage";
		final String encoding = "EUC-KR";
		final int maxSize = 10*1024*1024; //���� ���ε� ���� �뷮 10mb
		
		//���Ͼ��ε�: �⺻�� ��Ʈ��ũ or I/O
		
		try{
			//������ ������ ���ε� �Ǵ� ����
			MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encoding, 
					                 new DefaultFileRenamePolicy());			
				//������ ���ϸ��� ���ε� �ȴٸ�?
				//�ߺ� ������ �������ִ� �����ڰ� DefaultFileRenamePolicy(); ���ٸ� ����Ⱑ ��
		 	
			//��û�� form�� file type�� name��
			String fileName = multi.getFilesystemName("upload");
			//�ߺ��� ���ϸ��� ����Ǳ� ���� ���ε� ���ϸ�
			String original = multi.getOriginalFileName("upload");
			String type = multi.getContentType("upload");
			File f = multi.getFile("upload");
			long len = 0;
			if(f!=null){
				len = f.length();
			}
			//���ϻӸ� �ƴ϶� user�� title�� ����
			String user = multi.getParameter("user");
			String title = multi.getParameter("title");
			//user�� title�� ������
%>
	����� ����: <%=fileName%><br/>
	���� ����: <%=original %><br/>
	���� Ÿ��: <%=type %><br/>
	���� ũ��: <%=len %><br/>
	user: <%=user %><br/>
	title: <%=title %><br/>
<% 			
	}catch(Exception e){}
%>










