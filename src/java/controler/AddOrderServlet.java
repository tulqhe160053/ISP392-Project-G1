/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dao.CartProductDAO;
import dao.OrderDAO;
import dao.OrderProductDAO;
import dao.OrderStatusDAO;
import dao.ShipAddressDAO;
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
import model.CartProduct;
import model.OrderProduct;
import model.Orders;
import model.Users;

/**
 *
 * @author Tu
 */
public class AddOrderServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddOrderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            if (user == null) {
                request.getRequestDispatcher("home").forward(request, response);
            }
            String cartIdString = request.getParameter("cartId");
            String shipAddressIdString = request.getParameter("shipAddressId");
            String totalString = request.getParameter("total");

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

            Orders order1 = order_dao.selectByUserIdAndOrderDate(user.getUserID(),formatter.format(orderDate));
            CartProductDAO cartproduct_dao = new CartProductDAO();
            ArrayList<CartProduct> listCartProduct = cartproduct_dao.getByCartId(cartId);
            OrderProductDAO orderProduct_dao = new OrderProductDAO();
            for (CartProduct cartProduct : listCartProduct) {
                orderProduct_dao.insert(new OrderProduct(cartProduct.getProduct(), order1, total));
            }
            String message = "Order successfully, please check your order detail";
            session.setAttribute("message", message);
            response.sendRedirect("home");

        } catch (Exception e) {
            System.out.println(e);
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

    public static void main(String[] args) {
        LocalDateTime orderDate = LocalDate.now().atTime(LocalTime.now());

            // Tạo LocalTime đại diện cho giờ mặc định là 8 giờ sáng
            LocalTime defaultTime = LocalTime.of(8, 0, 0);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
            // Kết hợp LocalDate và LocalTime thành LocalDateTime
            LocalDateTime deliveryTime = LocalDate.now().atTime(defaultTime).plus(1, ChronoUnit.DAYS);
    }
}
