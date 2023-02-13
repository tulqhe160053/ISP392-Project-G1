/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dao.FeedbackDAO;
import dao.ProductDAO;
import dao.ProductImgDAO;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import model.Feedback;
import model.Product;
import model.ProductImg;
import model.Users;

/**
 *
 * @author Admin
 */
public class AddFeedback extends HttpServlet {

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
            String url = "/feedback/addfeedback.jsp";
        try {
            String productId_String = request.getParameter("productId");

                int productId = Integer.parseInt(productId_String);
                Product product_save = new Product();
                product_save.setProductID(productId);
                
                ProductDAO product_dao = new ProductDAO();
                Product product = product_dao.selectById(product_save);
                request.setAttribute("product", product);
                ProductImgDAO productImg_dao = new ProductImgDAO();
                 ProductImg productImg = productImg_dao.selectByProductId(product);
                request.setAttribute("productImg", productImg);
                request.getRequestDispatcher(url).forward(request, response);
                
           
        } catch (Exception e) {
            System.err.println(e);
        }       
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
 
            // get FeedbackDAO
            FeedbackDAO feedbackDAO = new FeedbackDAO();

            // get current product id
            String productId_String = request.getParameter("productId");
            int productId = Integer.parseInt(productId_String);
           // int productId = Integer.parseInt(request.getParameter("productId"));

            // get input rating
            int star = Integer.parseInt(request.getParameter("star-value"));
            String feedback = request.getParameter("feedback-text");

            // create feedback
            Feedback userFeedback = new Feedback();
            userFeedback.setProductID(productId);
            userFeedback.setUserID(user.getUserID());
            userFeedback.setStar(star);;
            userFeedback.setFeedbackDetail(feedback);
            System.out.println(userFeedback.toString());

            // add feedback to database
            feedbackDAO.addFeedback(userFeedback);

            // redirect 
            response.sendRedirect("/common/homepage");
        

        
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
