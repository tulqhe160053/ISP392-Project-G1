/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Role;
import model.UserStatus;
import model.Users;

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

    public Users checklogin(String user, String email, String phone) {

        try {
            String sql = "select UserID , Username , Password , gender , Email,PhoneNum , roleID, userStatusId from users  \n"
                    + "where Username = ? or Email = ? or PhoneNum = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, email);
            ps.setString(3, phone);
            rs = ps.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("UserID");
                String userName = rs.getString("Username");
                String password = rs.getString("Password");
                String gender = rs.getString("gender");
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

    public void register(String userName, String pass, String gender, String email, String phoneNum, Role role, UserStatus status) {
        try {
            String sql = "insert into users values (? , ? , ? , ? , ?, ? ,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, pass);
            ps.setString(3, gender);
            ps.setString(4, email);
            ps.setString(5, phoneNum);
            ps.setInt(6, role.getRoleID());
            ps.setInt(7, status.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
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
        ArrayList<Users> list = dao.selectAll();

        for (Users users : list) {
            System.out.println(users);
        }
    }
}
