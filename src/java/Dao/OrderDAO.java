/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import Model.Orders;
import Model.OrderStatus;
import Model.ShipAddress;
import Model.Users;

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
            ps.setInt(2, t.getTotalPrice());
            ps.setString(3, t.getNote());
            ps.setInt(4, t.getShipAddress().getId());
            ps.setInt(5, t.getOrderStatus().getId());
            ps.setString(6, t.getOrderDate());
            ps.setString(7, t.getDeliveryDate());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Orders selectByUserId(int userId) {
        Orders ketqua = null;
        xSql = "select * from Orders where UserID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            while (rs.next()) {
                int id = rs.getInt("ID");
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
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return ketqua;
    }
    
        public ArrayList<Orders> selectAllByUserId(int userId) {
        ArrayList<Orders> t = new ArrayList<>();
        xSql = "select * from Orders where UserID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                int userID = rs.getInt("UserID");
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

    public Orders selectByUserIdAndOrderDate(int userId, String orderDate) {
        Orders ketqua = null;
        xSql = "select * from Orders where UserID = ? and OrderDate = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userId);
            ps.setString(2, orderDate);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            while (rs.next()) {
                int id = rs.getInt("ID");
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
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return ketqua;
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

//        UserDAO user_dao = new UserDAO();
//        
//        ShipAddressDAO shipaddress_dao = new ShipAddressDAO();
//        OrderStatusDAO orderStatus_dao = new OrderStatusDAO();
//        
//        Orders order = new Orders(1, user_dao.getById(2), 3000, null, shipaddress_dao.getById(1), orderStatus_dao.getById(2), "12-02-2023 08:35", "13-02-2023 08:35");
//        dao.insert(order);
//        
//        for (Orders orders : dao.selectAll()) {
//            System.out.println(orders);
//        }
//        
//        Orders order1 = dao.selectAll().get(dao.selectAll().size()-1);
//        
//        System.out.println("---------------------");
//        System.out.println(order1);
         
          for (Orders orders : dao.selectAllByUserId(2)) {
              System.out.println(orders);
        }
    }

}
