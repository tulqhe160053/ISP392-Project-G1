/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dao.BlogDAO;
import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.Category;
import model.Users;

/**
 *
 * @author ducth
 */
@WebServlet(name = "BlogServletMKT", urlPatterns = {"/blogmkt"})
public class BlogServletMKT extends HttpServlet {

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
        BlogDAO dao = new BlogDAO();
        CategoryDAO cat = new CategoryDAO();
        if (action == null) {

            List<Blog> listBlog = dao.getAllBlog();
            List<Category> category = cat.selectAll();
            int page, numperpage = 3;
            int size = listBlog.size();
            int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1);//so trang
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);
            List<Blog> blog = dao.getListByPage(listBlog, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("category", category);
            request.setAttribute("listBlog", blog);
            request.getRequestDispatcher("marketing/viewbloglist.jsp").forward(request, response);
        }

        if (action.equals("search")) {
            String text = request.getParameter("txt");
            List<Blog> list = dao.search(text);
            List<Category> category = cat.selectAll();
            request.setAttribute("category", category);
            request.setAttribute("listBlog", list);
            request.getRequestDispatcher("marketing/viewbloglist.jsp").forward(request, response);
        }

        if (action.equals("filter")) {
            String catid = request.getParameter("catid");
            request.setAttribute("catid", catid);
            if (catid.equals("all")) {
                response.sendRedirect("blogmkt");
            } else {
                List<Blog> listBlog = dao.getFilterByCategory(catid);
                List<Category> category = cat.selectAll();
                request.setAttribute("category", category);
                request.setAttribute("listBlog", listBlog);
                request.getRequestDispatcher("marketing/viewbloglist.jsp").forward(request, response);
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
