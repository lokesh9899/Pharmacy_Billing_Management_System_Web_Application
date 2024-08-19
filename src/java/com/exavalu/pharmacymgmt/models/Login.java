/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.pharmacymgmt.models;

import com.exavalu.pharmacymgmt.services.EmployeeService;
import com.exavalu.pharmacymgmt.services.InventoryService;
import com.exavalu.pharmacymgmt.services.LoginService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 * Model for role based login and logout operations
 *
 * @author chandhu
 */
public class Login extends ActionSupport implements SessionAware, Serializable {

    private String emailId;
    private String password;

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();
    static Logger logger = Logger.getLogger(Login.class.getName());

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
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
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    private static String encryptPassword(String password) {
        try {

            // Static getInstance method is called with hashing MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest
            // of an input digest() return array of byte
            byte[] messageDigest = md.digest(password.getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

    }

    public String doLogin() {

        //System.out.println(this.getEmailId() + "   " + this.getPassword());
        String passwordeEn = encryptPassword(this.password);

        List login = LoginService.doLogin(this.emailId, passwordeEn);
        String result = login.get(0).toString();
        if ("ADMIN".equalsIgnoreCase(result)) {
            //System.out.println("Returning Success From ADMIN Login");
            Admin admin = (Admin) login.get(1);
            sessionMap.put("Admin", admin);
            //System.out.println(admin.getFirstName());

            List verifiedEmpList = EmployeeService.getAllVerfiedEmployees();
            sessionMap.put("VerifiedEmpList", verifiedEmpList);
            //System.out.println("VerifiedEMPLIST" + verifiedEmpList.size());

//            ArrayList empList = EmployeeService.getAllEmployees();
//            sessionMap.put("EmpList", empList);
//            System.out.println("EMPLIST"+empList.size());
//            
//            ArrayList inventoryList = InventoryService.getAllInventory();
//            sessionMap.put("InventoryList", inventoryList);
        } else if ("EMPLOYEE".equalsIgnoreCase(result)) {
            //System.out.println("Returning Success From EMPLOYEE Login");
            Employee employee = (Employee) login.get(1);
            sessionMap.put("Employee", employee);
            //System.out.println(employee.getEmailId());
            List inventoryList = InventoryService.getAllInventory();
            sessionMap.put("InventoryList", inventoryList);
        } else {
            sessionMap.put("LoginError", "Enter Correct Credentials!");
            if (logger.isDebugEnabled()) {
                logger.debug("Something error in login page. TIME:" + LocalDateTime.now());
            }
            result = "FAILURE";
        }

        return result;
    }

    public String doLogout() {
        sessionMap.clear();
        return "SUCCESS";
    }
}
