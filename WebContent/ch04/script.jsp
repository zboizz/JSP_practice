
<!--  script.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%!
		String declaration = "����";
%>	
<%!
		public String decMethod() {
			return declaration;
		}
%>
<%
String scriptlet = "��ũ��Ʈ��";
String comment = "�ּ�";
%>

������ ���1 : <%=declaration%><br/>
������ ���2 : <%=decMethod()%><br/>
��ũ��Ʈ���� ��� : <%=scriptlet%><br/>
<!--  JSP �ּ��κ� -->
<!--  JSP �ּ�1 <%=comment %> --><p/>
<%--JSP �ּ�2 <%=comment %> --%>
<%
/*������ �ּ�*/
//�����ּ�

/* JSP ��ũ��Ʈ ���
		1. ���� <%! % >
		2. ��ũ��Ʈ�� <% % >
		3. ǥ���� <%= % >
		2,3���� _jspService ������ �� �������.
*/
// ���� - service(Request, Response) { -- ������ ���� �޼ҵ尡  ȣ��ȴ�.
// ���𹮿��� �ʵ�, �޼ҵ� ����
// ���� ����� ���� ���� ����.
// �޼ҵ� �ȿ� Ŭ������ ���� �����ѵ�, �޼ҵ� �ȿ� �޼ҵ弱���� �Ұ���
%>
