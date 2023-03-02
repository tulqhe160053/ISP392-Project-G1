/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.util.ArrayList;
import Model.City;
import Model.District;
import Model.ShipAddress;
import Model.Users;

/**
 *
 * @author Tu
 */
public class ShipAddressDAO extends MyDAO implements DAOInterface<ShipAddress> {

    @Override
    public ArrayList<ShipAddress> selectAll() {
        ArrayList<ShipAddress> t = new ArrayList<>();
        xSql = "select * from ShipAddress";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */
            while (rs.next()) {
                 int id = rs.getInt("ID");
                 int userId = rs.getInt("UserID");
                 UserDAO user_dao = new UserDAO();
                 Users user = user_dao.getById(userId);
                 
                 String fullName = rs.getString("Fullname");
                 String phoneNum = rs.getString("PhoneNum");
                 
                 int cityId = rs.getInt("ShipCityID");
                 CityDAO city_dao = new CityDAO();
                 City shipCity = city_dao.getById(cityId);
                 
                 int districtId = rs.getInt("DistrictId");
                 DistrictDAO district_dao = new DistrictDAO();
                 District district = district_dao.getById(districtId);
                 
                 String addressDetail = rs.getString("AddressDetail");
                 
                 boolean isUse = rs.getBoolean("isUse");
                 
                 ShipAddress x = new ShipAddress(id, user, fullName, phoneNum, shipCity, district, addressDetail,isUse);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
        //throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public ShipAddress getByShipId(int shipaddressId) {
        ShipAddress ketqua = null;
        xSql = "select * from ShipAddress where ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, shipaddressId);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                int id = rs.getInt("ID");
                 int userId = rs.getInt("UserID");
                 UserDAO user_dao = new UserDAO();
                 Users user = user_dao.getById(userId);
                 
                 String fullName = rs.getString("Fullname");
                 String phoneNum = rs.getString("PhoneNum");
                 
                 int cityId = rs.getInt("ShipCityID");
                 CityDAO city_dao = new CityDAO();
                 City shipCity = city_dao.getById(cityId);
                 
                 int districtId = rs.getInt("DistrictId");
                 DistrictDAO district_dao = new DistrictDAO();
                 District district = district_dao.getById(districtId);
                 
                 String addressDetail = rs.getString("AddressDetail");
                 
                 boolean isUse = rs.getBoolean("isUse");
                 

                ketqua = new ShipAddress(id, user, fullName, phoneNum, shipCity, district, addressDetail,isUse);
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

            while (rs.next()) {
                 int id = rs.getInt("ID");
                 
                 UserDAO user_dao = new UserDAO();
                 Users user = user_dao.getById(UserID);
                 String fullName = rs.getString("Fullname");
                 String phoneNum = rs.getString("PhoneNum");
                 
                 int cityId = rs.getInt("ShipCityID");
                 CityDAO city_dao = new CityDAO();
                 City shipCity = city_dao.getById(cityId);
                 
                 int districtId = rs.getInt("DistrictId");
                 DistrictDAO district_dao = new DistrictDAO();
                 District district = district_dao.getById(districtId);
                 
                 String addressDetail = rs.getString("AddressDetail");
                 
                 boolean isUse = rs.getBoolean("isUse");
                 
                 ShipAddress x = new ShipAddress(id, user, fullName, phoneNum, shipCity, district, addressDetail, isUse);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return t;
    }

    @Override
    public void insert(ShipAddress t) {
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
    
    public ShipAddress getById(int id) {
        ShipAddress ketqua = null;
            xSql = "select * from ShipAddress where ID = ?";
            try {
                ps = con.prepareStatement(xSql);
                ps.setInt(1, id );
                rs = ps.executeQuery();
                /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
             Thus the first rs.next() statement moves the cursor to the first record
                 */

                while (rs.next()) {
                     

                     int UserID = rs.getInt("UserID");
                     UserDAO user_dao = new UserDAO();
                     Users user = user_dao.getById(UserID);
                     String fullName = rs.getString("Fullname");
                     String phoneNum = rs.getString("PhoneNum");

                     int cityId = rs.getInt("ShipCityID");
                     CityDAO city_dao = new CityDAO();
                     City shipCity = city_dao.getById(cityId);

                     int districtId = rs.getInt("DistrictId");
                     DistrictDAO district_dao = new DistrictDAO();
                     District district = district_dao.getById(districtId);

                     String addressDetail = rs.getString("AddressDetail");
                     
                     boolean isUse = rs.getBoolean("isUse");

                     ketqua = new ShipAddress(id, user, fullName, phoneNum, shipCity, district, addressDetail,isUse);
                }
                rs.close();
                ps.close();
            } catch (Exception e) {
            }
            return ketqua;
    }
    
    
    public static void main(String[] args) {
        ShipAddressDAO dao = new ShipAddressDAO();
        for (ShipAddress o : dao.selectAll()) {
            System.out.println(o);
        }
    }
    public void deleteAddress(String aid) {
        String query = "delete from ShipAddress\n" +
                "where id = ?";
        try{
            ps = con.prepareStatement(query);
            ps.setString(1, aid);
            ps.executeUpdate();
        } catch (Exception e){
        }
    }
    public void addshipaddress(int userId, String Fullname, String PhoneNum, int City, int District, String AddressDetail){
        String query = "insert into dbo.[ShipAddress] \n" +
                    "(UserID, Fullname, PhoneNum, ShipCityID, DistrictId, AddressDetail) \n" +
                    "values (?,?,?,?,?,?)";
        try{
            ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, Fullname);
            ps.setString(3, PhoneNum);
            ps.setInt(4, City);
            ps.setInt(5, District);
            ps.setString(6, AddressDetail);
            ps.executeUpdate();
        } catch (Exception e){
        }
    }


    public void editshipaddress( String Fullname, String PhoneNum, int City, int District, String AddressDetail, int ID){
        String query = "update ShipAddress\n" +
                        "set Fullname = ?,\n" +
                        "PhoneNum = ?,\n" +
                        "ShipCityID = ?,\n" +
                        "DistrictId = ?,\n" +
                        "AddressDetail = ?\n" +
                        "where ID = ?";
        try{
            ps = con.prepareStatement(query);
            ps.setString(1, Fullname);
            ps.setString(2, PhoneNum);
            ps.setInt(3, City);
            ps.setInt(4, District);
            ps.setString(5, AddressDetail);
            ps.setInt(6, ID);
            ps.executeUpdate();
        } catch (Exception e){
        }
    }
    
    public void editIsuse( int ID){
        String query = "update ShipAddress set isUse = ? where ID = ?";
        try{
            ps = con.prepareStatement(query);
            ps.setBoolean(1, false);
            ps.setInt(2, ID);
            ps.executeUpdate();
        } catch (Exception e){
        }
    }
    
    public void updateIsuse(int ID){
        String query = "update ShipAddress set isUse = ? where ID = ?";
        try{
            ps = con.prepareStatement(query);
            ps.setBoolean(1, true);
            ps.setInt(2, ID);
            ps.executeUpdate();
        } catch (Exception e){
        }
    }
}