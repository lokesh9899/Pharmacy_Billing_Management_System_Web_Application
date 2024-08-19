/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.pharmacymgmt.services;

import com.exavalu.pharmacymgmt.models.Customer;
import com.exavalu.pharmacymgmt.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import org.apache.log4j.Logger;

/**
 * Service methods to connect with the database of customer table for CURD
 * operations
 *
 * @author lokes
 */
public class CustomerService {

    private static final Logger log = Logger.getLogger(CustomerService.class);

    public static boolean addCustomer(Customer customer) {
        boolean result = false;
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "INSERT INTO customer(phoneNumber,customerName,emailId,age,gender,address) VALUES(? ,? ,? ,? ,? ,?);";

            try(PreparedStatement preparedStatement = con.prepareStatement(sql)){
            preparedStatement.setString(1, customer.getPhoneNumber());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setString(3, customer.getEmailId());
            preparedStatement.setInt(4, customer.getAge());
            preparedStatement.setString(5, customer.getGender());
            preparedStatement.setString(6, customer.getAddress());

            //System.out.println(preparedStatement);
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

    public static boolean updateCustomer(Customer customer) {

        boolean result = false;
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "UPDATE customer SET customerName= ? , emailId= ? ,age= ? ,gender = ? ,address= ? WHERE phoneNumber = ?;";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, customer.getCustomerName());
                preparedStatement.setString(2, customer.getEmailId());
                preparedStatement.setInt(3, customer.getAge());
                preparedStatement.setString(4, customer.getGender());
                preparedStatement.setString(5, customer.getAddress());
                preparedStatement.setString(6, customer.getPhoneNumber());

                int row = preparedStatement.executeUpdate();

                if (row == 1) {
                    result = true;
                    //System.out.println(preparedStatement);
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

    public static Customer getCustomerByNumber(String phoneNumber) {

        Customer customer = new Customer();

        customer.setPhoneNumber(phoneNumber);

        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "select * from customer where  phoneNumber= ? ";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, phoneNumber);

                try (ResultSet rs = preparedStatement.executeQuery()) {

                    if (rs.next()) {
                        customer.setCustomerName(rs.getString("customerName"));
                        customer.setEmailId(rs.getString("emailId"));
                        customer.setAge(rs.getInt("age"));
                        customer.setGender(rs.getString("gender"));
                        customer.setAddress(rs.getString("address"));
                        //System.out.println(preparedStatement);
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
        return customer;

    }

}
