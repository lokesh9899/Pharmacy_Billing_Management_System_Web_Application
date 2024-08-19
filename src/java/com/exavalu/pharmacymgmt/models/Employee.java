/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.pharmacymgmt.models;

import com.exavalu.pharmacymgmt.services.EmployeeService;
import com.exavalu.pharmacymgmt.utils.EnvUtility;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 * Model for employee where we are creating the instance variables for employee
 * and the methods for CURD operations are mentioned.
 *
 * @author mavanth
 */
public class Employee extends ActionSupport implements SessionAware, Serializable {

    static Logger logger = Logger.getLogger(Employee.class.getName());

    private int employeeId;
    private String firstName;
    private String lastName;
    private String city;
    private String state;
    private String pincode;
    private String gender;
    private String phoneNumber;
    private String dob;
    private String salary;
    private String emailId;
    private String password;
    private String qualification;
    private String startdate;
    private String endDate;
    private String aadharNo;

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    /**
     * @return the employeeId
     */
    public int getEmployeeId() {
        return employeeId;
    }

    /**
     * @param employeeId the employeeId to set
     */
    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * @return the pincode
     */
    public String getPincode() {
        return pincode;
    }

    /**
     * @param pincode the pincode to set
     */
    public void setPincode(String pincode) {
        this.pincode = pincode;
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
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }

    /**
     * @return the salary
     */
    public String getSalary() {
        return salary;
    }

    /**
     * @param salary the salary to set
     */
    public void setSalary(String salary) {
        this.salary = salary;
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

    /**
     * @return the startdate
     */
    public String getStartdate() {
        return startdate;
    }

    /**
     * @param startdate the startdate to set
     */
    public void setStartdate(String startdate) {
        this.startdate = startdate;
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
     * @return the aadharNo
     */
    public String getAadharNo() {
        return aadharNo;
    }

    /**
     * @param aadharNo the aadharNo to set
     */
    public void setAadharNo(String aadharNo) {
        this.aadharNo = aadharNo;
    }

    /**
     * @return the qualification
     */
    public String getQualification() {
        return qualification;
    }

    /**
     * @param qualification the qualification to set
     */
    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String doEmployeeAdd() throws SQLException {
        String result = "FAILURE";
        boolean success = EmployeeService.addEmployee(this);
        if (success) {
            String createdMsg = "Congratulation You've registered successfully !!\n Wait for the email confirmation";
            sessionMap.put("CreatedMsg", createdMsg);
            result = "SUCCESS";
            //System.out.println("returning Success from doEmployeeAdd method");
        } else {
            String createdMsg = "Your Email Id is already registered !!\nYou can login !";
            sessionMap.put("CreatedMsg", createdMsg);
            logger.error("Returning Failure in the Add Employee");
            //System.out.println("returning Failure from doEmployeeAdd method");
        }
        return result;
    }

    public String doEmployeeUpdate() throws Exception {

        String result = "FAILURE";
        boolean success = EmployeeService.updateEmployee(this);

        if (success) {
            String updateMsg = "updated Employee of EmployeeId :" + this.getEmployeeId();
            //System.out.println(updateMsg);
            sessionMap.put("UpdateMsg", updateMsg);

            List empList = EmployeeService.getAllVerfiedEmployees();
            sessionMap.put("VerifiedEmpList", empList);

            //System.out.println("returning Success from doEmployeeUpdate method");
            result = "SUCCESS";

        } else {
            logger.error("Returning Failure in the Update Employee");
        }
        return result;
    }

    public String doEmployeeDelete() throws Exception {
        //System.err.println("Delete employee");
        String result = "FAILURE";
        boolean success = EmployeeService.deleteEmployee(this);
        if (success) {
            String updateMsg = "deleted successfully!";
            sessionMap.put("UpdateMsg", updateMsg);
            List empList = EmployeeService.getAllVerfiedEmployees();
            sessionMap.put("VerifiedEmpList", empList);
            result = "SUCCESS";
        } else {
            logger.error("Returning Failure in the delete Employee");
        }
        return result;
    }

    public String doEmployeeHardDelete() throws Exception {

        String result = "FAILURE";
        Employee emp = EmployeeService.getEmployeeById(this.getEmployeeId());
        boolean success = EmployeeService.hardDeleteEmployee(this);

        if (success) {
            sendEmailToEmployee(emp, 0);
            String updateMsg = "deleted successfully!";
            sessionMap.put("UpdateMsg", updateMsg);

            List empList = EmployeeService.getAllEmployees();
            sessionMap.put("EmpList", empList);
            //System.out.println("EMPLIST" + empList.size());

            List vempList = EmployeeService.getAllVerfiedEmployees();
            sessionMap.put("VerifiedEmpList", vempList);

            result = "SUCCESS";

        } else {
            logger.error("Returning Failure in the hard delete Employee");
        }
        return result;
    }

    public String getEmployeeById() throws SQLException {
        String result = "FAILURE";
        Employee emp = EmployeeService.getEmployeeById(this.getEmployeeId());
        if (emp != null) {
            sessionMap.put("Emp", emp);
            result = "SUCCESS";
            //System.out.println("returning Success from getEmployee By Id method");
        } else {
            logger.error("Returning Failure in the get Employee by Id");
            //System.out.println("returning Failure from getEmployee By Id method");
        }
        return result;
    }

    public String getAllEmployee() throws SQLException {
        String result = "FAILURE";
        List empList = EmployeeService.getAllEmployees();
        if (!empList.isEmpty()) {
            sessionMap.put("EmpList", empList);
            result = "SUCCESS";
            //System.out.println("returning Success from getAllEmployee method");
        } else {
            logger.error("Returning Failure in the getAllEmployee");
            //System.out.println("returning Failure from getAllEmployee method");
        }
        return result;
    }

    public String doVerifyEmployee() throws Exception {

        String result = "FAILURE";
        boolean success = EmployeeService.verifyEmployee(this);

        if (success) {
            Employee emp = EmployeeService.getEmployeeById(this.getEmployeeId());
            sendEmailToEmployee(emp, 1);
            List empList = EmployeeService.getAllEmployees();
            sessionMap.put("EmpList", empList);
            //System.out.println("EMPLIST" + empList.size());

            List vempList = EmployeeService.getAllVerfiedEmployees();
            sessionMap.put("VerifiedEmpList", vempList);

            //System.out.println("returning Success from doVerifyEmployee method");
            result = "SUCCESS";

        } else {
            logger.error("Returning Failure in the Verify Employee");
        }
        return result;
    }

    public void sendEmailToEmployee(Employee employee, int num) throws Exception {
        //System.out.println(" Email Id:" + employee.getEmailId() + "Password: " + employee.getPassword() + "Hello Mr. " + employee.getFirstName() + " " + employee.getLastName());
        try {
            EnvUtility envUtility = EnvUtility.getInstanceOfEnvUtility();

            String fromEmail = envUtility.getPropertyValue("fromEmail");
            final String mailpassword = envUtility.getPropertyValue("password");
            final String userName = envUtility.getPropertyValue("userName");
            //System.out.println(fromEmail + " : " + mailpassword + " : " + userName);

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "25");

            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(userName, mailpassword);
                }
            });

            if (num == 1) {
                Message mailMessage = new MimeMessage(session);

                //setting up all the messages
                mailMessage.setFrom(new InternetAddress(fromEmail));
                mailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(employee.getEmailId()));
                mailMessage.setSubject("Welcome to MedEasy Family.");
                mailMessage.setText("Hello, " + employee.getFirstName() + " " + employee.getLastName() + ","
                        + "\n\nCongratulations you're hired as an employee in MedEasy."
                        + "\n\nUser Name: " + employee.getEmailId()
                        //                        + "\n\nPassword: " + employee.getPassword()
                        + "\n\nPlease don't share your password with anyone"
                        + "\n\nClick Here: " + "http://localhost:8080/PharmacyManagement"
                );
                Transport.send(mailMessage);
            } else {
                Message mailMessage = new MimeMessage(session);

                //setting up all the messages
                mailMessage.setFrom(new InternetAddress(fromEmail));
                mailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(employee.getEmailId()));
                mailMessage.setSubject("An Update on your recent MedEasy Application");
                mailMessage.setText("Hello, " + employee.getFirstName() + " " + employee.getLastName() + ","
                        + "\n\nThank You for taking the time to apply for the job in MedEasy."
                        + "\n\nSorry your application is rejected due to details verification mismatch."
                        + "\n\nYou can apply again through the given url with valid details."
                        + "\n\nClick Here: " + "http://localhost:8080/PharmacyManagement"
                );
                Transport.send(mailMessage);
            }
        } catch (AddressException ex) {
            if (logger.isDebugEnabled()) {
                logger.debug(ex.getMessage() + "found @" + LocalDateTime.now());
            }
        }
    }
}
