/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.27
 * Generated at: 2019-12-03 03:04:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.shop;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import shop.UtilMgr;
import shop.ProductBean;
import java.util.Enumeration;
import shop.OrderBean;
import java.util.Hashtable;

public final class cartList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/shop/bottom.jsp", Long.valueOf(1575341819356L));
    _jspx_dependants.put("/shop/top.jsp", Long.valueOf(1575342277463L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("shop.OrderBean");
    _jspx_imports_classes.add("java.util.Enumeration");
    _jspx_imports_classes.add("shop.UtilMgr");
    _jspx_imports_classes.add("shop.ProductBean");
    _jspx_imports_classes.add("java.util.Hashtable");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
request.setCharacterEncoding("EUC-KR");
      out.write('\r');
      out.write('\n');
      shop.CartMgr cMgr = null;
      synchronized (session) {
        cMgr = (shop.CartMgr) _jspx_page_context.getAttribute("cMgr", javax.servlet.jsp.PageContext.SESSION_SCOPE);
        if (cMgr == null){
          cMgr = new shop.CartMgr();
          _jspx_page_context.setAttribute("cMgr", cMgr, javax.servlet.jsp.PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      shop.ProductMgr pMgr = null;
      pMgr = (shop.ProductMgr) _jspx_page_context.getAttribute("pMgr", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (pMgr == null){
        pMgr = new shop.ProductMgr();
        _jspx_page_context.setAttribute("pMgr", pMgr, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
 
		if(session.getAttribute("idKey")==null){
			response.sendRedirect("login.jsp");
		}

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Simple Shopping Mall</title>\r\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script src=\"script.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=\"#FFFFFF\" topmargin=\"100\">\r\n");
      out.write("\t");
      out.write('\r');
      out.write('\n');

	String id = (String)session.getAttribute("idKey");
	
	String log="";
	if(id == null) log ="<a href=login.jsp>로그인</a>";
	else log = "<a href=logout.jsp>로그아웃</a>";

	String reg="";
	if(id == null) reg ="<a href=member.jsp>회원가입</a>";
	else reg = "<a href=memberUpdate.jsp>회원수정</a>";

      out.write("\r\n");
      out.write("<table align=\"center\" bgcolor=\"#080808\" width=\"60%\">\r\n");
      out.write("<tr bgcolor=\"#ffffff\">\r\n");
      out.write("  <th width=\"50%\" height=\"40%\"\r\n");
      out.write("  style=\"background-image: url(data/data10.jpg);\">\r\n");
      out.write(" WELCOME TO THE<br/>\r\n");
      out.write("  <span style=\"Font-size: 50pt; line-height: 200%; color: black;\" id=\"spanTag\" >햄버거 천국</span><br/>\r\n");
      out.write("  (the HAMBURGER HEAVEN)\r\n");
      out.write("  </th>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table width=\"50%\" align=\"center\" bgcolor=\"#080808\" >\r\n");
      out.write("    <tr bgcolor=\"#ffffff\"> \r\n");
      out.write("    <th>");
      out.print(log);
      out.write("</th>\r\n");
      out.write("    <th>");
      out.print(reg);
      out.write("</th>\r\n");
      out.write("    <th><a href=\"productList.jsp\">상품목록</a></th>\r\n");
      out.write("    <th><a href=\"cartList.jsp\">장바구니</a></th>\r\n");
      out.write("    <th><a href=\"orderList.jsp\">구매목록</a></th>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("\t<table width=\"75%\" align=\"center\" bgcolor=\"#FFFFFF\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t<td align=\"center\" bgcolor=\"#FFFFFF\">\r\n");
      out.write("\t\t<table width=\"95%\" align=\"center\" bgcolor=\"#FFFFFF\" border=\"1\">\r\n");
      out.write("\t\t\t<tr align=\"center\" bgcolor=\"#FFFFFF\">\r\n");
      out.write("\t\t\t\t<td><font color=black>제품</font></td>\r\n");
      out.write("\t\t\t\t<td><font color=black>수량</font></td>\r\n");
      out.write("\t\t\t\t<td><font color=black>가격</font></td>\r\n");
      out.write("\t\t\t\t<td><font color=black>수정/삭제</font></td>\r\n");
      out.write("\t\t\t\t<td><font color=black>조회</font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");

					int totalPrice = 0;
					Hashtable<Integer,OrderBean> hCart = 
							cMgr.getCartList();
					if(hCart.isEmpty()){
			
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"5\" align=\"center\">장바구니는 비어 있습니다.</td>\r\n");
      out.write("\t\t\t</tr>\t\r\n");
      out.write("\t\t\t");
			
					}else{
						//줄줄이 사탕 객체
						Enumeration<Integer> hCartKey = hCart.keys();
						while(hCartKey.hasMoreElements()){
							//키값(productNo)으로 주문객체를 해쉬테이블에 리턴
							OrderBean order = 
									hCart.get(hCartKey.nextElement());
							int productNo = order.getProductNo();//상품번호
							//상품에 정보객체
							ProductBean pbean = pMgr.getProduct(productNo);
							//상품명
							String pName = pbean.getName();
							//상품가격
							int price = pbean.getPrice();
							//주문수량
							int quantity = order.getQuantity();
							//상품수량 * 상품가격
							int subTotal = price * quantity;
							//총주문가격
							totalPrice+=subTotal;
			
      out.write("\r\n");
      out.write("\t\t\t<tr align=\"center\">\r\n");
      out.write("\t\t<form method = \"post\" action = \"cartProc.jsp\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"productNo\" value=\"");
      out.print(productNo );
      out.write("\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"flag\">\r\n");
      out.write("\t\t\t\t<td>");
      out.print(pName );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td><input name=\"quantity\" value=\"");
      out.print(quantity);
      out.write("\" size=\"3\">개</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(quantity );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(UtilMgr.intFormat(subTotal));
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"button\" value=\"수정\" size=\"3\" onclick=\"javascript:cartUpdate(this.form)\"> /\r\n");
      out.write("\t\t\t\t<input type=\"button\" value=\"삭제\" size=\"3\" onclick=\"javascript:cartDelete(this.form)\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t<a href=\"javascript:productDetail('");
      out.print(productNo);
      out.write("')\">상세보기</a>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t</form>\t\t\t\t\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");
}//while
      out.write("\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"4\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t총 주문금액 : ");
      out.print(UtilMgr.intFormat(totalPrice));
      out.write("원\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td align=\"center\"><a href=\"orderProc.jsp\">주문하기</a></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t");
				
					}//---if-else
			
      out.write("\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("<table width=\"75%\" align=\"center\" bgcolor=\"#080808\">\r\n");
      out.write("  \r\n");
      out.write("  <tr>\r\n");
      out.write("  <th><a href=\"admin/index.jsp\">관리자</a></th>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>");
      out.write("\r\n");
      out.write("\t<form name=\"detail\" method=\"post\" action=\"productDetail.jsp\" >\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"no\">\r\n");
      out.write("\t</form>\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
