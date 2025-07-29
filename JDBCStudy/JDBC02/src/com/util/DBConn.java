/** =========================
 *   DBConn.java
 * 
 *  =========================
 */

package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn
{
    public static Connection dbConn;
    
    public static Connection getConnection()
    {
        if (dbConn == null)
        {
            try
            {
                String url = "jdbc:oracle:thin:@211.238.142.174:1521:xe";
                String user = "scott";
                String password   = "tiger";
                
                Class.forName("oracle.jdbc.driver.OracleDriver");
                
                dbConn = DriverManager.getConnection(url, user, password);
            } catch (Exception e)
            {
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
				Class.forName("oracle.jdbc.driver.OracleDriver");
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
					dbConn.close();
				}
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}

		dbConn = null; 

	}

}
