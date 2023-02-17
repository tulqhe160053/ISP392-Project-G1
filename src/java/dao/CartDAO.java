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

                Cart z = new Cart(id,user);
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
        Cart ketqua = null;
        xSql = "select * from Cart where ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getId());
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                int id = rs.getInt("ID");
                
                int user_id = rs.getInt("UserID");
                UserDAO user_dao = new UserDAO();
                Users x = new Users();
                x.setUserID(user_id);
                Users user = user_dao.selectById(x);
                ketqua = new Cart(id, user);
            } else {
                ketqua = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (ketqua);
    }
    
    public Cart selectByUserId(int userId) {
        Cart ketqua = null;
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
                ketqua = new Cart(id, user);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return ketqua;
    }

    @Override
    public void insert(Cart t) {
        xSql = "insert into Cart (UserID) values (?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getUser().getUserID());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
        }
    }
    
    public void deleteByUserId(int id) {
        try {
            String sql = "delete from Cart where UserID = (?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }    }
    
    @Override
    public int insertAll(ArrayList<Cart> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Cart t) {
        xSql = "delete from Cart where ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getId());
            ps.executeUpdate();
            //con.commit();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
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
