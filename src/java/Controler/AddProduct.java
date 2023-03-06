/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

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
                response.setContentType("text/html;charset=UTF-8");

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
                HttpSession session = request.getSession();
                Users u = (Users) session.getAttribute("user");
                int sid = u.getUserID();
                
                String pname = request.getParameter("pname");
                String Description = request.getParameter("Description");
                String Color = request.getParameter("Color");
                String StringOPrice = request.getParameter("OriginalPrice");
                int OriginalPrice = Integer.parseInt("StringOPrice");
                String StringSPrice = request.getParameter("StringSPrice");
                int SellPrice = Integer.parseInt("SellPrice");
                String Stringpercent = request.getParameter("SalePercent");
                int  SalePercent = Integer.parseInt("Stringpercent");
                String StrAmount = request.getParameter("Amount");
                int Amount = Integer.parseInt("StrAmount");

                ProductStatus ps = new ProductStatus();
                String StringsttID = request.getParameter("sttID");
                int sttID = Integer.parseInt("StringsttID");
                ps.setStatusID(sttID);
                
                Brand br = new Brand();
                String StringbrandID = request.getParameter("brandID");
                int brandID = Integer.parseInt("StringbrandID");
                br.setBrandID(brandID);
                
                Category cat = new Category();
                String StringpCategory = request.getParameter("Category");
                int pCategory = Integer.parseInt("StringpCategory");
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
