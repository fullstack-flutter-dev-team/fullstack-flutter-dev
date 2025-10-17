/**
 *  ==================================
 *    DBConn.java
 *  ==================================
 */

package com.test.mvc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String DB_USER = "scott";
    private static final String DB_PW = "tiger";
    
    private static Connection dbConn;
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        
        if (dbConn == null) {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            dbConn = DriverManager.getConnection(DB_URL, DB_USER, DB_PW);
            
        }
        
        return dbConn;
    }
    
    public static Connection getConnection(String url, String user, String pw) throws ClassNotFoundException, SQLException {
        if (dbConn == null) {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            dbConn = DriverManager.getConnection(url, user, pw);
        }
        
        return dbConn;
    }
    
    public static void close() throws SQLException {
        if (dbConn != null) {
            if (!dbConn.isClosed()) {
                dbConn.close();
            }
        }
        
        dbConn = null;
    }

}
