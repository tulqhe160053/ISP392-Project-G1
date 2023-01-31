/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tu
 */
public class Product {
    
    private int productID;
    private String productName;
    private String description;
    private String color;
    private int originalPrice;
    private int sellPrice;
    private int salePercent;
    private Category category;
    private Users seller;
    private int amount;
    private ProductStatus productStatus;
    private Brand brand;

    public Product() {
    }

    public Product(int productID, String productName, String description, String color, int originalPrice, int sellPrice, int salePercent, Category category, Users seller, int amount, ProductStatus productStatus, Brand brand) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.color = color;
        this.originalPrice = originalPrice;
        this.sellPrice = sellPrice;
        this.salePercent = salePercent;
        this.category = category;
        this.seller = seller;
        this.amount = amount;
        this.productStatus = productStatus;
        this.brand = brand;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(int originalPrice) {
        this.originalPrice = originalPrice;
    }

    public int getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(int sellPrice) {
        this.sellPrice = sellPrice;
    }

    public int getSalePercent() {
        return salePercent;
    }

    public void setSalePercent(int salePercent) {
        this.salePercent = salePercent;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Users getSeller() {
        return seller;
    }

    public void setSeller(Users seller) {
        this.seller = seller;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public ProductStatus getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(ProductStatus productStatus) {
        this.productStatus = productStatus;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", description=" + description + ", color=" + color + ", originalPrice=" + originalPrice + ", sellPrice=" + sellPrice + ", salePercent=" + salePercent + ", category=" + category + ", seller=" + seller + ", amount=" + amount + ", productStatus=" + productStatus + ", brand=" + brand + '}';
    }
    
    
}
