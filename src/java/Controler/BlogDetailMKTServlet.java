/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Dao.BlogDAO;
import Dao.BlogStatusDAO;
import Dao.CategoryDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
 
import Model.Blog;
import Model.BlogStatus;
import Model.Category;

/**
 *
 * @author ducth
 */
 @MultipartConfig(maxFileSize = 16177216)
public class BlogDetailMKTServlet extends HttpServlet {

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
        String type = request.getParameter("type");
        BlogDAO dao = new BlogDAO();
        CategoryDAO cat = new CategoryDAO();
        BlogStatusDAO bs = new BlogStatusDAO();
        if (action.equals("blogdetail")) {
            String blog_id = request.getParameter("blog_id");
            Blog b = dao.getBlogByID(blog_id);
            List<Category> category = cat.selectAll();
            List<BlogStatus> blogstatus = bs.selectAll();
            request.setAttribute("category", category);
            request.setAttribute("blogstatus", blogstatus);
            request.setAttribute("blogdetail", b);
            RequestDispatcher rd = request.getRequestDispatcher("marketing/editblog.jsp");
            rd.forward(request, response);
        }
        
        if (action.equals("delete")) {
            String bid = request.getParameter("bid");
            dao.deleteBlog(bid);
            response.sendRedirect("blogmkt");
        }
        if (action.equals("editblog")) {

            String blog_id = request.getParameter("blog_id");
            String title = request.getParameter("title");
            String des = request.getParameter("des");
            String content = request.getParameter("content");
            String catid = request.getParameter("catid");

            dao.UpdateBlog(catid, title, des, content, blog_id);
            response.sendRedirect("blogmkt");
        }

        if (action.equals("edit_image")) {
            try {
                String blog_id = request.getParameter("blog_id");
                Part filePart = request.getPart("image");
                String imageFileName = filePart.getSubmittedFileName();
                InputStream is = filePart.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);              
                dao.UpdateImage(blog_id, imageFileName);
                request.getRequestDispatcher("blogdetailmkt?action=blogdetail&blog_id="+blog_id).forward(request, response);
            } catch (Exception e) {
            }

        }
         if(action.equals("editstatus")){
            String bid = request.getParameter("bid");
            String status = request.getParameter("statusid");
            if(type.equals("active")){
                dao.UpdateStatus(bid, "2");
            }
            if(type.equals("hide")){
                dao.UpdateStatus(bid, "1");
            }
            response.sendRedirect("blogmkt");
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
