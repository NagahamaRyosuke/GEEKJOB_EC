/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import base.APImanager;
import com.fasterxml.jackson.databind.JsonNode;
import java.io.IOException;
import static java.net.URLEncoder.encode;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ryosuke
 */
public class Search extends HttpServlet {

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
        //UTF-8にエンコードする
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        ArrayList<JsonNode> list = new ArrayList<>();
        JsonNode rootNode = null;
        String keyword = "";
        
        //直接のアクセスがある場合
        String log = "";
        if(session.getAttribute("log") != null){
            log = (String)session.getAttribute("log");
            session.removeAttribute("log");
        } else if(request.getParameter("log") != null){
            log = (String)request.getParameter("log");
        }
        
        //ページ移動の接続
        if(request.getParameter("offset") != null){
            keyword = (String)session.getAttribute("keyword");
            String resultURL = encode(keyword, "UTF-8");
            int offsetNum = (Integer)session.getAttribute("offset");
            
            //直接のアクセスでは省略
            if(log.equals("")){
                int num = Integer.parseInt(request.getParameter("offset"));
                if(num >= 0){
                    offsetNum += 10;
                }else{
                    offsetNum -= 10;
                }

                //検索限界値
                if(offsetNum >= 500){
                    offsetNum = 500;
                }
                if(offsetNum <= 0){
                    offsetNum = 0;
                }
            }
            
            String query = resultURL+"&offset="+String.valueOf(offsetNum);
            session.setAttribute("offset", offsetNum);
            
            //API接続
            rootNode = APImanager.itemSearch(query);
            for(int i=0; i<rootNode.get("ResultSet").get("totalResultsReturned").asInt() ; i++){
                list.add(rootNode.get("ResultSet").get("0").get("Result").get(String.valueOf(i)));
            }
        } else {
            //初回の接続
            keyword = request.getParameter("keyword");
            String resultURL = encode(keyword, "UTF-8");
            if(keyword == null || keyword.equals("")){
                request.setAttribute("error", keyword);
                request.getRequestDispatcher("/top.jsp").forward(request, response);  
            }   
            
            //API接続
            rootNode = APImanager.itemSearch(resultURL);
            
                for(int i=0; i<rootNode.get("ResultSet").get("totalResultsReturned").asInt() ; i++){
                     list.add(rootNode.get("ResultSet").get("0").get("Result").get(String.valueOf(i)));
                 }
            
            session.setAttribute("keyword", keyword);
            session.setAttribute("offset", 0);
        }

        request.setAttribute("search", rootNode.get("ResultSet").get("totalResultsAvailable").asText());
        session.setAttribute("list", list);
        request.getRequestDispatcher("/search.jsp").forward(request, response);  
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
