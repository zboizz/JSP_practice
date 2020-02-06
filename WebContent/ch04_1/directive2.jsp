<!-- directive2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "java.util.*, java.text.*" 
		 import = "ch03.MyUtil"
		 session="true" 
		 buffer = "16kb"
		 autoFlush="true"
		 isThreadSafe="true"
%>
<!-- import를 할시에 ,를 활용하여 여러가지 클래스를 가져올 수 있다. 
또한 import 중복도 가능하다.-->

<%
		request.setCharacterEncoding("EUC-KR");
		Date d = new Date();
%>

현재 날짜와 시간은? <%=d.toLocaleString()%><br/>
세션Id: <%=session.getId()%>

<!-- 
Session은 객체이다.(httpSession)
A가 최초 브라우저에 접속할때 톰캣에서는 첫방문자인지 기존의 재방문자인지 알 수 있다.
그 이유는 SessionId값이 존재하는데 최초접속할시에는 SessionId값이 없기때문이다.

그래서 최초 접속(요청)시에 SessionID값을 발급해주는데, 
이때 A라는 사람의 Session객체가 톰캣의 서버에 생긴다.

B라는 사람또한 최초 접속시에 객체가 생기고 ID가 부여된다.
이러한 과정이 '요청'이며 서버가 이 요청에대한 대답이 '응답'이다. 
응답시에는 sessionID값이 서버로부터
보내어 오는데 이러한 값이 B의 쿠키라는 곳에 저장된다.

두번째 접속시에 B는 쿠키를 들고 서버에 가는데(요청) 이와 같은 정보가 
첫번째 요청시 생겼던 Session객체에 있는 SessionID와 비교하여 접속이 확인된다.

이러한 Session객체는 접속유지시간이 길지 않은데
은행과 같은 사이트는 그 시간이 짧아서 일정시간이 지나면
재로그인을 해야한다.

default 값이 true이기에 따로 설정할 필요는 없다.
(session, buffer, autoFlush)
 -->