
<!--  script.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%!
		String declaration = "선언문";
%>	
<%!
		public String decMethod() {
			return declaration;
		}
%>
<%
String scriptlet = "스크립트릿";
String comment = "주석";
%>

선언문의 출력1 : <%=declaration%><br/>
선언문의 출력2 : <%=decMethod()%><br/>
스크립트릿의 출력 : <%=scriptlet%><br/>
<!--  JSP 주석부분 -->
<!--  JSP 주석1 <%=comment %> --><p/>
<%--JSP 주석2 <%=comment %> --%>
<%
/*여러줄 주석*/
//한줄주석

/* JSP 스크립트 요소
		1. 선언문 <%! % >
		2. 스크립트릿 <% % >
		3. 표현식 <%= % >
		2,3번은 _jspService 영역에 다 만들어짐.
*/
// 서블릿 - service(Request, Response) { -- 서블릿은 서비스 메소드가  호출된다.
// 선언문에는 필드, 메소드 선언
// 선언문 사용할 일은 거의 없다.
// 메소드 안에 클래스는 선언 가능한데, 메소드 안에 메소드선언은 불가능
%>
