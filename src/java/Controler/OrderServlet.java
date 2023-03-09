/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Dao.CartDAO;
import Dao.CartProductDAO;
import Dao.OrderDAO;
import Dao.OrderProductDAO;
import Dao.OrderStatusDAO;
import Dao.ProductImgDAO;
import Dao.ShipAddressDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import Model.Cart;
import Model.CartProduct;
import Model.OrderProduct;
import Model.Orders;
import Model.ProductImg;
import Model.Users;

/**
 *
 * @author Tu
 */
public class OrderServlet extends HttpServlet {

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
            case "addOrder":
                addOrder(request, response);
                break;
            case "listOrder":
                listOrder(request, response);
                break;
            case "viewOrderDetail":
                viewOrderDetail(request, response);
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

    private void addOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            request.getRequestDispatcher("home").forward(request, response);
        } else {
            String cartIdString = request.getParameter("cartId");
            String shipAddressIdString = request.getParameter("shipAddressId");
            String totalString = request.getParameter("total");

            System.out.println("CartId" + cartIdString);
            System.out.println("ShipaddressId" + shipAddressIdString);
            System.out.println("total" + totalString);
            int cartId = Integer.parseInt(cartIdString);
            int shipAddressId = Integer.parseInt(shipAddressIdString);
            int total = Integer.parseInt(totalString);

            OrderDAO order_dao = new OrderDAO();
            ShipAddressDAO shipaddress_dao = new ShipAddressDAO();
            OrderStatusDAO orderStatus_dao = new OrderStatusDAO();

            // Tạo LocalDate đại diện cho ngày 1 tháng 1 năm 2022
            LocalDateTime orderDate = LocalDate.now().atTime(LocalTime.now());

            // Tạo LocalTime đại diện cho giờ mặc định là 8 giờ sáng
            LocalTime defaultTime = LocalTime.of(8, 0, 0);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
            // Kết hợp LocalDate và LocalTime thành LocalDateTime
            LocalDateTime deliveryTime = LocalDate.now().atTime(defaultTime).plus(1, ChronoUnit.DAYS);

            Orders order = new Orders(1, user, total, null, shipaddress_dao.getById(shipAddressId), orderStatus_dao.getById(2), orderDate.format(formatter), deliveryTime.format(formatter));
            order_dao.insert(order);

            Orders order1 = order_dao.selectAll().get(order_dao.selectAll().size() - 1);
            CartProductDAO cartproduct_dao = new CartProductDAO();
            ArrayList<CartProduct> listCartProduct = cartproduct_dao.getByCartId(cartId);
            OrderProductDAO orderProduct_dao = new OrderProductDAO();
            for (CartProduct cartProduct : listCartProduct) {
                orderProduct_dao.insert(new OrderProduct(cartProduct.getProduct(), order1, total));
            }

            CartDAO cart_dao = new CartDAO();
            Cart cart = cart_dao.selectByUserId(user.getUserID());
            CartProductDAO cartproduct_dao1 = new CartProductDAO();

            cartproduct_dao1.deleteByCartId(cart.getId());
            cart_dao.deleteByUserId(user.getUserID());
            String message = "Order successfully, please check your order detail";
            session.setAttribute("message", message);
            request.getRequestDispatcher("home").forward(request, response);
        }
    }

    private void listOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            if (session != null) {
                Users user = (Users) session.getAttribute("user");
                if (user == null) {
                    request.getRequestDispatcher("login").forward(request, response);
                }

                OrderDAO orderDao = new OrderDAO();
                ArrayList<Orders> listOrder = orderDao.selectAllByUserId(user.getUserID());
                if (listOrder.isEmpty()) {
                    String message = "You don't have any order";
                    session.setAttribute("message", message);
                    request.getRequestDispatcher("home").forward(request, response);
                }
                request.setAttribute("listOrder", listOrder);
                request.getRequestDispatcher("/order/ListOrder.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("login").forward(request, response);
            }
        } catch (Exception e) {
        }
    }

    private void viewOrderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
        try {
            String orderId_String = request.getParameter("orderId");
            int orderId = Integer.parseInt(orderId_String);
            
            OrderProductDAO orderproduct_dao = new OrderProductDAO();
            ArrayList<OrderProduct> list_orderProduct = orderproduct_dao.getByOrderId(orderId);
            
            request.setAttribute("list_orderProduct",list_orderProduct);
            
            OrderDAO order_dao = new OrderDAO();
            Orders order = order_dao.getById(orderId);
            request.setAttribute("order",order);
            
            ProductImgDAO productImg_dao = new ProductImgDAO();
            ArrayList<ProductImg> list_productImg = productImg_dao.selectAll();
            request.setAttribute("list_productImg",list_productImg);
            request.getRequestDispatcher("/order/ViewOrderDetail.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }
}
