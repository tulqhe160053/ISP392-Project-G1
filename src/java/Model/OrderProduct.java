/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Tu
 */
public class OrderProduct {
    
    private Product product;
    private Orders order;
    private int amount;

    public OrderProduct() {
    }

    public OrderProduct(Product product, Orders order, int amount) {
        this.product = product;
        this.order = order;
        this.amount = amount;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "OrderProduct{" + "product=" + product + ", order=" + order + ", amount=" + amount + '}';
    }
    
    
}
