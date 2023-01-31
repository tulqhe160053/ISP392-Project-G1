/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tu
 */
public class ShipAddress {
    
    private int id;
    private Users user;
    private String fullName;
    private String phoneNum;
    private City shipCity;
    private District district;
    private String addressDetail;

    public ShipAddress() {
    }

    public ShipAddress(int id, Users user, String fullName, String phoneNum, City shipCity, District district, String addressDetail) {
        this.id = id;
        this.user = user;
        this.fullName = fullName;
        this.phoneNum = phoneNum;
        this.shipCity = shipCity;
        this.district = district;
        this.addressDetail = addressDetail;
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public City getShipCity() {
        return shipCity;
    }

    public void setShipCity(City shipCity) {
        this.shipCity = shipCity;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    @Override
    public String toString() {
        return "ShipAddress{" + "id=" + id + ", user=" + user + ", fullName=" + fullName + ", phoneNum=" + phoneNum + ", shipCity=" + shipCity + ", district=" + district + ", addressDetail=" + addressDetail + '}';
    }
    
    
}
