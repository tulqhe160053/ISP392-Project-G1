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
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.ArrayList;

/**
 *
 * @author Trang
 */
public class EditProduct extends HttpServlet {

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

        String productID_String = request.getParameter("pid");
        int productID = Integer.parseInt(productID_String);
        Product a = new Product();
        a.setProductID(productID);

            ProductDAO dao  = new ProductDAO();
            Product p = dao.selectById(a);
            ProductImgDAO img = new ProductImgDAO();
            ProductImg imgp = img.selectByProductId(p);
            p.setImg(imgp);
            request.setAttribute("editP", p);

        request.getRequestDispatcher("seller/editproduct.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Users u = (Users) session.getAttribute("user");
        int id = u.getUserID();
        if (u == null){
            request.getRequestDispatcher("login").forward(request, response);
            
        } else{
            
                    String productID_String = request.getParameter("pid");
                    int productID = Integer.parseInt(productID_String);

                    String pname = request.getParameter("pname");
                    String Description = request.getParameter("Description");
                    String Color = request.getParameter("color");
                    String ori_string = request.getParameter("OriginalPrice");
                    int OriginalPrice = Integer.parseInt(ori_string);
                    String sell_string = request.getParameter("SellPrice");
                    int SellPrice = Integer.parseInt(sell_string);
                    String sale_string = request.getParameter("SalePercent");
                    int SalePercent = Integer.parseInt(sale_string);
                    String amount_string = request.getParameter("Amount");
                    int Amount = Integer.parseInt(amount_string);
                    String cat_string = request.getParameter("catId");
                    int catId = Integer.parseInt(cat_string);
                    String sta_string = request.getParameter("sttID");
                    int sttID = Integer.parseInt(sta_string);
                    String bra_string = request.getParameter("brandID");
                    int brandID = Integer.parseInt(bra_string);


        ProductDAO pdao = new ProductDAO();
        pdao.editProduct(pname, Description, Color, OriginalPrice, SalePercent, SellPrice, catId, id, Amount, sttID, brandID, productID);


        request.getRequestDispatcher("ListSellProduct").forward(request, response);
        }

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
