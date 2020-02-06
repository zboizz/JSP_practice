package ctag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
//태그에 속성이 있는 기능 구현
public class PageTag extends SimpleTagSupport{

	private int from;
	private int to;
	public void setFrom(int from) {
		this.from = from;
	}
	public void setTo(int to) {
		this.to = to;
	}
	@Override
	public void doTag() throws JspException, IOException {
		int start = from;
		int end = to;
		JspWriter out = getJspContext().getOut();
		out.println("Page &nbsp;");
		for(int i=start; i<end; i++) {
			out.println("<a href='/myapp/ctag/pageTag.jsp?nowPage="+i+"'>");
			out.println("["+i+"]");
			out.println("</a>&nbsp;");
		}
	}
}







