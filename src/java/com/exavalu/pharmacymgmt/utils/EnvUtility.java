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
 * To fetch the details of env files
 *
 * @author lokesh
 */
public final class EnvUtility {

    private static final Logger log = Logger.getLogger(EnvUtility.class.getName());

    public static EnvUtility envUtility = null;

    private EnvUtility() {
        // Private constructor
    }

    public static EnvUtility getInstanceOfEnvUtility() {
        if (envUtility == null) {
            return new EnvUtility();
        }
        return envUtility;
    }

    // in this class we will have static methods to get the connection params
    public String getPropertyValue(String param) {

        String value = null;

        //input = getClass().getResourceAsStream("settings.properties"); // Property file path in classpath
        try {

            String path = EnvUtility.class.getClassLoader().getResource(".env").getPath();

            try (BufferedReader input = new BufferedReader(new FileReader(path))) {

                Properties prop = new Properties();

                prop.load(input);

                value = prop.getProperty(param);
            }

        } catch (IOException ex) {
            // TODO Auto-generated catch block
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            // Construct the error message with date and time
            String errorMessage = timestamp.toString() + ": " + ex.getMessage();
            //System.out.println(errorMessage);
            log.error(errorMessage);
        }

        return value;
    }
}