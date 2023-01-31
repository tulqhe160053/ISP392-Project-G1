/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controler;

import dal.CategoryDAO;
import dal.ProductDAO;
import dal.ProductImgDAO;
import dal.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author Tu
 */
public class HomeServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CategoryDAO dao = new CategoryDAO(); 
        ArrayList<Category> listCategorys = dao.selectAll();
       request.setAttribute("listCategorys", listCategorys);
        SliderDAO slideDao = new SliderDAO();
       ArrayList<Slider> listSliders =  slideDao.selectAll();
       request.setAttribute("listSliders",listSliders);
       ProductDAO product_daoo = new ProductDAO();
       ArrayList<Product> list_products =  product_daoo.selectAll();
       request.setAttribute("list_products",list_products);
       ProductImgDAO productImg_dao = new ProductImgDAO();
       ArrayList<ProductImg> list_productImg =  productImg_dao.selectAll();
       request.setAttribute("list_productImg",list_productImg);
       request.setCharacterEncoding("UTF-8");
       String searchName = request.getParameter("searchName");
       if(searchName!=null){
           ArrayList<Product> listSearch_products =  product_daoo.getProductsByName(searchName);
            request.setAttribute("listSearch_products",listSearch_products);
       }
        try {
            String catId_String = request.getParameter("catId");
            if(catId_String.equals("")){
                request.getRequestDispatcher("homepage.jsp").forward(request, response);
            }
            else {
                int catId = Integer.parseInt(catId_String);
                CategoryDAO cat_dao = new CategoryDAO();
                Category cat = cat_dao.selectById(new Category(catId, null));
                request.setAttribute("category",cat);
                ProductDAO product_dao = new ProductDAO();
                ArrayList<Product> listProducts =  product_dao.selectAllByCatId(new Category(catId, null));
                request.setAttribute("listProducts",listProducts);
            }          
        } catch (Exception e) {
            System.err.println(e);
        }
        
       request.getRequestDispatcher("homepage.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
