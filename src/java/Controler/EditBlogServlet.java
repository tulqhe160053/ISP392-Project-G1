/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Dao.BlogDAO;
import Dao.CategoryDAO;
import Model.Blog;
import Model.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.List;

/**
 *
 * @author Admin
 */
 @MultipartConfig(maxFileSize = 16177216)
public class EditBlogServlet extends HttpServlet {

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
            out.println("<title>Servlet EditBlogServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBlogServlet at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        BlogDAO bd = new BlogDAO();
        CategoryDAO cat = new CategoryDAO();
        List<Category> category = cat.selectAll();
        Blog b = new Blog();
        b= bd.getBlogByID(id);
        request.setAttribute("category", category);
        request.setAttribute("blog", b);
        request.getRequestDispatcher("blog/editBlog.jsp").forward(request, response);
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
        BlogDAO bd = new BlogDAO();
        String blog_id = request.getParameter("blog_id");
        Part filePart = request.getPart("image");
        String imageFileName = filePart.getSubmittedFileName();
        InputStream is = filePart.getInputStream();
        byte[] data = new byte[is.available()];
        is.read(data);
        
        String title = request.getParameter("title");
        String des = request.getParameter("des");
        String content = request.getParameter("content");
        String catid = request.getParameter("catid");
        bd.UpdateBlog1(imageFileName, catid, title, des, content, blog_id);
        response.sendRedirect("mylistblog");
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
