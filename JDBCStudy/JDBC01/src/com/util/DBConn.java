
/** ==============================
 *    DBconn.java
 *  ==============================
 */

// 싱글톤 패턴을 이용한 데이터베이스 연결 객체 생성 전용 클래스 설계
//-- DB 연결 과정이 가장 부하가 크기 때문에
//   한 번 연결된 객체를 계속 사용하는 것이 리소스 낭비를 줄일 수 있다.

package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn
{
   // Connection 타입의 클래스 변수 dbConn
   //-- 자동으로 null 초기화
   private static Connection dbConn;
   
   // 연결 메서드
   public static Connection getConnection()
   {
      //-- 한 번 연결된 객체를 계속 사용
      //   연결되지 않은 경우에만 연결을 시도 -> 싱글톤(singleton)
      if (dbConn == null)
      {
         try
         {
            String url  = "jdbc:oracle:thin:@211:238:142:174:1521:xe";
            //-- IP 주소는 오라클 서버의 주소
            //   -> 로컬 구성 시 localhost 나 127로 시작하는 loop back address로 대체 가능
            //      1521은 오라클 리스너 Port Number
            //      xe는 오라클 SID (현재 Express Edition 을 사용중이므로...)
            String user = "scott"; //-- 오라클 사용자 계정 이름
            String pwd  = "tiger"; //-- 오라클 사용자 계정 암호
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            //-- OracleDriver 클래스에 대한 객체 생성
            
            dbConn = DriverManager.getConnection(url, user, pwd);
            //-- 오라클 서버 실제 연결
            //   갖고있는 인자값은 오라클주소, 계정명, 계정 패스워드
         } catch (Exception e)
         {
            // Exception 대신 SQLException 사용 가능
            // 단, SQLException을 사용할 경우 forName() 도
            // 반드시 예외 처리를 해 주어야 한다.
            // 현재는 Exception 사용으로
            // ClassNotFoundException 과 SQLException 두 개 동시 처리

            System.out.println(e.toString());
            //-- 오라클 서버 연결 실패 시 오류 메세지 출력 부분
         }
      }
      
      return dbConn;
   }
   
   // getConnection() 메서드 오버로딩
   public static Connection getConnection(String url, String user, String pwd)
   {
        // dbConn 변수(멤버 변수)는
        // Database가 연결된
        // 
        // 
      if (dbConn == null)
      {
         try
         {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            dbConn = DriverManager.getConnection(url, user, pwd);
         } catch (Exception e)
         {
            System.out.println(e.toString());
         }
      }
      
      return dbConn;
   }
   
   public static void close()
   {
        // 연결된 상태일 경우에만 해제를 수행
        if (dbConn != null)
        {
            try
            {
                // isClose() 메서드를 통해 연결상태 확인
                if (!dbConn.isClosed())
                {
                    dbConn.close();
                    //-- close() 메서드를 통해 연결 종료
                }
            } catch (Exception e)
            {
                System.out.println(e.toString());
            }

        dbConn = null; // check~!!!
        }
   }
}
