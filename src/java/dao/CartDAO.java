/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Cart;
import model.Product;
import model.Users;
import org.apache.catalina.User;

/**
 *
 * @author Tu
 */
public class CartDAO extends MyDAO implements DAOInterface<Cart> {

    @Override
    public ArrayList<Cart> selectAll() {
        ArrayList<Cart> t = new ArrayList<>();
        xSql = "select * from Cart";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                
                int user_id = rs.getInt("UserID");
                UserDAO user_dao = new UserDAO();
                Users x = new Users();
                x.setUserID(user_id);
                Users user = user_dao.selectById(x);
                
                int product_id = rs.getInt("ProductID");
                ProductDAO product_dao = new ProductDAO();
                Product y = new Product();
                y.setProductID(product_id);
                Product product = product_dao.selectById(y);
                
                int amount = rs.getInt("Amount");

                Cart z = new Cart(id,user, product, amount);
                t.add(z);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    @Override
    public Cart selectById(Cart t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public ArrayList<Cart> selectByUserId(int userId) {
        ArrayList<Cart> t = new ArrayList<>();
        xSql = "select * from Cart where UserID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            while (rs.next()) {
                int id = rs.getInt("ID");
                
                int user_id = rs.getInt("UserID");
                UserDAO user_dao = new UserDAO();
                Users x = new Users();
                x.setUserID(user_id);
                Users user = user_dao.selectById(x);
                
                int product_id = rs.getInt("ProductID");
                ProductDAO product_dao = new ProductDAO();
                Product y = new Product();
                y.setProductID(product_id);
                Product product = product_dao.selectById(y);
                
                int amount = rs.getInt("Amount");
                Cart z = new Cart(id,user, product, amount);
                t.add(z);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return t;
    }

    @Override
    public void insert(Cart t) {
        xSql = "insert into Cart (UserID,ProductID,Amount) values (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getUser().getUserID());
            ps.setInt(2, t.getProduct().getProductID());
            ps.setInt(3, t.getAmount());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    @Override
    public int insertAll(ArrayList<Cart> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Cart t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int deleteAll(ArrayList<Cart> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(int x, Cart t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        CartDAO dao = new CartDAO();
        for (Cart arg : dao.selectAll()) {
            System.out.println(arg);
        }
    }
}
