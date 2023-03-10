/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import Model.Role;
import Model.UserStatus;
import Model.Users;

/**
 *
 * @author Tu
 */
public class UserDAO extends MyDAO implements DAOInterface<Users> {

    @Override
    public ArrayList<Users> selectAll() {
        ArrayList<Users> t = new ArrayList<>();
        xSql = "select * from Users";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("UserID");
                String userName = rs.getString("Username");
                String password = rs.getString("Password");
                String gender = rs.getString("gender");
                String email = rs.getString("Email");
                String phoneNum = rs.getString("PhoneNum");
                int role_id = rs.getInt("RoleID");

                RoleDAO dao = new RoleDAO();
                Role role = dao.selectById(new Role(role_id, null));

                int userStatus_id = rs.getInt("statusId");

                UserStatusDAO userDao = new UserStatusDAO();
                UserStatus status = userDao.selectById(new UserStatus(userStatus_id, null));

                Users x = new Users(userId, userName, password, gender, email, phoneNum, role, status);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    @Override
    public Users selectById(Users t) {
        Users ketqua = null;
        xSql = "select * from Users where UserID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getUserID());
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                int userId = rs.getInt("UserID");
                String userName = rs.getString("Username");
                String password = rs.getString("Password");
                String gender = rs.getString("gender");
                String email = rs.getString("Email");
                String phoneNum = rs.getString("PhoneNum");
                int role_id = rs.getInt("RoleID");

                RoleDAO dao = new RoleDAO();
                Role role = dao.selectById(new Role(role_id, null));

                int userStatus_id = rs.getInt("statusId");

                UserStatusDAO userDao = new UserStatusDAO();
                UserStatus status = userDao.selectById(new UserStatus(userStatus_id, null));

                ketqua = new Users(userId, userName, password, gender, email, phoneNum, role, status);
            } else {
                ketqua = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (ketqua);
    }

    public Users getById(int userId) {
        Users ketqua = null;
        xSql = "select * from Users where UserID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                String userName = rs.getString("Username");
                String password = rs.getString("Password");
                String gender = rs.getString("gender");
                String email = rs.getString("Email");
                String phoneNum = rs.getString("PhoneNum");
                int role_id = rs.getInt("RoleID");

                RoleDAO dao = new RoleDAO();
                Role role = dao.selectById(new Role(role_id, null));

                int userStatus_id = rs.getInt("statusId");

                UserStatusDAO userDao = new UserStatusDAO();
                UserStatus status = userDao.selectById(new UserStatus(userStatus_id, null));

                ketqua = new Users(userId, userName, password, gender, email, phoneNum, role, status);
            } else {
                ketqua = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (ketqua);
    }

    public Users login(String user, String pass) {

        try {
            String sql = "select UserID , Username , Password , gender , Email,PhoneNum , RoleID, statusId from users  \n"
                    + "where Username = ? and Password = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {

                int userId = rs.getInt("UserID");
                String userName = rs.getString("Username");
                String password = rs.getString("Password");
                String gender = rs.getString("gender");
                String email = rs.getString("Email");
                String phoneNum = rs.getString("PhoneNum");
                int role_id = rs.getInt("RoleID");

                RoleDAO dao = new RoleDAO();
                Role role = dao.selectById(new Role(role_id, null));

                int userStatus_id = rs.getInt("statusId");

                UserStatusDAO userDao = new UserStatusDAO();
                UserStatus status = userDao.selectById(new UserStatus(userStatus_id, null));

                return new Users(userId, userName, password, gender, email, phoneNum, role, status);
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    

    public Users checkUserExist(String user) {

       try {
            String sql = "select UserID , Username , Password , gender , Email,PhoneNum , RoleID, statusId from users  \n"
                    + "where Username = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            
            rs = ps.executeQuery();
            while (rs.next()) {

                int userId = rs.getInt("UserID");
                String userName = rs.getString("Username");
                String password = rs.getString("Password");
                String gender = rs.getString("gender");
                String email = rs.getString("Email");
                String phoneNum = rs.getString("PhoneNum");
                int role_id = rs.getInt("RoleID");

                RoleDAO dao = new RoleDAO();
                Role role = dao.selectById(new Role(role_id, null));

                int userStatus_id = rs.getInt("statusId");

                UserStatusDAO userDao = new UserStatusDAO();
                UserStatus status = userDao.selectById(new UserStatus(userStatus_id, null));

                return new Users(userId, userName, password, gender, email, phoneNum, role, status);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Users checkEmailExist(String email) {

         try {
            String sql = "select UserID , Username , Password , gender , Email,PhoneNum , RoleID, statusId from users  \n"
                    + "where Email = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            
            rs = ps.executeQuery();
            while (rs.next()) {

                int userId = rs.getInt("UserID");
                String userName = rs.getString("Username");
                String password = rs.getString("Password");
                String gender = rs.getString("gender");
                String emaill = rs.getString("Email");
                String phoneNum = rs.getString("PhoneNum");
                int role_id = rs.getInt("RoleID");

                RoleDAO dao = new RoleDAO();
                Role role = dao.selectById(new Role(role_id, null));

                int userStatus_id = rs.getInt("statusId");

                UserStatusDAO userDao = new UserStatusDAO();
                UserStatus status = userDao.selectById(new UserStatus(userStatus_id, null));

                return new Users(userId, userName, password, gender, emaill, phoneNum, role, status);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void register(Users u) {
        try {
            String sql = "insert into users values (? , ? , ? , ? , ?, 3 ,1)";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getGender());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getPhoneNum());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Users getUsersByEmail(String userEmail) {
        Users ketqua = null;
        String query = "select * from Users where email = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, userEmail);
            rs = ps.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("UserID");
                String userName = rs.getString("Username");
                String password = rs.getString("Password");
                String gender = rs.getString("gender");
                String email = rs.getString("Email");
                String phoneNum = rs.getString("PhoneNum");
                int role_id = rs.getInt("RoleID");

                RoleDAO dao = new RoleDAO();
                Role role = dao.selectById(new Role(role_id, null));

                int userStatus_id = rs.getInt("statusId");

                UserStatusDAO userDao = new UserStatusDAO();
                UserStatus status = userDao.selectById(new UserStatus(userStatus_id, null));

                ketqua = new Users(userId, userName, password, gender, email, phoneNum, role, status);
            } else {
                ketqua = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (ketqua);
    }

    public boolean updatePassword(String userEmail, String newPassword) {
        Users change = getUsersByEmail(userEmail);
        String query = "update Users set password=? where email=?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, userEmail);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static int randomNumber(int min, int max) {
        Random rnd = new Random();
        return rnd.nextInt((max - min) + 1) + min;
    }

    public String RandomPassword(int numberOfCharactor) {
        String alpha = "abcdefghijklmnopqrstuvwxyz"; // a-z
        String alphaUpperCase = alpha.toUpperCase(); // A-Z
        String digits = "0123456789"; // 0-9
        String ALPHA_NUMERIC = alpha + alphaUpperCase + digits;
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < numberOfCharactor; i++) {
            int number = randomNumber(0, ALPHA_NUMERIC.length() - 1);
            char ch = ALPHA_NUMERIC.charAt(number);
            sb.append(ch);
        }
        return sb.toString();
    }

    public void editUser(String userName, String gender, String email, String phoneNum, int userId) {
        String query = "update Users\n"
                + "set Username = ?,\n"
                + "gender = ?,\n"
                + "Email = ?,\n"
                + "PhoneNum = ?\n"
                //+ "statusId = ?\n"
                + "where UserID = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, gender);
            ps.setString(3, email);
            ps.setString(4, phoneNum);
            //ps.setInt(5, status.getId());
            ps.setInt(5, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public List<Users> searchName(String txt) {
        List<Users> t = new ArrayList<>();
        String sql = "select UserID , Username , Password, gender , Email,PhoneNum , r.RoleName , us.StatusName from users u\n"
                + " join role r \n"
                + " on r.roleID = u.roleID\n"
                + " join userstatus us\n"
                + " on us.ID = u.statusId\n"
                + " where Username like ? or Email like ? or PhoneNum like ? ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + txt + "%");
            ps.setString(2, "%" + txt + "%");
            ps.setString(3, "%" + txt + "%");

            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role(rs.getString(7));
                UserStatus u = new UserStatus(rs.getString(8));
                t.add(new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), r, u));
            }
        } catch (Exception e) {
        }
        return t;
    }

     

    public void updateStatusRole(String role_id, String status_id, String uid) {
        try {
            String sql = "update users set  RoleId = ? , statusId = ? \n"
                    + "where userID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, role_id);
            ps.setString(2, status_id);
            ps.setString(3, uid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void updateStatus(String statusid , String uid){
         try {
            String sql = "update users set statusId = ? \n"
                    + "where userID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, statusid);
            ps.setString(2, uid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Users> getListByPage(List<Users> list,
            int start, int end) {
        ArrayList<Users> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Users> getFilter(String roleid, String statusid) {
        List<Users> user = new ArrayList<>();
        String sql = "select UserID , Username , Password , gender , Email , PhoneNum ,r.RoleName,s.StatusName from users u\n"
                + "join role r \n"
                + "on u.roleID = r.roleID\n"
                + "join userstatus s \n"
                + "on u.statusId = s.ID\n"
                + "where 1=1";
        if (roleid != null && roleid != "") {
            sql += " and u.roleID = " + roleid;
        }
        if (statusid != null && statusid != "") {
            sql += " and u.statusId = " + statusid;
        }
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role(rs.getString(7));
                UserStatus us = new UserStatus(rs.getString(8));
                user.add(new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), r, us));
            }

        } catch (Exception e) {
        }
        return user;
    }

    public Users getUserByID(String uid) {
        String sql = "select UserID , Username , Password, gender , Email,PhoneNum , r.RoleName , us.StatusName from users u\n"
                + "join role r \n"
                + "on r.roleID = u.roleID\n"
                + "join userstatus us\n"
                + "on us.ID = u.statusId\n"
                + "where userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, uid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role(rs.getString(7));
                UserStatus us = new UserStatus(rs.getString(8));
                return new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), r, us);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void adduser(Users u) {
        try {
            String sql = "insert into users(Username,Password,gender , Email , PhoneNum ,roleID , statusId) values (?,?,? , ? , ?, ? ,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getGender());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getPhoneNum());
            ps.setInt(6, u.getRole().getRoleID());
            ps.setInt(7, u.getUserStatus().getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int countGender(String gender) {
        int count = 0;
        try {
            String sql = "select count(*) as 'count' from users where gender = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, gender);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int countUser(int statusID) {
        int count = 0;
        try {
            String sql = "select count(*) as 'count' from users where statusId = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, statusID);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

     public int countUsers() {
        int count = 0;
        String sql = "select count(*) as 'count' from users";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if(rs.next()){
                 count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    @Override
    public void insert(Users t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertAll(ArrayList<Users> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Users t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int deleteAll(ArrayList<Users> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(int x, Users t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        Users u = dao.checkEmailExist("admin@fpt.edu.vn");
        System.out.println(u);

    }
}
