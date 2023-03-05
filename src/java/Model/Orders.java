/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Tu
 */
public class Orders {
    private int id;
    private Users user;
    private int totalPrice;
    private String note;
    private ShipAddress shipAddress;
    private OrderStatus orderStatus;
    private String OrderDate;
    private String DeliveryDate;

    public Orders() {
    }

    public Orders(int id) {
        this.id = id;
    }
    
    

    public Orders(int id, Users user, int totalPrice, String note, ShipAddress shipAddress, OrderStatus orderStatus, String OrderDate, String DeliveryDate) {
        this.id = id;
        this.user = user;
        this.totalPrice = totalPrice;
        this.note = note;
        this.shipAddress = shipAddress;
        this.orderStatus = orderStatus;
        this.OrderDate = OrderDate;
        this.DeliveryDate = DeliveryDate;
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

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public ShipAddress getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(ShipAddress shipAddress) {
        this.shipAddress = shipAddress;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getDeliveryDate() {
        return DeliveryDate;
    }

    public void setDeliveryDate(String DeliveryDate) {
        this.DeliveryDate = DeliveryDate;
    }

    @Override
    public String toString() {
        return "Orders{" + "id=" + id + ", user=" + user + ", totalPrice=" + totalPrice + ", note=" + note + ", shipAddress=" + shipAddress + ", orderStatus=" + orderStatus + ", OrderDate=" + OrderDate + ", DeliveryDate=" + DeliveryDate + '}';
    }

    
    
}
