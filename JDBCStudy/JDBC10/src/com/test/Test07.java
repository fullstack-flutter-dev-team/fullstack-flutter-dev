/**
 *  ===================================
 * 
 */
package com.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;

import com.util.DBConn;

/**
 * @author sist
 *
 */
public class Test07
{

    /**
     * @param args
     */
    public static void main(String[] args) throws ClassNotFoundException, SQLException
    {

        try {
            Scanner sc = new Scanner(System.in);
            Connection conn = DBConn.getConnection();

            do {
                System.out.print("이름 입력(-1종료) :");
                String name = sc.next();

                if (name.equals("-1")) {
                    break;
                }
                System.out.print("전화번호 :");
                String tel = sc.next();

                if (conn != null) {
                    System.out.println("\n>> 데이터베이스 연결 성공~!!!");
                    try {
                        String sql = "{call PROC_MEMBERINSERT(?,?)}";
    
                        CallableStatement cstmt = conn.prepareCall(sql);
    
                        cstmt.setString(1, name);
                        cstmt.setString(2, tel);
    
                        int result = cstmt.executeUpdate();
                        if (result > 0) {
                            System.out.println(">> 회원이 등록되었습니다~!!!");
                        }
                    } catch (Exception e) {
                        System.out.println(e.toString());
                    }
                }
            } while (true);
            
            DBConn.close();
            System.out.println(">> 데이터베이스 연결 닫힘~!!!");
            System.out.println(">> 프로그램 종료~!!!");

        } catch (Exception e) {
            System.out.println(e.toString());
		}
    }
}
