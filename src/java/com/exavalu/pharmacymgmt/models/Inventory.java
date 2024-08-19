/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.pharmacymgmt.models;

import com.exavalu.pharmacymgmt.services.InventoryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *  Model for inventory where we are creating the instance variables for inventory and the methods for CURD operations are mentioned.
 * 
 * @author lokesh
 */
public class Inventory extends ActionSupport implements SessionAware, Serializable {
    
    static Logger logger = Logger.getLogger(Inventory.class.getName());

    private int productNumber;
    private String productName;
    private int quantity;
    private double unitPrice;
    private String expiryDate;
    private String shelfNumber;

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    /**
     * @return the productNumber
     */
    public int getProductNumber() {
        return productNumber;
    }

    /**
     * @param productNumber the productNumber to set
     */
    public void setProductNumber(int productNumber) {
        this.productNumber = productNumber;
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
     * @return the expiryDate
     */
    public String getExpiryDate() {
        return expiryDate;
    }

    /**
     * @param expiryDate the expiryDate to set
     */
    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    /**
     * @return the shelfNumber
     */
    public String getShelfNumber() {
        return shelfNumber;
    }

    /**
     * @param shelfNumber the shelfNumber to set
     */
    public void setShelfNumber(String shelfNumber) {
        this.shelfNumber = shelfNumber;
    }

    public String getAllInventory() throws SQLException {
        String result = "SUCCESS";
        List inventoryList = InventoryService.getAllInventory();
        if (!inventoryList.isEmpty()) {
            String createdMsg = "Item Added successfully!!";
            sessionMap.put("CreatedMsg", createdMsg);
            sessionMap.put("InventoryList", inventoryList);
            result = "SUCCESS";
            //System.out.println("returning Success from getAllInventory method");
        } else {
            logger.error("returning Failure from getAllInventory method");
            //System.out.println("returning Failure from getAllInventory method");
        }
        return result;
    }

    public String doInventoryAdd() throws SQLException {
        //System.out.println("doInventoryAdd method");
        String result = "FAILURE";
        boolean success = InventoryService.addInventory(this);
        if (success) {
            String createdMsg = "Item Added successfully!!";
            sessionMap.put("CreatedMsg", createdMsg);
            List inventoryList = InventoryService.getAllInventory();
            sessionMap.put("InventoryList", inventoryList);
            result = "SUCCESS";
            //System.out.println("returning Success from doInventoryAdd method");
        } else {
            String error = "Item Already there !";
            sessionMap.put("Error", error);
            //System.out.println("returning Failure from doInventoryAdd method");
            logger.error("returning Failure from doInventoryAdd method");
        }
        return result;
    }

    public String doInvenoryUpdate() throws Exception {
        //System.out.println(this.productNumber);
        String result = "FAILURE";
        boolean success = InventoryService.updateInventory(this);

        if (success) {
            String updateMsg = "updated Inventory of ProductNumber :" + this.productNumber;
            sessionMap.put("UpdateMsg", updateMsg);
            List inventoryList = InventoryService.getAllInventory();
            sessionMap.put("InventoryList", inventoryList);
            //System.out.println("returning Success from doInvenoryUpdate method");
            result = "SUCCESS";
        }else{
            logger.error("returning Failure from doInvenoryUpdate method");
        }
        return result;
    }

    public String doInventoryDelete() throws Exception {

        String result = "FAILURE";
        boolean success = InventoryService.deleteInventory(this);

        if (success) {
            String deleteMsg = "Inventory item deleted successfully!";
            sessionMap.put("DeleteMsg", deleteMsg);
            List inventoryList = InventoryService.getAllInventory();
            sessionMap.put("InventoryList", inventoryList);
            result = "SUCCESS";
        }else{
            logger.error("returning Failure from doInvenoryDelete method");
        }
        return result;
    }

    public String getProductByNumber() throws Exception {

        String result = "FAILURE";
        Inventory invent = InventoryService.getProduct(this.getProductNumber());

        if (invent != null) {
            String updateMsg = "Inventory item deleted successfully!";
            sessionMap.put("UpdateMsg", updateMsg);

            sessionMap.put("Product", invent);

            result = "SUCCESS";

        }else{
            logger.error("returning Failure from get Product by Number method");
        }
        return result;
    }

}
