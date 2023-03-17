/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controler;

import Dao.BrandDAO;
import Dao.CategoryDAO;
import Dao.ProductDAO;
import Dao.ProductImgDAO;
import Dao.ProductStatusDAO;
import Model.Brand;
import Model.Category;
import Model.Product;
import Model.ProductImg;
import Model.ProductStatus;
import Model.Users;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.ArrayList;

/**
 *
 * @author Trang
 */
@MultipartConfig(maxFileSize = 16177216)
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

        BrandDAO br = new BrandDAO();
        ArrayList<Brand> listBrand = br.selectAll();
        request.setAttribute("listBrand", listBrand);

        ProductStatusDAO ps = new ProductStatusDAO();
        ArrayList<ProductStatus> productStatus = ps.selectAll();
        request.setAttribute("productStatus", productStatus);

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

        String pname = request.getParameter("pname");
        String Description = request.getParameter("Description");
        String Color = request.getParameter("color");
        int OriginalPrice = Integer.parseInt(request.getParameter("OriginalPrice"));
        int SellPrice = Integer.parseInt(request.getParameter("SellPrice"));
        int SalePercent = Integer.parseInt(request.getParameter("SalePercent"));
        String amount_string = request.getParameter("Amount");
        int Amount = Integer.parseInt(amount_string);
        int catId = Integer.parseInt(request.getParameter("catId"));
        int sttID = Integer.parseInt(request.getParameter("sttID"));
        int brandID = Integer.parseInt(request.getParameter("brandID"));

        Part filePart = request.getPart("image");
        String imageFileName = filePart.getSubmittedFileName();
        InputStream is = filePart.getInputStream();
        byte[] data = new byte[is.available()];
        is.read(data);

        ProductDAO pdao = new ProductDAO();
        pdao.AddProduct(pname, Description, Color, OriginalPrice, SalePercent, SellPrice, catId, id, Amount, sttID, brandID);
        
        int lastid = pdao.getLastProductId();
        Product p = new Product();
        ProductImgDAO imgdao = new ProductImgDAO();
        p.setProductID(lastid);
        imgdao.add(p, imageFileName);
        
        response.sendRedirect("ListSellProduct");
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
