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
import java.util.List;

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
    
        public List<Orders> getListByPage(List<Orders> list,
            int start, int end) {
        ArrayList<Orders> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
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
     public List<Orders> filterOrdersByDate(String from, String to, String status) {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE 1=1";
        if (from != "" && from != null) {
            sql += " and OrderDate >= '" + from + "'";
        }
        if (to != "" && to != null) {
            sql += " and OrderDate <= '" + to + "'";
        }
        if (status != "" && status != null) {
            sql += " and StatusID = " + status;
        }

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                int userID = rs.getInt("UserID");
                UserDAO user_dao = new UserDAO();
                Users user = user_dao.getById(userID);

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
                list.add(x);
            }

        } catch (Exception e) {
        }
        return list;
    }
       public void updateOrderStatus (String sid , String oid) {
        String sql = "update orders set statusID = ? where ID  = ?"; 
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,sid);
            ps.setString(2,oid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public int countOrder() {
        String sql = "select COUNT (*) from [orders] ";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }
    
     public List<Orders> countUserOrder() {
        List<Orders> list = new ArrayList<>();
        String sql = "select top 3 username , count(totalprice) as 'counts' from users u\n"
                + "join orders o \n"
                + "on u.userID = o.userID\n"
                + "group by username\n"
                + "order by counts desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Users u = new Users(rs.getString(1));
                list.add(new Orders(u, rs.getInt(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

        public int sumTotalOrder() {
        int sum = 0;
        String sql = "SELECT SUM(TotalPrice) AS sum "
                + "FROM ORDERS;";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                sum = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return sum;
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
         
           
    }

}
