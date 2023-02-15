/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.util.ArrayList;
import model.Orders;
import model.OrderStatus;
import model.ShipAddress;
import model.Users;

/**
 *
 * @author Tu
 */
public class OrderDAO extends MyDAO implements DAOInterface<Orders> {

    @Override
    public ArrayList<Orders> selectAll() {
        ArrayList<Orders> t = new ArrayList<>();
        xSql = "select * from Orders";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                int userId = rs.getInt("UserID");
                UserDAO user_dao = new UserDAO();
                Users user = user_dao.getById(userId);

                int totalPrice = rs.getInt("TotalPrice");
                String note = rs.getString("Note");

                int shipId = rs.getInt("ShipId");
                ShipAddressDAO shipAddress_dao = new ShipAddressDAO();
                ShipAddress shipAddress = shipAddress_dao.getById(shipId);

                int orderStatusId = rs.getInt("StatusID");
                OrderStatusDAO orderStatus_dao = new OrderStatusDAO();
                OrderStatus orderStatus = orderStatus_dao.getById(orderStatusId);

                String OrderDate = rs.getString("OrderDate");
                String DeliveryDate = rs.getString("DeliveryDate");

                Orders x = new Orders(id, user, totalPrice, note, shipAddress, orderStatus, OrderDate, DeliveryDate);
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
    public Orders selectById(Orders t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Orders getById(int orderId) {
        Orders ketqua = null;
        xSql = "select * from Orders where ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                int id = rs.getInt("ID");
                int userId = rs.getInt("UserID");
                UserDAO user_dao = new UserDAO();
                Users user = user_dao.getById(userId);

                int totalPrice = rs.getInt("TotalPrice");
                String note = rs.getString("Note");

                int shipId = rs.getInt("ShipId");
                ShipAddressDAO shipAddress_dao = new ShipAddressDAO();
                ShipAddress shipAddress = shipAddress_dao.getById(shipId);

                int orderStatusId = rs.getInt("StatusID");
                OrderStatusDAO orderStatus_dao = new OrderStatusDAO();
                OrderStatus orderStatus = orderStatus_dao.getById(orderStatusId);

                String OrderDate = rs.getString("OrderDate");
                String DeliveryDate = rs.getString("DeliveryDate");

                ketqua = new Orders(id, user, totalPrice, note, shipAddress, orderStatus, OrderDate, DeliveryDate);
            } else {
                ketqua = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (ketqua);
    }

    @Override
    public void insert(Orders t) {
        xSql = "insert into Orders (UserID,TotalPrice,Note,ShipId,StatusID,OrderDate,DeliveryDate) values (?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getUser().getUserID());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int insertAll(ArrayList<Orders> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Orders t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int deleteAll(ArrayList<Orders> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(int x, Orders t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        for (Orders orders : dao.selectAll()) {
            System.out.println(orders);
        }
    }

}
