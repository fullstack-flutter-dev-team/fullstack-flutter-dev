/** ==========================
 *     Test01.java
 *  ==========================
 */

package com.test;

import java.sql.Connection;
import java.sql.Statement;

import com.util.DBConn;

/**
 * @author sist
 *
 */
public class Test01
{

    /**
     * @param args
     */
    public static void main(String[] args)
    {
        Connection conn = DBConn.getConnection();

        if (conn == null)
        {
            System.out.println("데이터베이스 연결 실패~!!!");
            System.exit(0);
        }

//        System.out.println("데이터베이스 연결 성공~!!!");
        try {
            // conn : Connection 객체
            // createStatemennt() : 작업 객체(Statement)를 생성하는 메서드
            Statement stmt = conn.createStatement(); // 파란색 바구니(수레)

            // 쿼리문 준비(→ insert 쿼리문)
            String sql;
            sql = "INSERT INTO TBL_MEMBER(SID, NAME , TEL) VALUES(1, '김한국', '010-1234-5678')";
            // 주의. 쿼리문을 문자열로 구성하는 과정에서
            //       공백 발생 지점을 명확히 처리할 수 있도록 한다.
            // 주의. 문자열 영역 안에서 쿼리문 끝에 ; 을 붙이지 않는다.
            // 주의. 자바에서 실행한 DML 구문은 내부적으로 자동 COMMIT 된다.
            // 주의. 
            
            int result = stmt.executeUpdate(sql);
			if (result > 0)
			{
				System.out.println("데이터 입력 성공~!!!");
			}
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }

		DBConn.close();
        
    }

}
