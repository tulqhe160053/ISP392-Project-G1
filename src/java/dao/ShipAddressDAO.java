/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.City;
import model.District;
import model.ShipAddress;
import model.Users;

/**
 *
 * @author Tu
 */
public class ShipAddressDAO extends MyDAO implements DAOInterface<ShipAddress> {

    @Override
    public ArrayList<ShipAddress> selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ShipAddress selectById(ShipAddress t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public ArrayList<ShipAddress> getByUserId(int UserID) {
        ArrayList<ShipAddress> t = new ArrayList<>();
        xSql = "select * from ShipAddress where UserID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, UserID);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                 int id = rs.getInt("ID");
                 
                 UserDAO user_dao = new UserDAO();
                 Users user = user_dao.getById(UserID);
                 String fullName = rs.getString("Fullname");
                 String phoneNum = rs.getString("PhoneNum");
                 
                 int cityId = rs.getInt("ShipCityID");
                 CityDAO city_dao = new CityDAO();
                 City shipCity = city_dao.getById(cityId);
                 
                 int districtId = rs.getInt("DistrictId");
                 District district;
                 String addressDetail;
                 
                 ShipAddress x = new ShipAddress(categoryId, categoryName);
                t.add(x);
            } else {
                ketqua = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (ketqua);
    }

    @Override
    public void insert(ShipAddress t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertAll(ArrayList<ShipAddress> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(ShipAddress t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int deleteAll(ArrayList<ShipAddress> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(int x, ShipAddress t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
