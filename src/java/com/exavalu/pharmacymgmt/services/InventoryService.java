/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.pharmacymgmt.services;

import com.exavalu.pharmacymgmt.models.Inventory;
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
 * Service methods to connect with the database of inventory table for CURD
 * operations
 *
 * @author mavanth
 */
public class InventoryService {

    private static final Logger log = Logger.getLogger(InventoryService.class.getName());

    public static List getAllInventory() {

        List inventoryList = new ArrayList();
        String sql = "SELECT * FROM inventory";

        try (Connection con = JDBCConnectionManager.getConnection()) {
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                //System.out.println(sql);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Inventory inventory = new Inventory();
                        inventory.setProductNumber(rs.getInt("productNumber"));
                        inventory.setProductName(rs.getString("productName"));
                        inventory.setQuantity(rs.getInt("quantity"));
                        inventory.setUnitPrice(rs.getDouble("unitPrice"));
                        inventory.setExpiryDate(rs.getString("expiryDate"));
                        inventory.setShelfNumber(rs.getString("shelfNumber"));

                        inventoryList.add(inventory);

                    }
                }
            }
        } catch (SQLException ex) {
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            // Construct the error message with date and time
            String errorMessage = timestamp.toString() + ": " + ex.getMessage();
            //System.out.println(errorMessage);
            log.error(errorMessage);
        }
        //System.err.println("Total rows:" + inventoryList.size());

        return inventoryList;
    }

    public static boolean addInventory(Inventory inventory) {
        boolean result = false;
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "INSERT INTO inventory(productName,quantity,unitPrice,expiryDate,shelfNumber) "
                    + "VALUES(? ,? ,? ,? ,?)";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, inventory.getProductName());
                preparedStatement.setInt(2, inventory.getQuantity());
                preparedStatement.setDouble(3, inventory.getUnitPrice());
                preparedStatement.setString(4, inventory.getExpiryDate());
                preparedStatement.setString(5, inventory.getShelfNumber());

                //System.out.println("Add inventory ps: " + sql);
                int row = preparedStatement.executeUpdate();

                if (row == 1) {
                    result = true;
                }
            }
        } catch (SQLException ex) {
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            // Construct the error message with date and time
            String errorMessage = timestamp.toString() + ": " + ex.getMessage();
            //System.out.println(errorMessage);
            log.error(errorMessage);
        }

        return result;
    }

    public static boolean updateInventory(Inventory inventory) {

        boolean result = false;
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "UPDATE inventory SET productName = ? ,quantity = ? ,unitPrice = ? ,expiryDate = ? ,shelfNumber = ? where productNumber = ?";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, inventory.getProductName());
                preparedStatement.setInt(2, inventory.getQuantity());
                preparedStatement.setDouble(3, inventory.getUnitPrice());
                preparedStatement.setString(4, inventory.getExpiryDate());
                preparedStatement.setString(5, inventory.getShelfNumber());
                preparedStatement.setInt(6, inventory.getProductNumber());

                int row = preparedStatement.executeUpdate();
                //System.out.println(preparedStatement);

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

    public static boolean deleteInventory(Inventory inventory) {

        boolean result = false;
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "UPDATE inventory SET status = 0 WHERE productNumber = ?";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, inventory.getProductNumber());
                int row = preparedStatement.executeUpdate();
                if (row == 1) {
                    result = true;
                }
            }
        } catch (SQLException ex) {
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            // Construct the error message with date and time
            String errorMessage = timestamp.toString() + ": " + ex.getMessage();
            //System.out.println(errorMessage);
            log.error(errorMessage);
        }
        return result;

    }

    public static Inventory getProduct(int productNumber) {
        Inventory inventory = new Inventory();
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "SELECT * from inventory WHERE productNumber = ?";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, productNumber);
                try (ResultSet rs = preparedStatement.executeQuery()) {
                    if (rs.next()) {
                        inventory.setProductNumber(rs.getInt("productNumber"));
                        inventory.setProductName(rs.getString("productName"));
                        inventory.setQuantity(rs.getInt("quantity"));
                        inventory.setExpiryDate(rs.getString("expiryDate"));
                        inventory.setUnitPrice(rs.getDouble("unitPrice"));
                        inventory.setShelfNumber(rs.getString("shelfNumber"));
                    }
                }
            }
        } catch (SQLException ex) {
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            // Construct the error message with date and time
            String errorMessage = timestamp.toString() + ": " + ex.getMessage();
            //System.out.println(errorMessage);
            log.error(errorMessage);
        }
        return inventory;
    }

}
