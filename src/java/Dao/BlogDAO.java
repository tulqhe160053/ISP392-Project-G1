/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Blog;
import Model.BlogStatus;
import Model.Category;
import Model.Users;

/**
 *
 * @author Tu
 */
public class BlogDAO extends MyDAO implements DAOInterface<Blog> {

    @Override

    public ArrayList<Blog> selectAll() {
        ArrayList<Blog> list = new ArrayList<>();
        try {
            String sql = "select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer , bs.statusName  from blog b\n"
                    + "                join category c \n"
                    + "                 on b.CatId = c.CategoryID\n"
                    + "                 join users u\n"
                    + "                 on b.UserID = u.UserID\n"
                    + "		        join BlogStatus bs \n"
                    + "		        on b.statusID = bs.statusID \n"
                    + "                 where bs.statusid = 1";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                BlogStatus bs = new BlogStatus(rs.getString(10));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), bs));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Blog selectById(int id) {
        String sql = "select  b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer , bs.statusName  from blog b\n"
                + "                join category c \n"
                + "                 on b.CatId = c.CategoryID\n"
                + "                 join users u\n"
                + "                 on b.UserID = u.UserID\n"
                + "		        join BlogStatus bs \n"
                + "		        on b.statusID = bs.statusID \n"
                + "                      where b.id = ? and bs.statusid = 1";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                BlogStatus bs = new BlogStatus(rs.getString(10));
                return new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), bs);

            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Blog> selectMyAll(int UserID) {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer , bs.statusName  from blog b\n"
                + "                join category c \n"
                + "                 on b.CatId = c.CategoryID\n"
                + "                 join users u\n"
                + "                 on b.UserID = u.UserID\n"
                + "		        join BlogStatus bs \n"
                + "		        on b.statusID = bs.statusID \n"
                + "                      where b.UserID = ? and bs.statusid = 1";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                BlogStatus bs = new BlogStatus(rs.getString(10));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), bs));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Blog> selectTop2() {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "select top 2 b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer , bs.statusName  from blog b\n"
                + "                join category c \n"
                + "                 on b.CatId = c.CategoryID\n"
                + "                 join users u\n"
                + "                 on b.UserID = u.UserID\n"
                + "		    join BlogStatus bs \n"
                + "		    on b.statusID = bs.statusID \n"
                + "                 where bs.statusid = 1"
                + "                 order by viewer desc";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                BlogStatus bs = new BlogStatus(rs.getString(10));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), bs));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Blog getBlogByID(String bid) {
        String sql = "select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer , bs.statusName  from blog b\n"
                + "                join category c \n"
                + "                 on b.CatId = c.CategoryID\n"
                + "                 join users u\n"
                + "                 on b.UserID = u.UserID\n"
                + "		        join BlogStatus bs \n"
                + "		        on b.statusID = bs.statusID \n"
                + "                      where b.id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, bid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                BlogStatus bs = new BlogStatus(rs.getString(10));
                return new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), bs);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Blog> search(String text) {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer , bs.statusName  from blog b\n"
                    + "                join category c \n"
                    + "                 on b.CatId = c.CategoryID\n"
                    + "                 join users u\n"
                    + "                 on b.UserID = u.UserID\n"
                    + "		        join BlogStatus bs \n"
                    + "		        on b.statusID = bs.statusID \n"
                    + "                      where u.UserName like ? or b.title like ?";

            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + text + "%");
            ps.setString(2, "%" + text + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                BlogStatus bs = new BlogStatus(rs.getString(10));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), bs));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer , bs.statusName  from blog b\n"
                    + "                join category c \n"
                    + "                 on b.CatId = c.CategoryID\n"
                    + "                 join users u\n"
                    + "                 on b.UserID = u.UserID\n"
                    + "		        join BlogStatus bs \n"
                    + "		        on b.statusID = bs.statusID \n";

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                BlogStatus bs = new BlogStatus(rs.getString(10));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), bs));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> getFilter(String catid, String blogstatusid) {
        List<Blog> list = new ArrayList<>();

        String sql = "select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer , bs.statusName  from blog b\n"
                + "                join category c \n"
                + "                 on b.CatId = c.CategoryID\n"
                + "                 join users u\n"
                + "                 on b.UserID = u.UserID\n"
                + "		        join BlogStatus bs \n"
                + "		        on b.statusID = bs.statusID \n"
                + "		        where 1=1";
        if (catid != null && catid != "") {
            sql += " and b.CatId = " + catid;
        }
        if (blogstatusid != null && blogstatusid != "") {
            sql += " and b.statusID = " + blogstatusid;
        }
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                BlogStatus bs = new BlogStatus(rs.getString(10));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), bs));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public Blog getBlogByID1(int id) {
        String sql = " select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer  from blog b\n"
                + " join category c \n"
                + " on b.CatId = c.CategoryID\n"
                + " join users u\n"
                + " on b.UserID = u.UserID\n"
                + " where b.id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                BlogStatus bs = new BlogStatus(rs.getString(10));
                return new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), bs);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void UpdateBlog1(String image, String catid, String title, String des, String content, String blog_id) {
        try {
            String sql = "UPDATE Blog SET imageLink = ?, CatId = ? , Title = ? , description = ? , Content = ?   where ID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, image);
            ps.setString(2, catid);
            ps.setString(3, title);
            ps.setString(4, des);
            ps.setString(5, content);
            ps.setString(6, blog_id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    
    

    public void deleteBlog(String bid) {
        try {
            String sql = "delete from blog where id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, bid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateImage(String blog_id, String image) {

        try {
            String sql = "UPDATE blog SET imageLink = ? WHERE ID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, image);
            ps.setString(2, blog_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    public void UpdateBlog(String catid, String title, String des, String content, String blog_id) {
        try {
            String sql = "UPDATE blog SET CatId = ? , Title = ? , description = ? , Content = ?   where ID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, catid);
            ps.setString(2, title);
            ps.setString(3, des);
            ps.setString(4, content);
            ps.setString(5, blog_id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void UpdateStatus(String id, String status) {
        try {
            String sql = "UPDATE blog SET statusID = ? where ID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, id);

            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public List<Blog> getListByPage(List<Blog> list,
            int start, int end) {
        ArrayList<Blog> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    
    public int getBlogByViewer(int catid) {
        int count = 0;
        try {
            String sql = "select viewer , count(id) as 'count' from blog \n"
                    + "where catid = ?\n"
                    + "group by viewer";
            ps = con.prepareStatement(sql);
            ps.setInt(1, catid);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }
    
     public int countBlogByCategory(int catid) {
        int count = 0;
        try {
            String sql = "select count(id) as 'count' from blog \n"
                    + "where catid = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, catid);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

     public int AverageStar() {
        int count = 0;
        try {
            String sql = "select avg(star) as avg_star from feedback";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }
    

     
    @Override
    public void insert(Blog t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertAll(ArrayList<Blog> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Blog t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int deleteAll(ArrayList<Blog> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(int x, Blog t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        BlogDAO bd = new BlogDAO();
        for (Blog blog : bd.selectAll()) {
            System.out.println(blog);

        }

    }

    @Override
    public Blog selectById(Blog t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void updateView(int id){
        try {
            String sql = "UPDATE Blog SET viewer = viewer+1  where ID = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
