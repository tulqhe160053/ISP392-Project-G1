/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tu
 */
public class CartProduct {
    
    private Cart cart;
    private Product product;
    private int amount;

    public CartProduct() {
    }

    public CartProduct(Cart cart, Product product, int amount) {
        this.cart = cart;
        this.product = product;
        this.amount = amount;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "CartProduct{" + "cart=" + cart + ", product=" + product + ", amount=" + amount + '}';
    }
    
    
}
