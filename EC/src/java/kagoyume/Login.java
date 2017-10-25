/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ryosuke
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
        //入力ミスでのURL保持
        if(request.getParameter("URL") != null){
            request.setAttribute("URL", request.getParameter("URL"));
        }
        
        //ログイン処理
        if(request.getParameter("login") != null && request.getParameter("login").equals("logIN")){
            String name = request.getParameter("Name");
            String password = request.getParameter("Password");
            try {
                int id = UserDataDAO.getInstance().login(name, password);

                //入力ミス
                if(id == 0){
                    request.setAttribute("login", id);
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                } else {
                    //ログイン処理
                    UserDataDTO udd = UserDataDAO.getInstance().searchByID(id);                
                    
                    //削除判断
                    if(udd.getDeleteFlg() == 1){
                        request.setAttribute("delete", id);
                        request.getRequestDispatcher("/login.jsp").forward(request, response);
                    }
                    session.setAttribute("user", udd);
                    
                    //直前のページに遷移
                    session.setAttribute("log", "log");
                    String url = request.getParameter("URL"); 
                    //例：http://localhost:8080/EC/top.jsp→top.jsp
                    url = url.substring(25);
                    response.sendRedirect(url);
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }   
        }
      
        //ログアウト処理
        if(request.getParameter("logout") != null && request.getParameter("logout").equals("logOUT")){
            session.removeAttribute("user");
            response.sendRedirect("top.jsp");
        }
        
        //初回のルート
        if(request.getParameter("logout") == null && request.getParameter("login") == null){
            //直前のURLを保持
            request.setAttribute("URL",request.getHeader("REFERER"));
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
