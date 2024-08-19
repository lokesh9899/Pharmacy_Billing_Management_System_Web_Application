/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.pharmacymgmt.models;

import com.exavalu.pharmacymgmt.services.CustomerService;
import com.exavalu.pharmacymgmt.services.OrderService;
import com.exavalu.pharmacymgmt.services.ProductService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *Model for Order where we are creating the instance variables for customer and the methods for CURD operations and sales report are mentioned.
 * @author lokesh
 */
public class Order extends ActionSupport implements SessionAware, Serializable {
    
    static Logger logger = Logger.getLogger(Order.class.getName());
    
    private String customerName;
    private String phoneNumber;
    private String doctorName;
    private String employeeName;
    private String startDate;
    private String endDate;
    private String orderDateTime= LocalDateTime.now().toString();
    private int orderId;
    private double totalPrice;

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    /**
     * @return the startDate
     */
    public String getStartDate() {
        return startDate;
    }

    /**
     * @param startDate the startDate to set
     */
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    /**
     * @return the endDate
     */
    public String getEndDate() {
        return endDate;
    }

    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
    
    /**
     * @return the orderId
     */
    public int getOrderId() {
        return orderId;
    }

    /**
     * @param orderId the orderId to set
     */
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    /**
     * @return the customerName
     */
    public String getCustomerName() {
        return customerName;
    }

    /**
     * @param customerName the customerName to set
     */
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    /**
     * @return the orderDateTime
     */
    public String getOrderDateTime() {
        return orderDateTime;
    }

    /**
     * @param orderDateTime the orderDateTime to set
     */
    public void setOrderDateTime(String orderDateTime) {
        this.orderDateTime = orderDateTime;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the doctorName
     */
    public String getDoctorName() {
        return doctorName;
    }

    /**
     * @param doctorName the doctorName to set
     */
    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    /**
     * @return the totalPrice
     */
    public double getTotalPrice() {
        return totalPrice;
    }

    /**
     * @param totalPrice the totalPrice to set
     */
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    
    /**
     * @return the employeeName
     */
    public String getEmployeeName() {
        return employeeName;
    }

    /**
     * @param employeeName the employeeName to set
     */
    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String addOrder() {
        String result = "FAILURE";
        Order order2 = OrderService.addOrder(this);
        if (order2 != null) {
            //System.out.println("Order ID"+order2.getOrderId());
            sessionMap.put("Order",order2);
            result = "SUCCESS";
        } else {
            logger.error("returning Failure from get addOrder method");
        }
        return result;
    }

    public String getAllOrder() {
        String result = "FAILURE";
        List orderList = OrderService.getAllOrder();
        if (!orderList.isEmpty()) {
            sessionMap.put("OrderList", orderList);
            result = "SUCCESS";
        } else {
            logger.error("returning Failure from getAllOrder method");
        }
        return result;
    }

    public String completeOrder() {
        System.out.println("Calling update");
        String result = "FAILURE";
        boolean success = OrderService.updateOrder(this);
        if (success) {
            sessionMap.remove("Customer");
            sessionMap.remove("Order");
            sessionMap.remove("Product");
            sessionMap.remove("price");
            sessionMap.remove("totalPrice");
            sessionMap.remove("ProductList");
            result = "SUCCESS";
        } else {
            logger.error("returning Failure from completeOrder method");
        }
        return result;
    }
    
    public String getInvoiceDetails() {
        String result = "FAILURE";
        Order odr = OrderService.getOrderDetails(this.getOrderId());
        if (odr != null) {
            System.out.println("Running");
            sessionMap.put("Order", odr);
            Customer customer = CustomerService.getCustomerByNumber(this.getPhoneNumber());
            sessionMap.put("Customer", customer);
            List productList = ProductService.getProductByOrderId(this.getOrderId());
            sessionMap.put("ProductList", productList);
            result = "SUCCESS";
        } else {
            logger.error("returning Failure from getAllOrder method");
        }
        return result;
    }
    
    public String salesReport() {
        String result = "FAILURE";
        List salesOrderList = OrderService.salesReport();
         //System.out.println("Size of Sale :"+salesOrderList.size());
         if(!salesOrderList.isEmpty()){
              double thisDaySale = OrderService.getThisDaySale();
              sessionMap.put("ThisDaySale", thisDaySale);
              
              double thisMonthSale = OrderService.getThisMonthSale();
              sessionMap.put("ThisMonthSale", thisMonthSale);
              
              double thisYearSale = OrderService.getThisYearSale();
              sessionMap.put("ThisYearSale", thisYearSale);
              
            sessionMap.put("salesOrderList", salesOrderList);
            result = "SUCCESS";
        } else {
            logger.error("returning Failure from salesReport method");
        }
        return result;
    }
    
    public String getCustomSalesReport() {
        String result = "FAILURE";
        List salesOrderList = OrderService.customSalesReport(this);
        //System.out.println("Size of Sale :"+salesOrderList.size());
         if(!salesOrderList.isEmpty()){
              
            sessionMap.put("salesOrderList", salesOrderList);
            sessionMap.put("StartDate", this.getStartDate());
            sessionMap.put("EndDate", this.getEndDate());
            result = "SUCCESS";
        } else {
            logger.error("returning Failure from getCustomSalesReport method");
        }
        return result;
    }
    
    public String getMonthlySalesReport() {
        String result = "FAILURE";
        List salesOrderList = OrderService.monthlySalesReport();
        //System.out.println("Size of Sale :"+salesOrderList.size());
         if(!salesOrderList.isEmpty()){
            sessionMap.put("salesOrderList", salesOrderList);
            result = "SUCCESS";
        } else {
           logger.error("returning Failure from getMonthlySalesReport method");
        }
        return result;
    }
    
    public String getYearlySalesReport() {
        String result = "FAILURE";
        List salesOrderList = OrderService.yearlySalesReport();
        //System.out.println("Size of Sale :"+salesOrderList.size());
        if(!salesOrderList.isEmpty()){
            sessionMap.put("salesOrderList", salesOrderList);
            result = "SUCCESS";
        } else {
            logger.error("returning Failure from getYearlySalesReport method");
        }
        return result;
    }
}
