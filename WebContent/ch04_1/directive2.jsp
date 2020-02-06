<!-- directive2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "java.util.*, java.text.*" 
		 import = "ch03.MyUtil"
		 session="true" 
		 buffer = "16kb"
		 autoFlush="true"
		 isThreadSafe="true"
%>
<!-- import�� �ҽÿ� ,�� Ȱ���Ͽ� �������� Ŭ������ ������ �� �ִ�. 
���� import �ߺ��� �����ϴ�.-->

<%
		request.setCharacterEncoding("EUC-KR");
		Date d = new Date();
%>

���� ��¥�� �ð���? <%=d.toLocaleString()%><br/>
����Id: <%=session.getId()%>

<!-- 
Session�� ��ü�̴�.(httpSession)
A�� ���� �������� �����Ҷ� ��Ĺ������ ù�湮������ ������ ��湮������ �� �� �ִ�.
�� ������ SessionId���� �����ϴµ� ���������ҽÿ��� SessionId���� ���⶧���̴�.

�׷��� ���� ����(��û)�ÿ� SessionID���� �߱����ִµ�, 
�̶� A��� ����� Session��ü�� ��Ĺ�� ������ �����.

B��� ������� ���� ���ӽÿ� ��ü�� ����� ID�� �ο��ȴ�.
�̷��� ������ '��û'�̸� ������ �� ��û������ ����� '����'�̴�. 
����ÿ��� sessionID���� �����κ���
������ ���µ� �̷��� ���� B�� ��Ű��� ���� ����ȴ�.

�ι�° ���ӽÿ� B�� ��Ű�� ��� ������ ���µ�(��û) �̿� ���� ������ 
ù��° ��û�� ����� Session��ü�� �ִ� SessionID�� ���Ͽ� ������ Ȯ�εȴ�.

�̷��� Session��ü�� ���������ð��� ���� ������
����� ���� ����Ʈ�� �� �ð��� ª�Ƽ� �����ð��� ������
��α����� �ؾ��Ѵ�.

default ���� true�̱⿡ ���� ������ �ʿ�� ����.
(session, buffer, autoFlush)
 -->