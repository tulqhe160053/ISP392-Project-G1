/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Dao.OrderDAO;
import Dao.OrderProductDAO;
import Dao.ProductDAO;
import Dao.UserDAO;
import Model.OrderProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author ducth
 */
@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/admin"})
public class AdminDashboardServlet extends HttpServlet {

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
         UserDAO ud = new UserDAO();
        ProductDAO pdao = new ProductDAO();
        OrderDAO odao = new OrderDAO();
        OrderProductDAO opdao = new OrderProductDAO();
        int male = ud.countGender("male");
        int female = ud.countGender("female");
        int active = ud.countUser(1);
        int locked = ud.countUser(2);
         
        request.setAttribute("male", male);
        request.setAttribute("female", female);
        request.setAttribute("active", active);
        request.setAttribute("locked", locked);
        
        int countUser = ud.countUsers();
        request.setAttribute("countUser", countUser);
        
        int countProduct = pdao.countProduct();
        request.setAttribute("product", countProduct);
        
        int countOrder = odao.countOrder();
        request.setAttribute("order", countOrder);
        
        OrderProduct mostOrder = opdao.mostOrder();
        request.setAttribute("most", mostOrder);
        
        ArrayList<OrderProduct> orderProduct = opdao.mostOrderTop3();
        request.setAttribute("listSell", orderProduct);

        request.getRequestDispatcher("admin/admindashboard.jsp").forward(request, response);
         
        
        

        request.getRequestDispatcher("admin/admindashboard.jsp").forward(request, response);

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
