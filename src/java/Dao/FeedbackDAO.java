/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.util.ArrayList;
import Model.Feedback;
import Model.Product;
import Model.Users;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Trang
 */
public class FeedbackDAO extends MyDAO {

    public ArrayList<Feedback> getAllFeedbacks() {
        String sql = "SELECT * FROM Feedback";
        try {
            ArrayList<Feedback> lsFeedback = new ArrayList<>();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getInt("UserID"));
                Product p = new Product(rs.getInt("ProductId"));
                Feedback f = new Feedback(
                        rs.getInt("ID"),
                        u,
                        p,
                        rs.getInt("Star"),
                        rs.getString("FeedbackDetail")
                );
                lsFeedback.add(f);
            }
            return lsFeedback;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Feedback getFeedbacksById(int id) {
        String query = "SELECT * FROM Feedback WHERE ID = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Users u = new Users(rs.getInt("UserID"));
                Product p = new Product(rs.getInt("ProductId"));
                Feedback f = new Feedback(
                        rs.getInt("ID"),
                        u,
                        p,
                        rs.getInt("Star"),
                        rs.getString("FeedbackDetail")
                );
                return f;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addFeedback(Feedback feedback, Product p, Users u) {
        String sql = "insert into Feedback values (?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, u.getUserID());
            ps.setInt(2, p.getProductID());
            ps.setInt(3, feedback.getStar());
            ps.setString(4, feedback.getFeedbackDetail());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void editFeedback(int star, String des, int id) {
        String sql = "update  Feedback set Star = ?, FeedbackDetail = ? where ID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, star);
            ps.setString(2, des);
            ps.setInt(3, id);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteFeedback(int id) {
        String query = "delete from feedback where id = ?";
        try{
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e){
        }
    }
    
        public ArrayList<Feedback> getFeedbacksByUserId(int userId) {
        String query = "SELECT * FROM Feedback WHERE UserID = ?";
        try {
            ArrayList<Feedback> lsFeedback = new ArrayList<>();
            ps = con.prepareStatement(query);      
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getInt("UserID"));
                Product p = new Product(rs.getInt("ProductId"));
                Feedback f = new Feedback(
                        rs.getInt("ID"),
                        u,
                        p,
                        rs.getInt("Star"),
                        rs.getString("FeedbackDetail")
                );
                lsFeedback.add(f);
            }
            return lsFeedback;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int countStar(int star) {
        int count = 0;
        String sql = "select count(*) as count_star from feedback where star = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, star);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public Feedback getProductStar() {
        try {
            String sql = "select top 1 p.productName , count(star) as max_star from feedback f \n"
                    + "join product p \n"
                    + "on f.productID = p.productID\n"
                    + "where star = 5 \n"
                    + "group by p.productName\n"
                    + "order by max_star desc";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getString(1));
                return new Feedback(p, rs.getInt(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Feedback> getUserFeedback() {
        List<Feedback> list = new ArrayList<>();
        try {
            String sql = "select top 3 userName , count(star) as count_star  from feedback f \n"
                    + "join users u \n"
                    + "on f.userID = u.userID\n"
                    + "group by userName\n"
                    + "order by count_star desc";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(1));
                list.add(new Feedback(u, rs.getInt(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Feedback> getProductFeedback() {
        List<Feedback> list = new ArrayList<>();
        try {
            String sql = "select top 3 productName , avg(star) as stars from feedback f \n"
                    + "join product p \n"
                    + "on f.productID = p.productID\n"
                    + "group by productName\n"
                    + "order by stars desc ";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString(1));
                list.add(new Feedback(p, rs.getInt(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        List<Feedback> f = dao.getProductFeedback();
        System.out.println(f.toString());
    }

}
