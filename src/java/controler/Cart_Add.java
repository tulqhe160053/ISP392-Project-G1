/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controler;

import dao.CartDAO;
import dao.CartProductDAO;
import dao.ProductDAO;
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
import model.Users;

/**
 *
 * @author Tu
 */
public class Cart_Add extends HttpServlet {
   
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
        doPost(request, response);
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
        try {
            HttpSession session = request.getSession();
            if(session!=null){
                Users user = (Users) session.getAttribute("user");

                String productId_String = request.getParameter("productId");
                int productId = Integer.parseInt(productId_String);
                ProductDAO product_dao = new ProductDAO();
                Product x = new Product();
                x.setProductID(productId);
                Product product = product_dao.selectById(x);

                String amount_string = request.getParameter("amount");
                int amount = Integer.parseInt(amount_string);

                CartDAO cart_dao = new CartDAO();
                
                
                CartProductDAO cartproduct_dao = new CartProductDAO();
                
                if(cart_dao.selectByUserId(user.getUserID()) == null){
//                    Cart cart = cart_dao.selectByUserId(user.getUserID());
//                    CartProduct cartproduct = cartproduct_dao.getByProIdAndCartId(product.getProductID(), cart.getId());
                    cart_dao.insert(new Cart(1, user));
                    cartproduct_dao.insert(new CartProduct(cart_dao.selectByUserId(user.getUserID()), product, amount));
                }
                else {
                    cartproduct_dao.insert(new CartProduct(cart_dao.selectByUserId(user.getUserID()), product, amount));
                }

                String message = "Add product successfully ";
                session.setAttribute("message", message);
                request.getRequestDispatcher("home").forward(request, response);
            }
            else{
                request.getRequestDispatcher("login").forward(request, response);
            }
        } catch (Exception e) {
        }
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
