/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import Validate.Validate;
import dao.RoleDAO;
import dao.UserDAO;
import dao.UserStatusDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Role;
import model.UserStatus;
import model.Users;

/**
 *
 * @author ducth
 */
@WebServlet(name = "AddUser", urlPatterns = {"/adduser"})
public class AddUser extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        UserDAO user = new UserDAO();

        Validate va  = new Validate();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role_id;
        String status_id;
        Users u1 = user.checkUserExist(username);
        Users u2 = user.checkEmailExist(email);
        boolean validateEmail = va.validateEmail(email);
        boolean validatePhone = va.checkPhone(phone);

        if (u1 != null) {
            request.setAttribute("message", "Username is already exist");
            request.getRequestDispatcher("admin/adduser.jsp").forward(request, response);
        } else {
            if (validateEmail == false || validatePhone == false) {
                request.setAttribute("message", "Incorrect email");
                request.getRequestDispatcher("adduser.jsp").forward(request, response);
            } else {
                if (u2 != null) {
                    request.setAttribute("message", "Email already registered");
                    request.getRequestDispatcher("adduser.jsp").forward(request, response);
                } else {
                    Role r = new Role();
                    r.setRoleID(Integer.parseInt(request.getParameter("role_id")));
                    UserStatus us = new UserStatus();
                    us.setId(Integer.parseInt(request.getParameter("status_id")));
                    Users u = new Users();
                    u.setUserName(username);
                    u.setPassword(password);
                    u.setGender(gender);
                    u.setEmail(email);
                    u.setPhoneNum(phone);
                    u.setRole(r);
                    u.setUserStatus(us);
                    user.adduser(u);
                    response.sendRedirect("user");

                }
            }
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

}
