package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/boardUpdate")
public class BoardUpdate extends HttpServlet {

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		//��û�� ���鿡 ���� �ѱ� ���ڵ�
		request.setCharacterEncoding("EUC-KR");
		//���信 ���� �ڵ尪 �ѱ� ���ڵ�
		response.setContentType("text/html; charset=EUC-KR");
		//���ǿ��� read.jsp ������ �Խù� ��ü
		HttpSession session = request.getSession();
		
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		//update.jsp���� �Է��� pass�� ��
		String inPass = request.getParameter("pass");
		if(dbPass.equals(inPass)) {
			//update.jsp���� ��û�� ���� ���̺� ����
			BoardMgr mgr = new BoardMgr();
			BoardBean upBean = new BoardBean();
			upBean.setNum(Integer.parseInt(request.getParameter("num")));
			upBean.setName(request.getParameter("name"));
			upBean.setSubject(request.getParameter("subject"));
			upBean.setContent(request.getParameter("content"));
			mgr.updateBoard(upBean);
			String nowPage = request.getParameter("nowPage");
			response.sendRedirect("read.jsp?nowPage="+nowPage+
					"&num="+upBean.getNum());
		}else {
			//����� Ʋ�ȴٰ� ���â
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert<'�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.'>");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}
