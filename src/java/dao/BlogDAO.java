/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
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

                Blog b = new Blog(blogId, bloger, category, title, description, content, img);
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

                Blog b = new Blog(blogId, bloger, category, title, description, content, img);
                return b;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Blog> search(String text) {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = " select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink  from blog b\n"
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
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = " select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink  from blog b\n"
                    + " join category c \n"
                    + " on b.CatId = c.CategoryID\n"
                    + " join users u\n"
                    + " on b.UserID = u.UserID\n";

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(2));
                Category c = new Category(rs.getString(3));
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> getFilterByCategory(String catid) {
        List<Blog> list = new ArrayList<>();
        try {
            String sql = " select b.id , u.UserName , c.CategoryName , b.title , b.content , b.description , b.imageLink  from blog b\n"
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
                list.add(new Blog(rs.getInt(1), u, c, rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list ;
    }
    
    public List<Blog> getListByPage(List<Blog> list,
            int start, int end) {
        ArrayList<Blog> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
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
        b = bd.selectById(1);

    }

    @Override
    public Blog selectById(Blog t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
