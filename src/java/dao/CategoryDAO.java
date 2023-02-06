/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Category;

/**
 *
 * @author Tu
 */
public class CategoryDAO extends MyDAO implements DAOInterface<Category> {

    @Override
    public ArrayList<Category> selectAll() {
        ArrayList<Category> t = new ArrayList<>();
        xSql = "select * from Category";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int categoryId = rs.getInt("CategoryID");
                String categoryName = rs.getString("CategoryName");

                Category x = new Category(categoryId, categoryName);
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
    public Category selectById(Category t) {
        Category ketqua = null;
        xSql = "select * from Category where CategoryID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getCategoryId());
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                int categoryId = rs.getInt("CategoryID");
                String categoryName = rs.getString("CategoryName");
                ketqua = new Category(categoryId, categoryName);
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
    public void insert(Category t) {
        xSql = "insert into Category (CategoryName) values (?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, t.getCategoryName());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int insertAll(ArrayList<Category> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Category t) {
        xSql = "delete from Category where CategoryID=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getCategoryId());
            ps.executeUpdate();
            //con.commit();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int deleteAll(ArrayList<Category> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(int catID,Category t) {
        xSql = "update Category set CategoryName=? where CategoryID=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, t.getCategoryName());
            ps.setInt(2, catID);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CategoryDAO cat = new CategoryDAO();
        Category x = new Category();
        
        for (Category ca : cat.selectAll()) {
            System.out.println(ca);
        }
    }

}
