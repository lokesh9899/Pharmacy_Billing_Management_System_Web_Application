/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.pharmacymgmt.models;

import com.exavalu.pharmacymgmt.services.ProductService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *Model for Product where we are creating the instance variables for product and the methods for CURD operations.
 * @author mavanth
 */
public class Product extends ActionSupport implements SessionAware, Serializable {
    
    static Logger logger = Logger.getLogger(Product.class.getName());
    
    private String productName;
    private int quantity;
    private int orderId;
    private double unitPrice;
    private double price;
    
    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * @return the productName
     */
    public String getProductName() {
        return productName;
    }

    /**
     * @param productName the productName to set
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the unitPrice
     */
    public double getUnitPrice() {
        return unitPrice;
    }

    /**
     * @param unitPrice the unitPrice to set
     */
    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
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

    public String addProduct() {
        String result = "FAILURE";
        boolean success = ProductService.addProduct(this);
        if (success) {
            List productList = ProductService.getProductByOrderId(this.getOrderId());
            sessionMap.put("ProductList",productList);
            result = "SUCCESS";
        } else {
            logger.error("returning Failure from addProduct method");
        }
        return result;
    }
    public String getProductByOrderId() {
        String result = "FAILURE";
        List productList = ProductService.getProductByOrderId(this.getOrderId());
        if (!productList.isEmpty()) {
            sessionMap.put("ProductList", productList);
            result = "SUCCESS";
        } else {
            logger.error("returning Failure from getProductByOrderId method");
        }
        return result;
    }
    public String removeProduct() {
        String result = "FAILURE";
        boolean success = ProductService.removeProduct(this.getOrderId(),this.getProductName());
        if (success) {
            List productList = ProductService.getProductByOrderId(this.getOrderId());
            sessionMap.put("ProductList",productList);
            result = "SUCCESS";
        } else {
            logger.error("returning Failure from removeProduct method");
        }
        return result;
    }
}
