/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Trang
 */
public class Feedback {

    private int id;
    private int userID;
    private int productID;
    private int star;
    private String feedbackDetail;
    
    public Feedback() {
        
    }

    public Feedback(int id, int userID, int productID, int star, String feedbackDetail) {
        this.id = id;
        this.userID = userID;
        this.productID = productID;
        this.star = star;
        this.feedbackDetail = feedbackDetail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getFeedbackDetail() {
        return feedbackDetail;
    }

    public void setFeedbackDetail(String feedbackDetail) {
        this.feedbackDetail = feedbackDetail;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", userID=" + userID + ", productID=" + productID + ", star=" + star + ", feedbackDetail=" + feedbackDetail + '}';
    }
    
    
}
