/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.ProductStatus;

/**
 *
 * @author Tu
 */
public class ProductStatusDAO extends MyDAO implements DAOInterface<ProductStatus> {

    @Override
    public ArrayList<ProductStatus> selectAll() {
        ArrayList<ProductStatus> t = new ArrayList<>();
        xSql = "select * from ProductStatus";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int statusID = rs.getInt("StatusID");
                String statusName = rs.getString("StatusName");

                ProductStatus x = new ProductStatus(statusID, statusName);
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
    public ProductStatus selectById(ProductStatus t) {
        ProductStatus ketqua = null;
        xSql = "select * from ProductStatus where StatusID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getStatusID());
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                int statusID = rs.getInt("StatusID");
                String statusName = rs.getString("StatusName");
                ketqua = new ProductStatus(statusID, statusName);
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
    public void insert(ProductStatus t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertAll(ArrayList<ProductStatus> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(ProductStatus t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int deleteAll(ArrayList<ProductStatus> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(int x, ProductStatus t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        ProductStatusDAO dao = new ProductStatusDAO();
        
        for (ProductStatus pro : dao.selectAll()) {
            System.out.println(pro);
        }
    }
}
