/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.pharmacymgmt.services;

import com.exavalu.pharmacymgmt.models.Order;
import com.exavalu.pharmacymgmt.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

/**
 * Service methods to connect with the database of order table for CURD
 * operations and generating sales report
 *
 * @author mavanth
 */
public class OrderService {

    private static final Logger log = Logger.getLogger(OrderService.class);

    public static Order addOrder(Order order) {
        Order orders = new Order();
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "INSERT INTO orders (employeeName,customerName,orderDateTime,phoneNumber,doctorName,totalPrice)VALUES(?,?,?,?,?,?);";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, order.getEmployeeName());
                preparedStatement.setString(2, order.getCustomerName());
                preparedStatement.setString(3, order.getOrderDateTime());
                preparedStatement.setString(4, order.getPhoneNumber());
                preparedStatement.setString(5, order.getDoctorName());
                preparedStatement.setDouble(6, order.getTotalPrice());

                //System.out.println(preparedStatement);
                int row = preparedStatement.executeUpdate();
                //System.out.println(row);
                if (row != 0) {
                    String sql2 = "SELECT * from orders where orderDateTime=?";
                    try (PreparedStatement preparedStatement2 = con.prepareStatement(sql2)) {
                        preparedStatement2.setString(1, order.getOrderDateTime());
                        try (ResultSet rs = preparedStatement2.executeQuery()) {
                            if (rs.next()) {
                                //System.out.println(rs.getInt("orderId"));
                                orders.setOrderId(rs.getInt("orderId"));
                                orders.setCustomerName(rs.getString("customerName"));
                                orders.setOrderDateTime(rs.getString("orderDateTime"));
                                orders.setPhoneNumber(rs.getString("phoneNumber"));
                                orders.setDoctorName(rs.getString("doctorName"));
                                orders.setTotalPrice(rs.getDouble("totalPrice"));
                                orders.setEmployeeName(rs.getString("employeeName"));
                            }
                        }
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

        return orders;
    }

    public static List getAllOrder() {
        List orderList = new ArrayList();
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "SELECT * from orders";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                try (ResultSet rs = preparedStatement.executeQuery()) {
                    while (rs.next()) {
                        Order order = new Order();
                        order.setOrderId(rs.getInt("orderId"));
                        order.setCustomerName(rs.getString("customerName"));
                        order.setOrderDateTime(rs.getString("orderDateTime"));
                        order.setPhoneNumber(rs.getString("phoneNumber"));
                        order.setDoctorName(rs.getString("doctorName"));
                        order.setTotalPrice(rs.getDouble("totalPrice"));
                        order.setEmployeeName(rs.getString("employeeName"));
                        orderList.add(order);
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
        return orderList;
    }

    public static boolean updateOrder(Order order) {
        boolean result = false;
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "UPDATE orders SET totalPrice =? WHERE orderId=? ;";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setDouble(1, order.getTotalPrice());
                preparedStatement.setInt(2, order.getOrderId());

                //System.out.println(sql);
                int row = preparedStatement.executeUpdate();

                if (row == 1) {
                    result = true;
                }
                //System.out.println(sql);
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

    public static List salesReport() {
        List salesOrderList = new ArrayList();
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "SELECT sum(totalPrice) as totalPrice,substring(orderDateTime,1,10) as orderDate FROM orders group by orderDate order by orderDate desc limit 30;";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                try (ResultSet rs = preparedStatement.executeQuery()) {
                    while (rs.next()) {
                        Order order = new Order();
                        order.setOrderDateTime(rs.getString("orderDate"));
                        order.setTotalPrice(rs.getDouble("totalPrice"));
                        salesOrderList.add(order);
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
        return salesOrderList;
    }

    public static List customSalesReport(Order o) {

        List salesOrderList = new ArrayList();
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "SELECT round(sum(totalPrice),2) as totalPrice,substring(orderDateTime,1,10) as orderDate FROM orders group by orderDate having orderDate between ? and ? order by orderDate;";
            //System.err.println("Start date = " + o.getStartDate());
            //System.err.println("End date = " + o.getEndDate());

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                preparedStatement.setString(1, o.getStartDate());
                preparedStatement.setString(2, o.getEndDate());

                try (ResultSet rs = preparedStatement.executeQuery()) {
                    while (rs.next()) {
                        Order order = new Order();
                        order.setOrderDateTime(rs.getString("orderDate"));
                        order.setTotalPrice(rs.getDouble("totalPrice"));
                        salesOrderList.add(order);
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
        return salesOrderList;

    }

    public static List monthlySalesReport() {

        List salesOrderList = new ArrayList();
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "SELECT round(sum(totalPrice),2) as totalPrice,  concat(year(orderDateTime),'-',substring(orderDateTime,6,2)) as month_Name from orders group by month_Name order by month_Name desc;";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                try (ResultSet rs = preparedStatement.executeQuery()) {
                    while (rs.next()) {
                        Order order = new Order();
                        order.setOrderDateTime(rs.getString("month_Name"));
                        order.setTotalPrice(rs.getDouble("totalPrice"));
                        salesOrderList.add(order);
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
        return salesOrderList;

    }

    public static List yearlySalesReport() {

        List salesOrderList = new ArrayList();
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "SELECT sum(totalPrice) as totalPrice, year(orderDateTime) as years from orders group by years order by years desc limit 30";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                try (ResultSet rs = preparedStatement.executeQuery()) {
                    while (rs.next()) {
                        Order order = new Order();
                        order.setOrderDateTime(rs.getString("years"));
                        order.setTotalPrice(rs.getDouble("totalPrice"));
                        salesOrderList.add(order);
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
        return salesOrderList;

    }

    public static double getThisDaySale() {
        double totalSale = 0;
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "SELECT round(sum(totalPrice)/1000,2) as totalPrice,substring(orderDateTime,1,10) as orderDate from orders where orderDateTime like ? group by orderDate";

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            //System.out.println(dtf.format(now));

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                preparedStatement.setString(1, dtf.format(now) + '%');

                //System.err.println("Daily = " + preparedStatement);

                try (ResultSet rs = preparedStatement.executeQuery()) {
                    if (rs.next()) {
                        totalSale = rs.getDouble("totalPrice");
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
        return totalSale;

    }

    public static double getThisMonthSale() {
        double totalSale = 0;
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "SELECT round(sum(totalPrice)/1000,2) as totalPrice,substring(orderDateTime,1,7) as orderMonth from orders where orderDateTime like ? group by orderMonth";

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM");
            LocalDateTime now = LocalDateTime.now();
            //System.out.println(dtf.format(now));

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                preparedStatement.setString(1, dtf.format(now) + '%');

                //System.err.println("Month = " + preparedStatement);

                try (ResultSet rs = preparedStatement.executeQuery()) {
                    if (rs.next()) {
                        totalSale = rs.getDouble("totalPrice");
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
        return totalSale;

    }

    public static double getThisYearSale() {
        double totalSale = 0;
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "SELECT round(sum(totalPrice)/1000,2) as totalPrice,year(orderDateTime) as orderYear from orders where orderDateTime = year(sysdate()) group by orderYear;";

            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                //System.out.println(preparedStatement);
                try (ResultSet rs = preparedStatement.executeQuery()) {
                    while (rs.next()) {
                        totalSale = rs.getDouble("totalPrice");
                    }
                }
            }
            //System.out.println("Year sale " + totalSale);
        } catch (SQLException ex) {
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            // Construct the error message with date and time
            String errorMessage = timestamp.toString() + ": " + ex.getMessage();
            //System.out.println(errorMessage);
            log.error(errorMessage);
        }
        return totalSale;
    }

    public static Order getOrderDetails(int orderId) {
        Order order = new Order();
        try (Connection con = JDBCConnectionManager.getConnection()) {
            String sql = "SELECT * from orders where orderId=?";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, orderId);
                try (ResultSet rs = preparedStatement.executeQuery()) {
                    while (rs.next()) {

                        order.setOrderId(rs.getInt("orderId"));
                        order.setCustomerName(rs.getString("customerName"));
                        order.setOrderDateTime(rs.getString("orderDateTime"));
                        order.setPhoneNumber(rs.getString("phoneNumber"));
                        order.setDoctorName(rs.getString("doctorName"));
                        order.setTotalPrice(rs.getDouble("totalPrice"));
                        order.setEmployeeName(rs.getString("employeeName"));
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
        return order;
    }
}
