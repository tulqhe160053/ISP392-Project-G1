/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Dao.CategoryDAO;
import Dao.ProductDAO;
import Model.Brand;
import Model.Category;
import Model.Product;
import Model.ProductStatus;
import Model.Users;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Trang
 */
@WebServlet(name = "AddProduct", urlPatterns = {"/addproduct"})
public class AddProduct extends HttpServlet {

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
                    CategoryDAO category_dao = new CategoryDAO();
                    ArrayList<Category> listCategory = category_dao.selectAll();
                    request.setAttribute("listCategory", listCategory);
                    request.getRequestDispatcher("seller/addproduct.jsp").forward(request, response);
        
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
                HttpSession session = request.getSession();
                Users u = (Users) session.getAttribute("user");
                int id = u.getUserID();
                u.setUserID(id);
               
                String pname = request.getParameter("pname");
                String Description = request.getParameter("Description");
                String Color = request.getParameter("Color");
                int OriginalPrice = Integer.parseInt(request.getParameter("OriginalPrice"));
                int SellPrice = Integer.parseInt(request.getParameter("SellPrice"));
                int  SalePercent = Integer.parseInt(request.getParameter("SalePercent"));
                int Amount = Integer.parseInt(request.getParameter("Amount"));

                ProductStatus ps = new ProductStatus();
                int sttID = Integer.parseInt(request.getParameter("sttID"));
                ps.setStatusID(sttID);
                
                Brand br = new Brand();
                int brandID = Integer.parseInt(request.getParameter("brandID"));
                br.setBrandID(brandID);
                
                Category cat = new Category();
                int pCategory = Integer.parseInt(request.getParameter("Category"));
                cat.setCategoryId(pCategory);
                
                Product p = new Product();
                p.setProductName(pname);
                p.setDescription(Description);
                p.setColor(Color);
                p.setOriginalPrice(OriginalPrice);
                p.setSellPrice(SellPrice);
                p.setSalePercent(SalePercent);
                p.setAmount(Amount);
                p.setProductStatus(ps);
                p.setBrand(br);
                p.setCategory(cat);
               p.setSeller(u);
                
                ProductDAO pdao = new ProductDAO();
                pdao.AddProduct(p);

        request.getRequestDispatcher("seller/sellerdashboard.jsp").forward(request, response);
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
