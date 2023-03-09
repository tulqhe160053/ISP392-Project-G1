/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Dao.CartDAO;
import Dao.CartProductDAO;
import Dao.ProductDAO;
import Dao.ProductImgDAO;
import Dao.ShipAddressDAO;
import Model.Cart;
import Model.CartProduct;
import Model.Product;
import Model.ProductImg;
import Model.ShipAddress;
import Model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Tu
 */
public class CartServlet extends HttpServlet {

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
            case "addCart":
                addCart(request, response);
                break;
            case "viewCart":
                viewCart(request, response);
                break;
            case "viewCartComplete":
                viewCartComplete(request, response);
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

    private void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            if (user != null) {

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

                if (cart_dao.selectByUserId(user.getUserID()) == null) {
//                    Cart cart = cart_dao.selectByUserId(user.getUserID());
//                    CartProduct cartproduct = cartproduct_dao.getByProIdAndCartId(product.getProductID(), cart.getId());
                    cart_dao.insert(new Cart(1, user));
                    cartproduct_dao.insert(new CartProduct(cart_dao.selectByUserId(user.getUserID()), product, amount));
                } else {
                    cartproduct_dao.insert(new CartProduct(cart_dao.selectByUserId(user.getUserID()), product, amount));
                }

                String message = "Add product successfully ";
                session.setAttribute("message", message);
                request.getRequestDispatcher("home").forward(request, response);
            } else {
                request.getRequestDispatcher("login").forward(request, response);
            }
        } catch (ServletException | IOException | NumberFormatException e) {
        }
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            request.getRequestDispatcher("home").forward(request, response);
        } else {
            CartDAO cart_dao = new CartDAO();
            Cart cart = cart_dao.selectByUserId(user.getUserID());
            if (cart != null) {
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
                request.getRequestDispatcher("/cart/viewCart.jsp").forward(request, response);
            } else {
                String message = "You don't have any product in cart ";
                session.setAttribute("message", message);
                request.getRequestDispatcher("home").forward(request, response);
            }
        }

    }

    private void viewCartComplete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            if (session != null) {
                Users user = (Users) session.getAttribute("user");
                if (user == null) {
                    request.getRequestDispatcher("login").forward(request, response);
                } else {

                    CartDAO cart_dao = new CartDAO();
                    CartProductDAO cartproduct_dao = new CartProductDAO();
                    Cart cart = cart_dao.selectByUserId(user.getUserID());
                    int total = 0;
                    for (CartProduct cartproduct : cartproduct_dao.getByCartId(cart.getId())) {
                        Product p = cartproduct.getProduct();
                        total += p.getSellPrice() * cartproduct.getAmount();
                    }
                    request.setAttribute("total", total);
                    request.setAttribute("listCartProduct", cartproduct_dao.getByCartId(cart.getId()));
                    ProductImgDAO productImg_dao = new ProductImgDAO();
                    ArrayList<ProductImg> list_productImg = productImg_dao.selectAll();

                    ShipAddressDAO address_dao = new ShipAddressDAO();
                    ArrayList<ShipAddress> list_shipAddress = address_dao.getByUserId(user.getUserID());
                    ShipAddress shipaddress1 = new ShipAddress();
                    boolean check = false;
                    for (ShipAddress shipAddres : list_shipAddress) {
                        if (shipAddres.getIsUse()) {
                            shipaddress1 = new ShipAddress(shipAddres.getId(),
                                    shipAddres.getUser(), shipAddres.getFullName(),
                                    shipAddres.getPhoneNum(), shipAddres.getShipCity(),
                                    shipAddres.getDistrict(), shipAddres.getAddressDetail(), shipAddres.getIsUse());
                            check = true;
                        }
                    }
                    if (!list_shipAddress.isEmpty()) {
                        if (check == true) {
                            request.setAttribute("shipaddress", shipaddress1);
                        } else {
                            request.setAttribute("shipaddress", list_shipAddress.get(0));
                        }
                        request.setAttribute("cartId", cart.getId());
                        request.setAttribute("list_productImg", list_productImg);
                        request.getRequestDispatcher("/cart/ViewCartComplete.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("AddAddress");
                    }
                }

            } else {
                request.getRequestDispatcher("login").forward(request, response);
            }
        } catch (Exception e) {
        }
    }
}
