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
    private Users user;
    private Product product;
    private int star;
    private String feedbackDetail;
    
    public Feedback() {
        
    }

    public Feedback(Product product, int star) {
        this.product = product;
        this.star = star;
    }

    public Feedback(Users user, int star) {
        this.user = user;
        this.star = star;
    }

    
    public Feedback(int id, Users user, Product product, int star, String feedbackDetail) {
        this.id = id;
        this.user = user;
        this.product = product;
        this.star = star;
        this.feedbackDetail = feedbackDetail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
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
        return "Feedback{" + "id=" + id + ", user=" + user + ", product=" + product + ", star=" + star + ", feedbackDetail=" + feedbackDetail + '}';
    }
    
    
    

    
    
    
 
    
    
}
