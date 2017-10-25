package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kagoyume.UserDataDTO;
import kagoyume.KagoyumeHelper;

public final class top_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        \n");
      out.write("        <title>かごゆめ</title>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1 class=\"bg-success text-primary text-center\">かごゆめ<br><small>どんなものでも購入できるECサイト</small></h1>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            ");
      out.print( KagoyumeHelper.getInstance().login((UserDataDTO)session.getAttribute("user")) );
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"clearfix\"></div>\n");
      out.write("            <form action=\"Search\" method=\"GET\">\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <div class=\"col-xs-5\">\n");
      out.write("                        <input type=\"text\" name=\"keyword\" placeholder=\"Keyword\" class=\"form-control col-md-offset-8\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <input type=\"submit\" value=\"検索\" class=\"btn btn-default col-md-offset-3 col-md-1\">\n");
      out.write("            </form>\n");
      out.write("            \n");
      out.write("            <div class=\"clearfix\"></div>\n");
      out.write("            <h4 class=\"text-center text-danger\">\n");
      out.write("                ");
 if(request.getAttribute("error") != null){ 
      out.write("\n");
      out.write("                    キーワードを入力してください\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </h4>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
