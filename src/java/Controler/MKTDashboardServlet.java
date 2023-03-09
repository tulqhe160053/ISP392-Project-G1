/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Dao.BlogDAO;
import Dao.FeedbackDAO;
import Dao.OrderProductDAO;
import Dao.ProductDAO;
import Dao.SliderDAO;
import Model.Feedback;
import Model.OrderProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
 

/**
 *
 * @author ducth
 */
public class MKTDashboardServlet extends HttpServlet {

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
         BlogDAO blog = new BlogDAO();
        FeedbackDAO feedback = new FeedbackDAO();
        ProductDAO product = new ProductDAO();
        SliderDAO slider = new SliderDAO();
        OrderProductDAO opdao = new OrderProductDAO();
        int laptop = blog.countBlogByCategory(1);
        int smartphone = blog.countBlogByCategory(2);
        int tablet = blog.countBlogByCategory(3);
        int acces = blog.countBlogByCategory(4);
        request.setAttribute("laptop", laptop);
        request.setAttribute("smartphone", smartphone);
        request.setAttribute("tablet", tablet);
        request.setAttribute("acces", acces);

//        int laptop1 = blog.getBlogByViewer(1);
//        int smartphone1 = blog.getBlogByViewer(2);
//        int tablet1 = blog.getBlogByViewer(3);
//        int acces1 = blog.getBlogByViewer(4);
//        request.setAttribute("laptop1", laptop1);
//        request.setAttribute("smartphone1", smartphone1);
//        request.setAttribute("tablet1", tablet1);
//        request.setAttribute("acces1", acces1);

       int countBlog = blog.countBlog();
       request.setAttribute("countBlog", countBlog);

        int avgStar = blog.AverageStar();
        request.setAttribute("avgstar", avgStar);

        int star1 = feedback.countStar(1);
        int star2 = feedback.countStar(2);
        int star3 = feedback.countStar(3);
        int star4 = feedback.countStar(4);
        int star5 = feedback.countStar(5);
        request.setAttribute("star1", star1);
        request.setAttribute("star2", star2);
        request.setAttribute("star3", star3);
        request.setAttribute("star4", star4);
        request.setAttribute("star5", star5);
        
        Feedback f = feedback.getProductStar();
        request.setAttribute("product5star", f);
        
        int countSlider = slider.countSlider();
        request.setAttribute("slider", countSlider);
        
        List<Feedback> userfeedback = feedback.getUserFeedback();
        request.setAttribute("userfeedback", userfeedback);
        
        List<OrderProduct> orderProduct = opdao.mostOrderTop3();
        request.setAttribute("listSell", orderProduct);
        
        List<Feedback> pFeedback = feedback.getProductFeedback();
        request.setAttribute("pFeedback", pFeedback);
        
        request.getRequestDispatcher("marketing/mktdashboard.jsp").forward(request, response);
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
