/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Feedback;

/**
 *
 * @author Trang
 */
public class FeedbackDAO extends MyDAO {
    public void addFeedback(Feedback feedback) {
        String sql = "insert into Feedback values (?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, feedback.getUserID());
            ps.setInt(2, feedback.getProductID());
            ps.setInt(3, feedback.getStar());
            ps.setString(4, feedback.getFeedbackDetail());
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
   
  