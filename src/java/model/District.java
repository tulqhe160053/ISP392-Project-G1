/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tu
 */
public class District {
    
    private int districtID;
    private String districtName;

    public District() {
    }

    public District(int districtID, String districtName) {
        this.districtID = districtID;
        this.districtName = districtName;
    }

    public int getDistrictID() {
        return districtID;
    }

    public void setDistrictID(int districtID) {
        this.districtID = districtID;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    @Override
    public String toString() {
        return "District{" + "districtID=" + districtID + ", districtName=" + districtName + '}';
    }
    
    
}
