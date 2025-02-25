/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;

import jakarta.jms.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author carlo
 */
public class DatabaseConnection {
     public static java.sql.Connection initializeDatabase() 
        throws SQLException, ClassNotFoundException 
    { 

        // Initialize all the information regarding 
        // Database Connection 
        String dbDriver = "com.mysql.jdbc.Driver"; 
        String dbURL = "jdbc:mysql://localhost:3306/"; 
        // Database name to access 
        String dbName = "vacation"; 
        String dbUsername = "carlos"; 
        String dbPassword = "barral206"; 
  
        Class.forName(dbDriver); 
        java.sql.Connection con =  DriverManager.getConnection(dbURL+dbName,dbUsername,dbPassword); 
        return con; 
    } 
}
