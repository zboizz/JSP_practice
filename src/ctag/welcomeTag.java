package ctag;

import java.io.IOException;

import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.jasper.el.JspELException;

public class welcomeTag extends SimpleTagSupport{
	
	@Override
	public void doTag() throws JspELException, IOException{
		getJspContext().getOut().println("Welcome Welcome Welcome");
	}
}
