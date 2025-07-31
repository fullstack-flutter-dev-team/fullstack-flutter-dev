/**
 * 
 */

 // 실행 예)
 /* 
   번호 

  */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

import com.util.DBConn;

/**
 * @author sist
 *
 */
public class Test05
{

	/**
	 * @param args
	 */
	public static void main(String[] args) throws SQLException
	{
        do
        {
            Scanner sc = new Scanner(System.in);
            System.out.print("번호 입력(-1 종료) : ");
            int sid = sc.nextInt();
            if (sid == -1)
            {
                break;
            }

            System.out.print("이름 입력 : ");
            String name = sc.next();
            System.out.print("전화번호 입력 : ");
            String tel = sc.next();

  
 
            
            try
            {
                Connection conn = DBConn.getConnection();

                if (conn != null)
                {
                    System.out.println(">> 데이터베이스 연결 성공~!!!");

                    // -- 기존 Statement 방식
                    // Statement stmt = conn.createStatement();
                    // String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(12, '김한국-12',
                    // '010-1222-5678')";

                    // -- PreparedStatement 방식
                    // -- 전처리
                    String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)" + " VALUES(?, ?, ?)";
                    // + " VALUES(?, '?', '?')"; // ------------(x)

                    // PreparedStatement 작업 객체 생성
                    PreparedStatement pstmt = conn.prepareStatement(sql);

                    // IN 매개변수 넘겨주기
                    pstmt.setInt(1, sid);
                    pstmt.setString(2, name);
                    pstmt.setString(3, tel);

                    // int result = pstmt.executeUpdate(sql);
                    int result = pstmt.executeUpdate();

                    if (result > 0)
                    {
                        System.out.println(">> 데이터 입력 성공~!!!");
                    }
                }

            } catch (Exception e)
            {
                System.out.println(e.toString());
            }
        } while (true);
        
        DBConn.close();
        System.out.println(">> 데이터베이스 연결 닫힘!!!");
        System.out.println(">> 프로그램 종료됨~!!!");
    }

}
