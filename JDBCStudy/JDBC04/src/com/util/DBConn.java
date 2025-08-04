/**
 * 
 */
package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author sist
 *
 */
public class DBConn
{
    public static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
    public static final String JDBC_URL = "jdbc:oracle:thin:@211.238.142.174:1521:xe";
    
    public static Connection dbConn;
    
    public static Connection getConnection()
    {
        if (dbConn == null)
        {
            try {
                String url = JDBC_URL;
                String user = "scott";
                String password = "tiger";
                Class.forName(DBConn.JDBC_DRIVER);
                dbConn = DriverManager.getConnection(url, user, password);
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }

        return dbConn;
    }

    public static Connection getConnection(String url, String user, String password)
    {
        if (dbConn == null)
        {
            try {
                Class.forName(DBConn.JDBC_DRIVER);
                dbConn = DriverManager.getConnection(url, user, password);
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }

        return dbConn;
    }

    public static void close()
    {
        if (dbConn != null)
        {
            try {
                if (!dbConn.isClosed())
                {
                    dbConn.close();;
                }
            } catch (Exception e) {
                System.out.println(e.toString());
            }

        }
        
        dbConn = null;
    }

}
