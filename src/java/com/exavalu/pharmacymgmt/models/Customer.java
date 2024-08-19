/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.pharmacymgmt.models;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import com.exavalu.pharmacymgmt.services.CustomerService;

/**
 *Model for Customer where we are creating the instance variables for customer and the methods for CURD operations are mentioned.
 * @author pavan
 */
public class Customer extends ActionSupport implements SessionAware, Serializable {
    
    private String phoneNumber;
    private String customerName; 
    private String emailId;
    private String gender;
    private String address;
    private int age;
    
    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();
    static Logger logger = Logger.getLogger(Customer.class.getName());

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
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
     * @return the emailId
     */
    public String getEmailId() {
        return emailId;
    }

    /**
     * @param emailId the emailId to set
     */
    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the age
     */
    public int getAge() {
        return age;
    }

    /**
     * @param age the age to set
     */
    public void setAge(int age) {
        this.age = age;
    }
    public String addCustomer()
    {
        String result = "FAILURE";
        boolean success = CustomerService.addCustomer(this);
        if(success){
            sessionMap.put("Customer", this);
            result="SUCCESS";
        }
        else{
            logger.error("Something error Occured during adding new Customer");
        }
        return result;
    }
    public String getCustomerByNumber()
    {
        System.out.println("Getting your customer...."+this.getPhoneNumber());
        String result = "FAILURE";
        Customer customers = CustomerService.getCustomerByNumber(this.getPhoneNumber());
        if(customers != null){
            sessionMap.put("Customer", customers);
            result="SUCCESS";
        }
        else{
            logger.error("Something error Occured during getting the Customer by mobile number");
        }
        return result;
    }
    public String updateCustomer()
    {
        String result = "FAILURE";
        boolean success = CustomerService.updateCustomer(this);
        if(success){
            sessionMap.put("Customer", this);
            result="SUCCESS";
        }
        else{
            logger.error("Something error Occured during updating the Customer");
        }
        return result;
    }
}