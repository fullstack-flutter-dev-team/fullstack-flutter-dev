/** ======================
 *      DBConn.java
 *  ======================
 */

 // 기존의 DBConn 클래스와 같은 코드로 구성되어 있으나
 // 예외 처리 방식을 바꾼 클래스로 설계(→ throws)
package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author sist
 *
 */
public class DBConn
{
    public static final String JDBC_CLASS = "oracle.jdbc.driver.OracleDriver";
    public static final String JDBC_URL = "jdbc:oracle:thin:@211.238.142.174:1521:xe";

    public static Connection dbConn;

    public static Connection getConnection() throws ClassNotFoundException, SQLException
    {
        if (dbConn == null)
        {
            String url = DBConn.JDBC_URL;
            String user = "scott";
            String password = "tiger";
            Class.forName(DBConn.JDBC_CLASS);
            dbConn = DriverManager.getConnection(url, user, password);
        }

        return dbConn;
    }

    public static Connection getConnection(String url, String user, String password)
            throws ClassNotFoundException, SQLException
    {
        if (dbConn == null)
        {
            Class.forName(DBConn.JDBC_CLASS);
            dbConn = DriverManager.getConnection(url, user, password);
        }

        return dbConn;
    }

    public static void close() throws SQLException
    {
        if (dbConn != null)
        {
            if (!dbConn.isClosed())
            {
                dbConn.close();
            }
        }

        dbConn = null;
    }

}
