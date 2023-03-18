/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.util.ArrayList;
import Model.Category;
import Model.Slider;
import java.sql.SQLException;

/**
 *
 * @author Tu
 */
public class SliderDAO extends MyDAO implements DAOInterface<Slider> {

    @Override
    public ArrayList<Slider> selectAll() {
        ArrayList<Slider> t = new ArrayList<>();
        xSql = "select * from Slider";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String urlImage = rs.getString("urlImage");
                int catId = rs.getInt("CatID");
                CategoryDAO catDao = new CategoryDAO();
                Category cat = catDao.selectById(new Category(catId, null));
                String backLink = rs.getString("BackLink");
                Slider x = new Slider(id, urlImage, cat, backLink);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }
    
     public int countSlider(){
        int count = 0 ;
        String sql = "select count(*) as counts from slider";
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
     
     public void InsertSlider(String imageLink, String catid ) {
        try {
            String sql = "insert into dbo.[Slider] \n" +
                    "(urlImage, CatID) \n" +
                    "values (?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, imageLink);
            ps.setString(2, catid);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
        public void deleteSlider(int id) {
            String query = "delete from slider where id = ?";
            try{
                ps = con.prepareStatement(query);
                ps.setInt(1, id);
                ps.executeUpdate();
            } catch (Exception e){
            }
    }

    @Override
    public Slider selectById(Slider t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Slider t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertAll(ArrayList<Slider> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Slider t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int deleteAll(ArrayList<Slider> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(int x, Slider t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        SliderDAO sds = new SliderDAO();
        ArrayList<Slider> list = sds.selectAll();
        System.out.println(list.get(0).getUrlImage());
    }
}
