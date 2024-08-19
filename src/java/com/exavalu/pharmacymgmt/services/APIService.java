/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.pharmacymgmt.services;

import com.exavalu.pharmacymgmt.models.ApiEmployee;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import org.apache.log4j.Logger;

/**
 * Service methods to fetch data from API for aadhaar verification
 *
 * @author chandhu
 */
public class APIService {

    static Logger logger = Logger.getLogger(APIService.class.getName());

    public static List<ApiEmployee> getAadharList() throws ParseException {

        List<ApiEmployee> apiEmpList = new ArrayList();
        try {

            URL url = new URL("https://mocki.io/v1/a11916e3-9227-4e87-9afb-b8ad6e32bd99");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");

            if (conn.getResponseCode() != 200) {
                throw new RuntimeException("Failed : HTTP error code : "
                        + conn.getResponseCode());
            } else {

                String inline = "";
                try (Scanner scanner = new Scanner(url.openStream())) {
                    while (scanner.hasNext()) {
                        inline += scanner.nextLine();

                    }
                }
                JSONParser parse = new JSONParser();
                JSONArray jsonArray = (JSONArray) parse.parse(inline);

                for (int i = 0; i < jsonArray.size(); i++) {

                    ApiEmployee apiEmployee = new ApiEmployee();
                    JSONObject obj = (JSONObject) jsonArray.get(i);
                    String aadharNo = obj.get("aadharNo").toString();
                    String firstName = obj.get("firstName").toString();
                    String lastName = obj.get("lastName").toString();
                    String city = obj.get("city").toString();
                    String state = obj.get("state").toString();
                    String gender = obj.get("gender").toString();
                    String dob = obj.get("dob").toString();

                    apiEmployee.setAadharNo(aadharNo);
                    apiEmployee.setFirstName(firstName);
                    apiEmployee.setLastName(lastName);
                    apiEmployee.setCity(city);
                    apiEmployee.setState(state);
                    apiEmployee.setGender(gender);
                    apiEmployee.setDob(dob);

                    apiEmpList.add(apiEmployee);
                }

                //System.out.println("Size of Aadhar list: " + apiEmpList.size());
            }

        } catch (IOException ex) {

            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            // Construct the error message with date and time
            String errorMessage = timestamp.toString() + ": " + ex.getMessage();
            //System.out.println(errorMessage);
            logger.error(errorMessage);

        }
        return apiEmpList;
    }

    public static ApiEmployee getApiEmployeeByAadharNo(ApiEmployee apiEmployee) {
        ApiEmployee emp = new ApiEmployee();
        boolean result = false;
        try {
            List<ApiEmployee> apiEmpList = getAadharList();
            for (ApiEmployee apiEmp : apiEmpList) {
                if (apiEmployee.getAadharNo().equals(apiEmp.getAadharNo())) {
                    result = true;
                    emp.setAadharNo(apiEmp.getAadharNo());
                    emp.setFirstName(apiEmp.getFirstName());
                    emp.setLastName(apiEmp.getLastName());
                    emp.setAddress(apiEmp.getAddress());
                    emp.setCity(apiEmp.getCity());
                    emp.setState(apiEmp.getState());
                    emp.setGender(apiEmp.getGender());
                    emp.setDob(apiEmp.getDob());
                }
            }
        } catch (ParseException ex) {
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            // Construct the error message with date and time
            String errorMessage = timestamp.toString() + ": " + ex.getMessage();
            //System.out.println(errorMessage);
            logger.error(errorMessage);
        }
        if (result == false) {
            emp.setAadharNo("NA");
            emp.setFirstName("NA");
            emp.setLastName("NA");
            emp.setAddress("NA");
            emp.setCity("NA");
            emp.setState("NA");
            emp.setGender("NA");
            emp.setDob("NA");
        }
        return emp;
    }

}
