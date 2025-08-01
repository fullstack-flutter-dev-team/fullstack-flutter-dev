/**
 * 
 */
package com.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import com.util.DBConn;

import oracle.jdbc.OracleTypes;

/**
 * @author sist
 *
 */
public class Test08
{

    /**
     * @param args
     */
    public static void main(String[] args)
    {

        try {
            Connection conn = DBConn.getConnection();

            if (conn != null)
            {
                System.out.println("\n>> 데이터베이스 연결 성공");

                try {
                    // 프로시저 호출을 위한 쿼리문 준비
                    String sql = "{call PRC_MEMBERSELECT(?)}";

                    // 작업 객체(CallableStatement) 생성
                    CallableStatement cstmt = conn.prepareCall(sql);

                    // check~!!!
                    // OracleTypes.CURSOR 을 등록하기 위해서는
                    // 1. 프로젝트명(JDBC10)에서 마우스 우클릭
                    // 2. Build Path 메뉴 선택 > Configure Build Path 메뉴 선택
                    // 3. Libraries 탭 선택
                    // 4. Add External Jars 버튼 클릭
                    // 5. ojdbc6.jar 파일 연결(추가)
                    // 6. import 구문에 oracle.jdbc.OracleTypes; 추가
                    cstmt.registerOutParameter(1, OracleTypes.CURSOR); //-- OUT 매개변수 등록

                    // check~!!!
                    // ResultSet rs = cstmt.executeQuery(); //--(x)
                    cstmt.executeQuery();

                    // check~!!!
                    // Object -> ResultSet 으로 다운캐스팅
                    ResultSet rs = (ResultSet)cstmt.getObject(1);

                    while (rs.next())
                    {
                        String sid = rs.getString("SID");
                        String name = rs.getString("NAME");
                        String tel = rs.getString("TEL");

                        String str = String.format("%3s %10s % 20s", sid, name, tel);
						System.out.println(str);
                    }

                    rs.close();
                    cstmt.close();

                } catch (Exception e) {
                }
            }

            DBConn.close();
            System.out.println("\n>> 데이터베이스 연결 닫힘~!!!");
            System.out.println(">> 프로그램 종료");

        } catch (Exception e) {
        }
    }

}
