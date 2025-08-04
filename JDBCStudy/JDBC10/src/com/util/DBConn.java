
// 예외 처리 throws
package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
    public static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
    public static final String JDBC_URL   = "jdbc:oracle:thin:@211.238.142.174:1521:xe";
    public static final String JDBC_USER  = "scott";
    public static final String JDBC_PW    = "tiger";
    private static Connection dbConn;

    public static Connection getConnection() throws ClassNotFoundException, SQLException
    {
        if (dbConn == null) {
            try {
                Class.forName(JDBC_DRIVER);
                dbConn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PW);
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }

        return dbConn;
    }
    
    public static Connection getConnection(String url, String user, String password) throws SQLException
    {
        if (dbConn == null) {
            try {
                Class.forName(JDBC_DRIVER);
                dbConn = DriverManager.getConnection(url, user, password);
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }
        return dbConn;
    }

    public static void close() throws SQLException
    {
        if (dbConn != null) {
            if (!dbConn.isClosed()) {
                dbConn.close();
            }
        }
        dbConn = null;
    }
}
