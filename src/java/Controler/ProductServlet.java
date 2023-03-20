/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Dao.CategoryDAO;
import Dao.FeedbackDAO;
import Dao.ProductDAO;
import Dao.ProductImgDAO;
import Model.Category;
import Model.Feedback;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import Model.Product;
import Model.ProductImg;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Tu
 */
public class ProductServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        switch (action) {
            case "viewProductDetail":
                viewProductDetail(request, response);
                break;
            case "listProduct":
                listProduct(request, response);
                break;
            default:
                break;
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

    private void viewProductDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/product/viewProductDetail.jsp";
        try {
            String productId_String = request.getParameter("productId");
            if (productId_String.equals("")) {
                url = "/common/homepage.jsp";
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                int productId = Integer.parseInt(productId_String);
                Product product_save = new Product();
                product_save.setProductID(productId);

                ProductDAO product_dao = new ProductDAO();
                Product product = product_dao.selectById(product_save);
                FeedbackDAO feedback_dao = new FeedbackDAO();
                ArrayList<Feedback> listFeedBack = feedback_dao.getFeedbacksByProductId(productId);
                request.setAttribute("product", product);
                ProductImgDAO productImg_dao = new ProductImgDAO();
                ProductImg productImg = productImg_dao.selectByProductId(product);
                request.setAttribute("productImg", productImg);                               
                request.setAttribute("listFeedBack", listFeedBack);
            }
        } catch (Exception e) {
            System.err.println(e);
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDAO dao = new CategoryDAO();
        ArrayList<Category> listCategorys = dao.selectAll();
        request.setAttribute("listCategorys", listCategorys);
        ProductDAO product_daoo = new ProductDAO();
        ArrayList<Product> list_products = product_daoo.selectAll();
        request.setAttribute("list_products", list_products);
        ProductImgDAO productImg_dao = new ProductImgDAO();
        ArrayList<ProductImg> list_productImg = productImg_dao.selectAll();
        request.setAttribute("list_productImg", list_productImg);
        String url = "/product/listProduct.jsp";
        HttpSession session = request.getSession();
        session.removeAttribute("message");
        try {
            String catId_String = request.getParameter("catId");
            if (catId_String.equals("")) {
                url = "/common/homepage.jsp";
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                int catId = Integer.parseInt(catId_String);
                request.setAttribute("catId", catId);
            }
        } catch (Exception e) {
            System.err.println(e);
        }

        request.getRequestDispatcher(url).forward(request, response);
    }
}
