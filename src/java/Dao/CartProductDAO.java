/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.util.ArrayList;
import Model.Cart;
import Model.CartProduct;
import Model.Product;

/**
 *
 * @author Tu
 */
public class CartProductDAO extends MyDAO implements DAOInterface<CartProduct> {

    @Override
    public ArrayList<CartProduct> selectAll() {
        ArrayList<CartProduct> t = new ArrayList<>();
        xSql = "select * from CartProduct";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int cartid = rs.getInt("cartId");
                int productid = rs.getInt("productId");
                int amount = rs.getInt("Amount");

                CartDAO cart_dao = new CartDAO();
                Cart cart = cart_dao.selectById(new Cart(cartid, null));

                ProductDAO product_dao = new ProductDAO();
                Product test = new Product();
                test.setProductID(productid);
                Product product = product_dao.selectById(test);

                CartProduct z = new CartProduct(cart, product, amount);
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
    public CartProduct selectById(CartProduct t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(CartProduct t) {
        xSql = "insert into CartProduct (cartId,productId,Amount) values (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getCart().getId());
            ps.setInt(2, t.getProduct().getProductID());
            ps.setInt(3, t.getAmount());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public CartProduct getByProIdAndCartId(int productId, int cartId) {
        CartProduct ketqua = null;
        xSql = "select * from CartProduct where cartId = (?) and productId = (?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, cartId);
            ps.setInt(2, productId);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            while (rs.next()) {
                int cartid = rs.getInt("cartId");
                int productid = rs.getInt("productId");
                int amount = rs.getInt("Amount");

                CartDAO cart_dao = new CartDAO();
                Cart cart = cart_dao.selectById(new Cart(cartid, null));

                ProductDAO product_dao = new ProductDAO();
                Product test = new Product();
                test.setProductID(productid);
                Product product = product_dao.selectById(test);

                ketqua = new CartProduct(cart, product, amount);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return ketqua;
    }

    public ArrayList<CartProduct> getByCartId(int cartId) {
        ArrayList<CartProduct> t = new ArrayList<>();
        xSql = "select * from CartProduct where cartId = (?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, cartId);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            while (rs.next()) {
                int cartid = rs.getInt("cartId");
                int productid = rs.getInt("productId");
                int amount = rs.getInt("Amount");

                CartDAO cart_dao = new CartDAO();
                Cart cart = cart_dao.selectById(new Cart(cartid, null));

                ProductDAO product_dao = new ProductDAO();
                Product test = new Product();
                test.setProductID(productid);
                Product product = product_dao.selectById(test);

                CartProduct ketqua = new CartProduct(cart, product, amount);
                t.add(ketqua);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (t);
    }

    public void deleteByCartProduct(int cartId, int productId) {
        try {
            String sql = "DELETE FROM CartProduct WHERE cartId = (?) AND productId = (?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, cartId);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    @Override
    public int insertAll(ArrayList<CartProduct> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(CartProduct t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int deleteAll(ArrayList<CartProduct> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void deleteByCartId(int cartId) {
        xSql = "DELETE FROM CartProduct WHERE cartId = (?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, cartId);
            ps.executeUpdate();
            //con.commit();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(int x, CartProduct t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        CartProductDAO dao = new CartProductDAO();

        for (CartProduct object : dao.selectAll()) {
            System.out.println(object);
        }
    }

}
