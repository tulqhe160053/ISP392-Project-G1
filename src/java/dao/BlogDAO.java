/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

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
import model.Blog;
import model.Category;
import model.Users;

/**
 *
 * @author Tu
 */
public class BlogDAO extends MyDAO implements DAOInterface<Blog> {

    @Override
    public ArrayList<Blog> selectAll() {
        ArrayList<Blog> t = new ArrayList<>();
        xSql = "select * from Blog";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int blogId = rs.getInt("ID");
                UserDAO dao = new UserDAO();

                int userId = rs.getInt("UserID");
                Users x = new Users();
                x.setUserID(userId);
                Users bloger = dao.selectById(x);

                int catId = rs.getInt("CatID");
                CategoryDAO cat_dao = new CategoryDAO();
                Category category = cat_dao.selectById(new Category(catId, null));

                String title = rs.getString("Title");
                String description = rs.getString("description");
                String content = rs.getString("Content");
                String img = rs.getString("imageLink");
                String createTime = rs.getString("createtime");
                int viewer = rs.getInt("viewer");

                Blog b = new Blog(blogId, bloger, category, title, description, content, img, createTime, viewer);
                t.add(b);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public Blog selectById(int id) {
        xSql = "select * from Blog where ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int blogId = rs.getInt("ID");
                UserDAO dao = new UserDAO();

                int userId = rs.getInt("UserID");
                Users x = new Users();
                x.setUserID(userId);
                Users bloger = dao.selectById(x);

                int catId = rs.getInt("CatID");
                CategoryDAO cat_dao = new CategoryDAO();
                Category category = cat_dao.selectById(new Category(catId, null));

                String title = rs.getString("Title");
                String description = rs.getString("description");
                String content = rs.getString("Content");
                String img = rs.getString("imageLink");
                String createTime = rs.getString("createtime");
                int viewer = rs.getInt("viewer");

                Blog b = new Blog(blogId, bloger, category, title, description, content, img, createTime, viewer);

                return b;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
        public ArrayList<Blog> selectMyAll(int UserID) {
        ArrayList<Blog> t = new ArrayList<>();
        xSql = "select * from Blog where UserID = ? ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1,UserID);
            rs = ps.executeQuery();
            while (rs.next()) {
                int blogId = rs.getInt("ID");
                UserDAO dao = new UserDAO();
                
                int userId = rs.getInt("UserID");
                Users x = new Users();
                x.setUserID(userId);
                Users bloger=dao.selectById(x);
                
                int catId = rs.getInt("CatID");
                CategoryDAO cat_dao = new CategoryDAO();
                Category category = cat_dao.selectById(new Category(catId, null));
                
                String title = rs.getString("Title");
                String description = rs.getString("description");
                String content = rs.getString("Content");
                String img = rs.getString("imageLink");
                String createTime = rs.getString("createtime");
                int viewer = rs.getInt("viewer");
                
                Blog b = new Blog(blogId, bloger, category, title, description, content, img, createTime, viewer);
                t.add(b);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }
         public ArrayList<Blog> selectTop2() {
        ArrayList<Blog> t = new ArrayList<>();
        xSql = "SELECT TOP (3) [ID]\n" +
"      ,[UserID]\n" +
"      ,[CatId]\n" +
"      ,[Title]\n" +
"      ,[description]\n" +
"      ,[Content]\n" +
"      ,[imageLink]\n" +
"      ,[createtime]\n" +
"      ,[viewer]\n" +
"  FROM Blog\n" +
"  order by viewer desc";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int blogId = rs.getInt("ID");
                UserDAO dao = new UserDAO();
                
                int userId = rs.getInt("UserID");
                Users x = new Users();
                x.setUserID(userId);
                Users bloger=dao.selectById(x);
                
                int catId = rs.getInt("CatID");
                CategoryDAO cat_dao = new CategoryDAO();
                Category category = cat_dao.selectById(new Category(catId, null));
                
                String title = rs.getString("Title");
                String description = rs.getString("description");
                String content = rs.getString("Content");
                String img = rs.getString("imageLink");
                String createTime = rs.getString("createtime");
                int viewer = rs.getInt("viewer");
                
                Blog b = new Blog(blogId, bloger, category, title, description, content, img, createTime, viewer);
                t.add(b);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }
    

    public Blog getBlogByID(String bid) {
        String sql = " select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer  from blog b\n"
                + " join category c \n"
                + " on b.CatId = c.CategoryID\n"
                + " join users u\n"
                + " on b.UserID = u.UserID\n"
                + " where b.id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, bid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                return new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Blog> search(String text) {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = " select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer  from blog b\n"
                    + " join category c \n"
                    + " on b.CatId = c.CategoryID\n"
                    + " join users u\n"
                    + " on b.UserID = u.UserID\n"
                    + " where u.userName like ? or b.title like ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + text + "%");
            ps.setString(2, "%" + text + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = " select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink, b.createtime , b.viewer  from blog b\n"
                    + " join category c \n"
                    + " on b.CatId = c.CategoryID\n"
                    + " join users u\n"
                    + " on b.UserID = u.UserID\n";

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> getFilterByCategory(String catid) {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = " select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer  from blog b\n"
                    + " join category c \n"
                    + " on b.CatId = c.CategoryID\n"
                    + " join users u\n"
                    + " on b.UserID = u.UserID\n"
                    + "where b.CatId = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, catid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9)));

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
                return new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }
        
        public void UpdateBlog1(String image,String catid, String title, String des, String content, String blog_id) {
        try {
            String sql = "UPDATE blog SET imageLink = ?, CatId = ? , Title = ? , description = ? , Content = ?   where ID = ?";
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

    public List<Blog> getOldest() {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer  from blog b\n"
                    + "                    join category c \n"
                    + "                   on b.CatId = c.CategoryID\n"
                    + "                    join users u\n"
                    + "                     on b.UserID = u.UserID\n"
                    + "			   order by createtime asc";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> getLatest() {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer  from blog b\n"
                    + "                    join category c \n"
                    + "                   on b.CatId = c.CategoryID\n"
                    + "                    join users u\n"
                    + "                     on b.UserID = u.UserID\n"
                    + "			   order by createtime desc";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> getHighestViewer() {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = "select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink , b.createtime , b.viewer  from blog b\n"
                    + "                    join category c \n"
                    + "                   on b.CatId = c.CategoryID\n"
                    + "                    join users u\n"
                    + "                     on b.UserID = u.UserID\n"
                    + "			   order by viewer desc";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9)));

            }
        } catch (Exception e) {
        }
        return list;
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

    public void UpdateImage(String blog_id, String image) throws IOException, SQLException {

        try {
            String sql = "UPDATE blog SET imageLink = ? WHERE ID = ?";
            ps = con.prepareStatement(sql);
            
            ps.setString(1, image);
            ps.setString(2, blog_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void UpdateBlog(String catid, String title, String des, String content, String blog_id) {
        try {
            String sql = "UPDATE blog set CatId = ? , Title = ? , description = ? , Content = ?   where ID = ?";
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

    public List<Blog> getListByPage(List<Blog> list,
            int start, int end) {
        ArrayList<Blog> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void insertBlog(String userid, String catid, String title, String des, String content, InputStream file, String createtime, String viewer) {

        try {
            String sql = "insert into blog values(?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, userid);
            ps.setString(2, catid);
            ps.setString(3, title);
            ps.setString(4, des);
            ps.setString(5, content);
            ps.setString(7, createtime);
            ps.setString(8, viewer);
            if (file != null) {
                ps.setBlob(6, file);
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
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
        Blog b = new Blog();
        b = bd.selectById(2);
        ArrayList<Blog> t = new ArrayList<>();
        t=bd.selectTop2();
        for (Blog blog : t) {
            System.out.println(blog.toString());
            
        }
       
    }

    @Override
    public Blog selectById(Blog t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
}
