package dao;


import entity.Category;
import entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author trinh
 */
public class DAO {



    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Clothes_web", "root", "123456");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }




    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DAO().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        1));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select *from category";
        try {
            conn = new DAO().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                                rs.getString(2)
                        )
                );


            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product"+ "\n" +
                "where cateID=?";
        try {
            conn = new DAO().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1,cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        1));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductID(String id) {
        String query = "select * from product"+ "\n" +
                "where id=?";
        try {
            conn = new DAO().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1,id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        1);
            }
        } catch (Exception e) {
        }
        return null;
    }
    public Product getLast() {
        String query = "select top 1 * from product\n"
                + "order by id desc";
        try {
            conn = new DAO().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        1);
            }
        } catch (Exception e) {
        }
        return null;
    }
    public Product getProduct(String txt) {
        String query = "select * from product where id = ?";
        List<Product> list = new ArrayList<>();
        try {
            conn = new DAO().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, txt);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    //    public static void main(String[] args) {
//
//
//        try {
//            System.out.println(new DAO().getConnection());
//            System.out.println("Succes!!!!!!!!!!!!");
//        } catch (Exception e) {
//
//        }
//    }
    public static void main(String[] args) {

        DAO dao = new DAO();
//        List<Product> list = dao.getAllProduct();
        List<Category> listC = dao.getAllCategory();
        List<Product> listPC = dao.getProductCID("2");
        Product listPI = dao.getProductID("2");

        System.out.println(listPI);

        for (Product c : listPC) {
            System.out.println(c);
        }


    }


}