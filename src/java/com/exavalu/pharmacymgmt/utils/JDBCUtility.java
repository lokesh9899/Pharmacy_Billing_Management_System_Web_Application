/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.pharmacymgmt.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Properties;
import org.apache.log4j.Logger;

/**
 * To fetch the details of property files
 *
 * @author All
 */
public final class JDBCUtility {

    static Logger logger = Logger.getLogger(JDBCUtility.class.getName());

    public static final JDBCUtility jdbcUtility = null;

    private JDBCUtility() {
        // Private constructor
    }

    public static JDBCUtility getInstanceOfJDBCUtility() {
        if (jdbcUtility == null) {
            return new JDBCUtility();
        }
        return jdbcUtility;
    }

    // in this class we will have static methods to get the connection params
    public String getPropertyValue(String param) throws IOException{

        String value = null;
        String path = JDBCUtility.class.getClassLoader().getResource("settings.properties").getPath();
        FileReader fr = new FileReader(path);
        BufferedReader input = new BufferedReader(fr);

        //input = getClass().getResourceAsStream("settings.properties"); // Property file path in classpath
        try {
            Properties prop = new Properties();
            prop.load(input);
            value = prop.getProperty(param);
        } catch (IOException ex) {
            // TODO Auto-generated catch block
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            // Construct the error message with date and time
            String errorMessage = timestamp.toString() + ": " + ex.getMessage();
            System.out.println(errorMessage);
            logger.error(errorMessage);
        } finally {
            fr.close();
            input.close();
        }

        return value;
    }
}
