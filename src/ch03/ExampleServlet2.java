package ch03;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ch03/ExampleServlet2")
public class ExampleServlet2 extends HttpServlet {
	
	
	
	@Override
	public void init() throws ServletException {
		System.out.println("init ȣ��");
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy ȣ��");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service ȣ��");
	}
	
}


