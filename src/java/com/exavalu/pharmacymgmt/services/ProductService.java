/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.pharmacymgmt.services;

import com.exavalu.pharmacymgmt.models.Product;
import com.exavalu.pharmacymgmt.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

/**
 * Service methods to connect with the database of products table for CURD
 * operations
 *
 * @author lokesh
 */
public class ProductService {

    private static final Logger log = Logger.getLogger(ProductService.class.getName());

    public static boolean addProduct(Product product){
        boolean result = false;
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "INSERT INTO products (productName,quantity,unitPrice,orderId)VALUES(?,?,?,?);";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, product.getProductName());
                preparedStatement.setInt(2, product.getQuantity());
                preparedStatement.setDouble(3, product.getUnitPrice());
                preparedStatement.setInt(4, product.getOrderId());

                int row = preparedStatement.executeUpdate();

                if (row == 1) {
                    result = true;
                }
            }
        } catch (SQLException ex) {
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            // Construct the error message with date and time
            String errorMessage = timestamp.toString() + ": " + ex.getMessage();
            log.error(errorMessage);
        }
        return result;
    }

    public static List getProductByOrderId(int orderId) {
        List productList = new ArrayList();
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "SELECT *,round((unitPrice*quantity),2) as price from products where orderId = ?";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, orderId);
                try (ResultSet rs = preparedStatement.executeQuery()) {

                    while (rs.next()) {
                        Product product = new Product();
                        product.setProductName(rs.getString("productName"));
                        product.setQuantity(rs.getInt("quantity"));
                        product.setUnitPrice(rs.getDouble("unitPrice"));
                        product.setPrice(rs.getDouble("price"));
                        product.setOrderId(rs.getInt("orderId"));
                        productList.add(product);
                    }
                }
            }
        } catch (SQLException ex) {
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            // Construct the error message with date and time
            String errorMessage = timestamp.toString() + ": " + ex.getMessage();
            log.error(errorMessage);
        }
        return productList;
    }

    public static boolean removeProduct(int orderId, String productName) {
        boolean result = false;
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "DELETE FROM products  where productName =? and orderId=?";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, productName);
                preparedStatement.setInt(2, orderId);
                
                int row = preparedStatement.executeUpdate();
                preparedStatement.close();

                if (row == 1) {
                    result = true;
                }
            }
        } catch (SQLException ex) {
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            // Construct the error message with date and time
            String errorMessage = timestamp.toString() + ": " + ex.getMessage();
            log.error(errorMessage);
        }
        return result;
    }
}
