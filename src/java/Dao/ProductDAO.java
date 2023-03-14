/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.util.ArrayList;
import Model.Brand;
import Model.Category;
import Model.Product;
import Model.ProductStatus;
import Model.Users;

/**
 *
 * @author Tu
 */
public class ProductDAO extends MyDAO implements DAOInterface<Product> {

    @Override
    public ArrayList<Product> selectAll() {
        ArrayList<Product> t = new ArrayList<>();
        xSql = "select * from Product";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                String color = rs.getString("color");
                int originalPrice = rs.getInt("OriginalPrice");
                int sellPrice = rs.getInt("SellPrice");
                int salePercent = rs.getInt("SalePercent");

                int catId = rs.getInt("CatID");
                CategoryDAO cat_dao = new CategoryDAO();
                Category category = cat_dao.selectById(new Category(catId, null));

                int seller_id = rs.getInt("SellerID");

                UserDAO dao = new UserDAO();
                Users x = new Users();
                x.setUserID(seller_id);
                Users seller = dao.selectById(x);

                int amount = rs.getInt("Amount");

                int productStatus_id = rs.getInt("StatusID");
                ProductStatusDAO status_dao = new ProductStatusDAO();
                ProductStatus productStatus = status_dao.selectById(new ProductStatus(productStatus_id, null));

                int brand_id = rs.getInt("BrandID");
                BrandDAO brand_dao = new BrandDAO();
                Brand brand = brand_dao.selectById(new Brand(brand_id, null));

                Product y = new Product(productID, productName, description, color, originalPrice,
                        sellPrice, salePercent, category, seller, amount, productStatus, brand);
                t.add(y);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    @Override
    public Product selectById(Product t) {
        Product ketqua = null;
        xSql = "select * from Product where ProductID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, t.getProductID());
            rs = ps.executeQuery();
            /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
             */

            if (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                String color = rs.getString("color");
                int originalPrice = rs.getInt("OriginalPrice");
                int sellPrice = rs.getInt("SellPrice");
                int salePercent = rs.getInt("SalePercent");

                int catId = rs.getInt("CatID");
                CategoryDAO cat_dao = new CategoryDAO();
                Category category = cat_dao.selectById(new Category(catId, null));

                int seller_id = rs.getInt("SellerID");

                UserDAO dao = new UserDAO();
                Users x = new Users();
                x.setUserID(seller_id);
                Users seller = dao.selectById(x);

                int amount = rs.getInt("Amount");

                int productStatus_id = rs.getInt("StatusID");
                ProductStatusDAO status_dao = new ProductStatusDAO();
                ProductStatus productStatus = status_dao.selectById(new ProductStatus(productStatus_id, null));

                int brand_id = rs.getInt("BrandID");
                BrandDAO brand_dao = new BrandDAO();
                Brand brand = brand_dao.selectById(new Brand(brand_id, null));

                ketqua = new Product(productID, productName, description, color, originalPrice,
                        sellPrice, salePercent, category, seller, amount, productStatus, brand);
            } else {
                ketqua = null;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return (ketqua);
    }

    public ArrayList<Product> getProductsByName(String xxName) {
        ArrayList<Product> t = new ArrayList<>();
        xSql = "select * from Product WHERE ProductName like '%" + xxName + "%'";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                String color = rs.getString("color");
                int originalPrice = rs.getInt("OriginalPrice");
                int sellPrice = rs.getInt("SellPrice");
                int salePercent = rs.getInt("SalePercent");

                int catId = rs.getInt("CatID");
                CategoryDAO cat_dao = new CategoryDAO();
                Category category = cat_dao.selectById(new Category(catId, null));

                int seller_id = rs.getInt("SellerID");

                UserDAO dao = new UserDAO();
                Users x = new Users();
                x.setUserID(seller_id);
                Users seller = dao.selectById(x);

                int amount = rs.getInt("Amount");

                int productStatus_id = rs.getInt("StatusID");
                ProductStatusDAO status_dao = new ProductStatusDAO();
                ProductStatus productStatus = status_dao.selectById(new ProductStatus(productStatus_id, null));

                int brand_id = rs.getInt("BrandID");
                BrandDAO brand_dao = new BrandDAO();
                Brand brand = brand_dao.selectById(new Brand(brand_id, null));

                Product y = new Product(productID, productName, description, color, originalPrice,
                        sellPrice, salePercent, category, seller, amount, productStatus, brand);
                t.add(y);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public ArrayList<Product> selectAllByCatId(Category cat) {
        ArrayList<Product> t = new ArrayList<>();
        xSql = "select * from Product where CatID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, cat.getCategoryId());
            rs = ps.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                String color = rs.getString("color");
                int originalPrice = rs.getInt("OriginalPrice");
                int sellPrice = rs.getInt("SellPrice");
                int salePercent = rs.getInt("SalePercent");
                int seller_id = rs.getInt("SellerID");

                UserDAO dao = new UserDAO();
                Users x = new Users();
                x.setUserID(seller_id);
                Users seller = dao.selectById(x);

                int amount = rs.getInt("Amount");

                int productStatus_id = rs.getInt("StatusID");
                ProductStatusDAO status_dao = new ProductStatusDAO();
                ProductStatus productStatus = status_dao.selectById(new ProductStatus(productStatus_id, null));

                int brand_id = rs.getInt("BrandID");
                BrandDAO brand_dao = new BrandDAO();
                Brand brand = brand_dao.selectById(new Brand(brand_id, null));

                Product y = new Product(productID, productName, description, color, originalPrice,
                        sellPrice, salePercent, cat, seller, amount, productStatus, brand);
                t.add(y);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public ArrayList<Product> getBySellerID(int seller_id) {
        ArrayList<Product> t = new ArrayList<>();
        xSql = "select * from Product where SellerID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, seller_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String description = rs.getString("Description");
                String color = rs.getString("color");
                int originalPrice = rs.getInt("OriginalPrice");
                int sellPrice = rs.getInt("SellPrice");
                int salePercent = rs.getInt("SalePercent");

                int catId = rs.getInt("CatID");
                CategoryDAO cat_dao = new CategoryDAO();
                Category category = cat_dao.selectById(new Category(catId, null));

                UserDAO dao = new UserDAO();
                Users x = new Users();
                x.setUserID(seller_id);
                Users seller = dao.selectById(x);

                int amount = rs.getInt("Amount");

                int productStatus_id = rs.getInt("StatusID");
                ProductStatusDAO status_dao = new ProductStatusDAO();
                ProductStatus productStatus = status_dao.selectById(new ProductStatus(productStatus_id, null));

                int brand_id = rs.getInt("BrandID");
                BrandDAO brand_dao = new BrandDAO();
                Brand brand = brand_dao.selectById(new Brand(brand_id, null));

                Product y = new Product(productID, productName, description, color, originalPrice,
                        sellPrice, salePercent, category, seller, amount, productStatus, brand);
                t.add(y);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public int countProduct() {
        int count = 0;
        String sql = "select count(*) as 'count' from product";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int countProductbySellerID(int seller_id) {
        int count = 0;
        String sql = "select count(*) as 'count' from product where sellerid = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, seller_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }


    public void AddProduct(Product p) {
        String query = "INSERT INTO Product VALUES (?,?,?,?,?,?,?,?,?, ?,?)";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getDescription());
            ps.setString(3, p.getColor());
            ps.setInt(4, p.getOriginalPrice());
            ps.setInt(5, p.getSellPrice());
            ps.setInt(6, p.getSellPrice());
            ps.setInt(7, p.getCategory().getCategoryId());
            ps.setInt(8, p.getSeller().getUserID());
            ps.setInt(9, p.getAmount());
            ps.setInt(10, p.getProductStatus().getStatusID());
            ps.setInt(11, p.getBrand().getBrandID());

            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    @Override
    public void insert(Product t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertAll(ArrayList<Product> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Product t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int deleteAll(ArrayList<Product> arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(int x, Product t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();

        for (Product pro : dao.selectAllByCatId(new Category(2, ""))) {
            System.out.println(pro);
        }



    }
}
