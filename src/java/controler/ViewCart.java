/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controler;

import dao.CartDAO;
import dao.CartProductDAO;
import dao.ProductImgDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Cart;
import model.CartProduct;
import model.Product;
import model.ProductImg;
import model.Users;

/**
 *
 * @author Tu
 */
public class ViewCart extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewCart</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewCart at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
        if(user==null){
            request.getRequestDispatcher("home").forward(request, response);
        }
        CartDAO cart_dao = new CartDAO();
        Cart cart = cart_dao.selectByUserId(user.getUserID());
        if(cart!=null){
            CartProductDAO cartproduct_dao = new CartProductDAO();
            int total = 0;
            for (CartProduct cartproduct : cartproduct_dao.getByCartId(cart.getId())) {
                Product p = cartproduct.getProduct();
                total += p.getSellPrice() * cartproduct.getAmount();
            }
            request.setAttribute("total",total);
            request.setAttribute("listCartProduct",cartproduct_dao.getByCartId(cart.getId()));
            ProductImgDAO productImg_dao = new ProductImgDAO();
            ArrayList<ProductImg> list_productImg = productImg_dao.selectAll();
            request.setAttribute("list_productImg",list_productImg);
            request.getRequestDispatcher("/cart/viewCart.jsp").forward(request, response);
        }
        else {
            try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Cart not found</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Don't have any product in cart " + "</h1>");
            out.println("<h1>Don't have any product in cart " + "</h1>");
            out.println("</body>");
            out.println("</html>");
            }
        }
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
