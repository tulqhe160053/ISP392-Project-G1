/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Dao.CartDAO;
import Dao.CartProductDAO;
import Dao.ProductImgDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import Model.Cart;
import Model.CartProduct;
import Model.Product;
import Model.ProductImg;
import Model.Users;

/**
 *
 * @author Tu
 */
public class EditCart extends HttpServlet {

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
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            request.getRequestDispatcher("home").forward(request, response);
        }
        String action = request.getParameter("action");
        if (action == null) {
            CartDAO cart_dao = new CartDAO();
            Cart cart = cart_dao.selectByUserId(user.getUserID());
            CartProductDAO cartproduct_dao = new CartProductDAO();
            int total = 0;
            for (CartProduct cartproduct : cartproduct_dao.getByCartId(cart.getId())) {
                Product p = cartproduct.getProduct();
                total += p.getSellPrice() * cartproduct.getAmount();
            }
            request.setAttribute("total", total);
            request.setAttribute("listCartProduct", cartproduct_dao.getByCartId(cart.getId()));
            ProductImgDAO productImg_dao = new ProductImgDAO();
            ArrayList<ProductImg> list_productImg = productImg_dao.selectAll();
            request.setAttribute("list_productImg", list_productImg);
            request.getRequestDispatcher("/cart/editcart.jsp").forward(request, response);
        }
        
        else if (action.equals("deleteCart")){
            CartDAO cart_dao = new CartDAO();
            Cart cart = cart_dao.selectByUserId(user.getUserID());
            CartProductDAO cartproduct_dao = new CartProductDAO();
            int total = 0;
            for (CartProduct cartproduct : cartproduct_dao.getByCartId(cart.getId())) {
                Product p = cartproduct.getProduct();
                total += p.getSellPrice() * cartproduct.getAmount();
            }
            cartproduct_dao.deleteByCartId(cart.getId());
            cart_dao.deleteByUserId(user.getUserID());
            request.setAttribute("total", total);
            request.setAttribute("listCartProduct", cartproduct_dao.getByCartId(cart.getId()));
            ProductImgDAO productImg_dao = new ProductImgDAO();
            ArrayList<ProductImg> list_productImg = productImg_dao.selectAll();
            request.setAttribute("list_productImg", list_productImg);
            request.getRequestDispatcher("/cart/editcart.jsp").forward(request, response);
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
