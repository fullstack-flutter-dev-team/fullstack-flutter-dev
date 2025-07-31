/**
 * ======================================
 *   Test04.java
 * ======================================
 */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.util.DBConn;


/**
 * @author sist
 *
 */
public class Test04
{

    /**
     * @param args
     */
    public static void main(String[] args) throws SQLException
    {
        try {
            Connection conn = DBConn.getConnection();

            if (conn != null) {
                System.out.println(">> 데이터베이스 연결 성공~!!!");

                //-- 기존 Statement 방식
                // Statement stmt = conn.createStatement();
                // String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(12, '김한국-12', '010-1222-5678')";
                
                //-- PreparedStatement 방식
                //-- 전처리
                String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
                           + " VALUES(?, ?, ?)";
                        //    + " VALUES(?, '?', '?')";   // ------------(x)
                
                // PreparedStatement 작업 객체 생성
                PreparedStatement pstmt = conn.prepareStatement(sql);

                // IN 매개변수 넘겨주기
                pstmt.setInt(1, 13);
                pstmt.setString(2, "김미국");
                pstmt.setString(3, "010-5555-1234");
                
                // int result = pstmt.executeUpdate(sql);
				int result = pstmt.executeUpdate();

                if (result > 0) {
                    System.out.println(">> 데이터 입력 성공~!!!");
                }
            }

            DBConn.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

}
