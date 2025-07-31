/**
 * ======================================
 *        Test05.java
 * ======================================
 */

 /*
  실행 예)

  번호 입력(-1 종료) : 8
  이름 입력 : 도우너
  전화번호 입력 : 010-2222-1213
  >> 데이터베이스 연결 성공~!!!
  >> 회원 정보가 입력되었습니다~!!!

  번호 입력(-1 종료) : -1
  >> 데이터베이스 연결 닫힘~!!!
  >> 프로그램 종료됨~!!!
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
    
    public void test() {
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

    /**
     * @param args
     */
    public static void main(String[] args) throws ClassNotFoundException, SQLException
    {
        Test05 obj = new Test05();
//        obj.test();

        Scanner sc = new Scanner(System.in);
        int sid;
        String name;
        String tel;
        String sql;
        Connection conn;
        try
        {
        
            do
            {
                System.out.print("\n번호 입력(-1 종료) : ");
                sid = sc.nextInt();
                if (sid == -1)
                {
                    break;
                }

                System.out.print("이름 입력 : ");
                name = sc.next();
                System.out.print("전화번호 입력 : ");
                tel = sc.next();

                conn = DBConn.getConnection();
                if (conn != null)
                {
                    System.out.println(">> 데이터베이스 연결 성공~!!!");

                    // -- 기존 Statement 방식
                    // Statement stmt = conn.createStatement();
                    // String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(12, '김한국-12',
                    // '010-1222-5678')";

                    // -- PreparedStatement 방식
                    // -- 전처리
                    // 쿼리문 준비
                    sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)" + " VALUES(?, ?, ?)";
                    // + " VALUES(?, '?', '?')"; // ------------(x)

                    // PreparedStatement 작업 객체 생성
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    //-- PreparedStatement 생성 시
                    //   전처리를 수행할 쿼리문을 넘겨주어야 하기 때문에
                    //   Statement를 사용할 때와는 달리
                    //    쿼리문의 준비가 선행되어야 한다.

                    // IN 매개변수 넘겨주기
                    pstmt.setInt(1, sid);
                    pstmt.setString(2, name);
                    pstmt.setString(3, tel);

                    // int result = pstmt.executeUpdate(sql);
                    int result = pstmt.executeUpdate();
                    //-- Statement를 사용할 때와는 달리
                    //    executeQuery()나 executeUpdate() 호출 시
                    //    쿼리문을 매개변수로 넘겨주지 않는다.
                    //    이는, 작업 객체 생서 시점에서
                    //    이미 전처리할 쿼리문을 넘겨받았기 때문이다.

                    if (result > 0)
                    {
                        System.out.println(">> 데이터 입력 성공~!!!");
                    }
                }
            } while (true);
            
            DBConn.close();
            System.out.println(">> 데이터베이스 연결 닫힘!!!");
            System.out.println(">> 프로그램 종료됨~!!!");
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
    }

}
