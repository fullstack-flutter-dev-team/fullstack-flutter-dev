/** =========================
 *    Test00.java
 *  ==========================
 */

package com.test;

import java.sql.Connection;

import com.util.DBConn;

public class Test00
{
    public static void main(String[] args) {
        Connection conn = DBConn.getConnection();
        //-- getConnection() 메서드를 통해 연결 수행

        if (!conn.isClosed())
        {
            System.out.println("데이터베이스 연결 성공~!!!");
        } else {
            System.out.println("데이터베이스 연결 실패 ㅠㅠ");
        }

        DBConn.close();
        //-- close() 메서드를 통해 연결 종료
    }

}
