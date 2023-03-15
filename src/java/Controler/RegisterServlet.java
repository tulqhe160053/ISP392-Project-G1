package Controler;

import Validate.Validate;
import Mailer.SendMail;
import Validate.Validate;
import Dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Model.Role;
import Model.UserStatus;
import Model.Users;

/**
 *
 * @author ducth
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String username = request.getParameter("userName");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repass");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("num");

        UserDAO dao = new UserDAO();
        Users u = dao.checkUserExist(username);
        Users u1 = dao.checkEmailExist(email);

        Validate va  = new Validate();
        boolean validateEmail = va.validateEmail(email);
        boolean validatePhone = va.checkPhone(phone);
        boolean validatePassword = va.checkPassword(password);

        if (u != null) {
            request.setAttribute("mess", "Username is already exist");
            request.getRequestDispatcher("common/register.jsp").forward(request, response);
        } else {
            if (validatePassword == false) {
                request.setAttribute("mess", "Invalid Password!");
                request.getRequestDispatcher("common/register.jsp").forward(request, response);
            }
            else if (validateEmail == false || validatePhone == false) {
                request.setAttribute("mess", "Invalid email or phone");
                request.getRequestDispatcher("common/register.jsp").forward(request, response);
            } else {
                if (u1 != null) {
                    request.setAttribute("mess", "Email already registered");
                    request.getRequestDispatcher("common/register.jsp").forward(request, response);
                } else {
                    if (!repassword.equals(password)) {
                        request.setAttribute("mess", "Confirm password incorrect");
                        request.getRequestDispatcher("common/register.jsp").forward(request, response);
                    } else {
                        SendMail sm = new SendMail();
                        String verifyCode = sm.getRandom();
                        Users newUser = new Users();
                        newUser.setUserName(username);
                        newUser.setPassword(password);
                        newUser.setGender(gender);
                        newUser.setEmail(email);
                        newUser.setPhoneNum(phone);
                        session.setAttribute("code", verifyCode);
                        session.setAttribute("userAcc", newUser);
                        sm.send(email, verifyCode);
                        request.getRequestDispatcher("common/verify.jsp").forward(request, response);
                    }
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
