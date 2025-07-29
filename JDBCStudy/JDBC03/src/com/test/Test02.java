/** ==================
 *     Test02.java
 * ===================
 */

/* 
-▣ JDBC 프로그램의 작성
   1. 드라이버 객체 생성
      데이터베이스와 연경을 위해 사용할 파일들이 있는지 확인한다.
      여기서는 굳이 객체를 생성하지 않고
      드라이버가 있는지만 확인하더라도 프로그램을 실행하는 데는 지장이 없다.
      - 드라이버 클래스 찾는 방법
        Class 라는 클래스의 forName() 메서드 사용
        이 메서드는 매개변수로 받은 이름의 클래스를 찾아주는 역활을 하며(JVM에 로딩)
        해당 클래스를 찾지 못할 경우 ClassNotFoundException 예외를 발생시킨다.
   
   2. 연결 객체 생성
      찾은 드라이버 클래스를 가지고
      설치된 데이터베이스 서버와 연결하는 Connection 객체를 생성한다.
      - Connection 객체는 DriverManager 클래스의 getConnection() 이라는
        static 메서드를 생성하게 된다.
        예외는 데이터베이스 서버와 연결하는 시점에 발생하며
        SQLException 예외를 발생시키게 된다.

   3. 작업 객체 생성
      연결된 포트를 통해 질의문을 보낼 수 있도록 도와주는 객체를 생성한다.
      자바에서는 크게 세 가지 방법으로 질의를 처리한다.

      1) Statement 객체 생성
         정적 질의를 처리할 때 주로 사용
      2) PreparedStatement 객체 생성 (Secure 코딩에 사용)
         동적 질의를 처리할 때 주로 사용
      3) CallableStatement 객체 생성
         프로시저나 함수를 호출할 수 있도록 처리해주는 객체

    4. 생성된 작업 객체가 수행하는 작업
       executeUpdate()  or executeQuery()
 */

/* 
   실행 예)
    
   번호를 입력하세요(-1 종료) : 2
   이름을 입력하세요 : 김한국
   전화번호를 입력하세요 : 0101-1234-5678
   >> 데이터베이스 연결 성공~!!!
   >> 회원 정보가 입력되었습니다~!!!

   번호를 입력하세요(-1 종료) : 3
   이름을 입력하세요 : 김한국2
   전화번호를 입력하세요 : 0101-2222-5678
   >> 데이터베이스 연결 성공~!!!
   >> 회원 정보가 입력되었습니다~!!!

   번호를 입력하세요(-1 종료) : -1
   >> 데이터베이스 연결 닫힘~!!!
   >> 프로그램 종료됨~!!!
 */

package com.test;

import java.sql.Connection;
import java.sql.Statement;
import java.util.Scanner;

import com.util.DBConn;

/**
 * @author sist
 *
 */
public class Test02
{

    /**
     * @param args
     */
    public static void main(String[] args)
    {
        int nSid, nResult;
        String name;
        String tel;
        String sql;
        int iCommand;
        boolean isRun = true;
        Connection conn = DBConn.getConnection();

        if (conn == null)
        {
            System.out.println("데이터베이스 연결 실패~!!!");
            System.exit(-1);
        }

        try {
           Statement stmt = conn.createStatement();
           Scanner sc = new Scanner(System.in);

           while (true) { 
              System.out.print("번호를 입력하세요(-1  종료) : ");
              iCommand = sc.nextInt(); 
              if (iCommand == -1) {
                  System.out.println(">> 데이터베이스 연결 닫힘~!!!");
                  System.out.println(">> 프로그램 종료됨~!!!");
                  DBConn.close();
                  break;
              }

              System.out.print("이름을 입력하세요 : ");
              name = sc.next();
              System.out.print("전화번호를 입력하세요 : ");
              tel = sc.next();
              if (iCommand != -1) {
                 sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(" + iCommand + ", \'" + name + "\', \'" + tel + "\')";
                 nResult = stmt.executeUpdate(sql);
               //   System.out.println(sql);
                  if (nResult > 0) {
                     System.out.println(">> 데이터베이스 연결 성공~!!!");
                     System.out.println(">> 회원 정보가 입력되었습니다~!!!");
                  }
              }
           };
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            DBConn.close();
        }


        
    }

}
