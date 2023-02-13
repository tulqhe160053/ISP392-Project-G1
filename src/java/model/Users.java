/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tu
 */
public class Users {

    private int userID;
    private String userName;
    private String password;
    private String gender;
    private String email;
    private String phoneNum;
    private Role role;
    private UserStatus userStatus;

    public Users() {
    }

    public Users(int userID, String userName, String password, String gender, String email, String phoneNum, Role role, UserStatus userStatus) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.gender = gender;
        this.email = email;
        this.phoneNum = phoneNum;
        this.role = role;
        this.userStatus = userStatus;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public UserStatus getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(UserStatus userStatus) {
        this.userStatus = userStatus;
    }

    @Override
    public String toString() {
        return "Users{" + "userID=" + userID + ", userName=" + userName + ", password=" + password + ", gender=" + gender + ", email=" + email + ", phoneNum=" + phoneNum + ", role=" + role + ", userStatus=" + userStatus + '}';
    }

    
     

}
