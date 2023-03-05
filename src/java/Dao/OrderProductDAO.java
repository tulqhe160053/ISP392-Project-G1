/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.util.ArrayList;
import Model.OrderProduct;
import Model.Orders;
import Model.Product;

/**
 *
 * @author Tu
 */
public class OrderProductDAO extends MyDAO implements DAOInterface<OrderProduct> {

    @Override
    public ArrayList<OrderProduct> selectAll() {
        ArrayList<OrderProduct> t = new ArrayList<>();
        xSql = "select * from OrderProduct";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("ProductId");
                int orderId = rs.getInt("OrderId");
                int amount = rs.getInt("amount");
                
                ProductDAO product_dao = new ProductDAO();
                Product test = new Product();
                test.setProductID(productId);
                Product product = product_dao.selectById(test);
                
                OrderDAO order_dao = new OrderDAO();
                Orders order = order_dao.getById(orderId);

                OrderProduct x = new OrderProduct(product, order, amount);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    @Override
    public OrderProduct selectById(OrderProduct t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

        public ArrayList<OrderProduct> getByOrderId(int orderId) {
        ArrayList<OrderProduct> t = new ArrayList<>();
        xSql = "select * from OrderProduct where OrderId = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1,orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("ProductId");
                int orderID = rs.getInt("OrderId");
                int amount = rs.getInt("amount");
                
                ProductDAO product_dao = new ProductDAO();
                Product test = new Product();
                test.setProductID(productId);
                Product product = product_dao.selectById(test);
                
                OrderDAO order_dao = new OrderDAO();
                Orders order = order_dao.getById(orderID);

                OrderProduct x = new OrderProduct(product, order, amount);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }
    
    @Override
    public void insert(OrderProduct t) {
        xSql = "insert into OrderProduct (ProductId,OrderId,amount) values (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getProduct().getProductID());
            ps.setInt(2, t.getOrder().getId());
            ps.setInt(3, t.getAmount());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }    }
    
     public OrderProduct mostOrder() {
        String sql = "select top 1 p.productId ,p.ProductName , Sum(orderId) as 'count' from orderproduct o \n"
                + "join product p \n"
                + "on p.productID = o.productId \n"
                + "join orders od\n"
                + "on  od.ID = o.orderId\n"
                + "group by p.productId,p.ProductName\n"
                + "order by count desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2));
                Orders o = new Orders(rs.getInt(3));
                return new OrderProduct(p, o);
            }

        } catch (Exception e) {
        }
        return null;
    }
    
    public ArrayList<OrderProduct> mostOrderTop3() {
        ArrayList<OrderProduct> od = new ArrayList<>();
        String sql = "select top 3 p.productId ,p.ProductName ,p.sellPrice, Sum(orderId) as 'count' from orderproduct o \n"
                + "join product p \n"
                + "on p.productID = o.productId \n"
                + "join orders od\n"
                + "on  od.ID = o.orderId\n"
                + "group by p.productId,p.ProductName,p.sellPrice\n"
                + "order by count desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2),rs.getInt(3));
                Orders o = new Orders(rs.getInt(4));
                od.add(new OrderProduct(p, o));
            }

        } catch (Exception e) {
        }
        return od;
    }

    @Override
    public int insertAll(ArrayList<OrderProduct> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(OrderProduct t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int deleteAll(ArrayList<OrderProduct> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(int x, OrderProduct t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public static void main(String[] args) {
        OrderProductDAO dao = new OrderProductDAO();
        for (OrderProduct orderProduct : dao.getByOrderId(1)) {
            System.out.println(orderProduct);
        }
    }
}
