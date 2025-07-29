/** ========================
 *     Test03.java
 *  ========================
 */

// select 쿼리문 수행
//  -> 데이터베이스로부터 질의 결과를 가져와야 하는 경우
//  -> executeQuery() 메서드 사용
//  -> ResultSet 반환
//  -> (반복문 활용)

package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.util.DBConn;

/**
 * @author sist
 *
 */
public class Test03
{

    /**
     * @param args
     */
    public static void main(String[] args)
    {
        Connection conn = DBConn.getConnection();
        
        if (conn != null)
        {
            System.out.println(">> 데이터베이스 연결 성공~!!!");

            try {
                // 작업 객체 생성
                Statement stmt = conn.createStatement();

                // 쿼리문 준비
                String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";

                // 작업 객체를 활용하여 쿼리문 실행

                //-- ※ 데이터베이스로부터 질의 결과를 가져와야 하는 경우
                //    --> executeQuery() 메서드 사용.
                //    즉, executeQuery("SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID") 를 사용하면
                //    질의 결과를 ResultSet 객체로 가져올 수 있다.
                //    ResultSet 객체가 질의에 대한 결과물 모두를 수신 완료한 것은 아니다.
                //    단지, 데이터베이스로부터 획득한 질의 결과뭉에 대한 관리만 수행할 뿐이다.
                //    즉, ResultSet 을 얻어냈다고 해서 데이터베이스와의 연결을 끊게 되면
                //    ResultSet 객체는 더 이상 질의 결과를 관리할 수 없게 된다.

                ResultSet rs = stmt.executeQuery(sql);
                //- ※ 연결된 형태의 데이터(레코드)로 결과값이 넘어온다.
                //   레코드들은 ResultSet 객체의 next() 메서드에 의해
                //   다음 레코드로 이동할 수 있다.
                //   모든 레코드를 출력해보기 위해서는 next() 메서드를 가지고
                //   다음으로... 또 그 다음으로... 다시 또 그 다음으로.. 이동하며 처리해야 한다.
                //   다음 레코드가 존재하면 next() 메서드는 true를 반환한다.
                
                while (rs.next()) // 다음 레코드의 존재 여부를 반복적으로 확인
                {
                    // 레코드에서 결과값을 가져오는 것은 [getXxx()] 메서드
                    String sid = rs.getString("SID");
                    String name = rs.getString("NAME");
                    String tel = rs.getString("TEL");
                    String str = String.format("%3s %8s %16s", sid, name, tel);
                    System.out.println(str);

                }
                
                // ResultSet 리소스 반납
                rs.close();
                
                // Statement 리소스 반납
                stmt.close();

            } catch (Exception e) {
                System.out.println(e.toString());
            }

            // 연결 해제 및 리소스 반납
            DBConn.close();

            System.out.println(">> 데이터베이스 연결 닫힘~!!!");
            System.out.println(">> 프로그램 종료됨~!!!");
        }
    }

}
