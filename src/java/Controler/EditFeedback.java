/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Dao.FeedbackDAO;
import Dao.ProductDAO;
import Dao.ProductImgDAO;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import Model.Feedback;
import Model.Product;
import Model.ProductImg;
import Model.Users;

/**
 *
 * @author Trang
 */
public class EditFeedback extends HttpServlet {

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
            doGet(request, response);
     
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
            response.setContentType("text/html;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");         
            
            String feedbackId_String = request.getParameter("id");
            int feedbackId = Integer.parseInt(feedbackId_String);
            FeedbackDAO dao  = new FeedbackDAO();
            Feedback f = dao.getFeedbacksById(feedbackId);
            request.setAttribute("editF", f);
            
            request.getRequestDispatcher("feedback/editfeedback.jsp").forward(request, response);
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
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            if (user == null) {
                request.getRequestDispatcher("common/login.jsp").forward(request, response);
            } else {
                String feedbackId_String = request.getParameter("id");
                int feedbackId = Integer.parseInt(feedbackId_String);

                FeedbackDAO feedbackDAO = new FeedbackDAO();
                int star = Integer.parseInt(request.getParameter("star-value"));
                String des = request.getParameter("feedback-text");
                feedbackDAO.editFeedback(star, des, feedbackId);

                response.sendRedirect("listmyfeedback");
            }
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
