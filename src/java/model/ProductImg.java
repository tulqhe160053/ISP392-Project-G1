/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tu
 */
public class ProductImg {
    
    private int id;
    private Product product;
    private String productImgUrl;

    public ProductImg() {
    }

    public ProductImg(int id, Product product, String productImgUrl) {
        this.id = id;
        this.product = product;
        this.productImgUrl = productImgUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getProductImgUrl() {
        return productImgUrl;
    }

    public void setProductImgUrl(String productImgUrl) {
        this.productImgUrl = productImgUrl;
    }

    @Override
    public String toString() {
        return "ProductImg{" + "id=" + id + ", product=" + product + ", productImgUrl=" + productImgUrl + '}';
    }

    
}
