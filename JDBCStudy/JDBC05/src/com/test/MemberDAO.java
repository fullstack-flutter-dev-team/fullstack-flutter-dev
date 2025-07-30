/** ===================
 *    MemberDAO.java
 *     - DB 액션 처리
 *  ===================
 */
package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

/**
 * @author sist
 *
 */
public class MemberDAO
{
    // 주요 속성 구성
    private Connection conn;

    // 데이터베이스 연결 액션 처리 (→ 생성자 형태로 처리)
    public MemberDAO() throws ClassNotFoundException, SQLException
    {
        conn = DBConn.getConnection();
    }

    // 데이터 입력(추가) 액션 처리 → insert 쿼리 → executeUpdate() → 적용된 행의 갯수 반환
    public int add(MemberDTO dto) throws SQLException
    {
        // 반환할 결과값 선언 및 초기화
        int result = 0;

        // 작업 객체 생성
        Statement stmt = conn.createStatement();

        // 쿼리문 준비(→ insert 쿼리문)
        // INSERT INTO TBL_MEMBER(SID, NAME , TEL) VALUES(MEMBER_SEQ.nextval, '김한국', '010-1234-5678');
        String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME , TEL)"
                                  + " VALUES(MEMBER_SEQ.nextval, '%s', '%s')"
                                  , dto.getName(), dto.getTel());

        // 쿼리문 실행(작업 수행) → executeUpdate() → 적용된 행의 갯수 반환 → 결과값에 대입
        result = stmt.executeUpdate(sql);

        // 작업 객체 리소스 반납
        stmt.close();

        // 최종 결과값 반환
        return result;
    }

    // 전체 인원 수 확인 액션 처리
    // → 조건에 따른 인원 수의 조회일 경우
    //   조건을 매개변수 형태로 넘겨줄 수 있도록 메서드 정의 가능
    //   단, 지금은 전체 인원 수의 조회에 해당하므로 매개변수 넘겨줄 필요 없음
    public int count() throws SQLException
    {
        // 반환할 결과값 선언 및 초기화
        int result = 0;

        // 작업 객체 생성
        Statement stmt = conn.createStatement();

        // 쿼리문 준비(-> select 쿼리문)
        String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
        //-- rs.getInt("COUNT(*)") //-- x 
        //-- rs.getInt(1) //--컬럼인덱스 o 

        // 쿼리문 실행(작업 수행) →  select →  executeQuery() → ResultSet반환 → 일반적으로 반복문 처리
        ResultSet rs = stmt.executeQuery(sql); //- 

        // DBConn.close(); //-- rs 연결이 끊김

        // result = rs.getInt("COUNT"); //-- X , next() 로 커서 이동을 해야 함
        
        // ResultSet 처리 → 반복문 구성
         while (rs.next())  //-- 1회  → if (rs.next())
        {
            // result = rs.getInt("COUNT");
            result = rs.getInt(1); //-- 인덱스는 1부터....
        }

        // 리소스 반납
        rs.close();
        stmt.close();

        // 최종 결과값 반환
        return result;
    }

    // 데이터 조회(전체 리스트 출력) 액션 처리
    // public MemberDTO들 lists()
    public ArrayList<MemberDTO> lists() throws SQLException
    {
        // 반환할 결과값 변수 선언 및 초기화
        // ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
        ArrayList<MemberDTO> result = new ArrayList<>();

        // 작업 객체 생성
        Statement stmt = conn.createStatement();


        // 커리문 준비(→ select 쿼리문)
        String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";

        // 쿼리문 실행 → select 쿼리문 → executeQuery() → ResultSet 반환
        ResultSet rs = stmt.executeQuery(sql);

        // ResultSet처리 → 반복문 구성
        while (rs.next())
        {
            // MemberDTO 객체 생성
            MemberDTO member = new MemberDTO();

            // 생성된 객체의 속성 구성
            // member.setSid(ResultSet으로부터 얻어낸 SID 컬럼의 데이터);
            // String sid = rs.getNString("SID");
            member.setSid(rs.getString("SID"));   // member.setSid(rs.getString(1));
            member.setName(rs.getString("NAME")); // member.setName(rs.getString(2));
            member.setTel(rs.getString("TEL"));   // member.setTel(rs.getString(3));

            // 반환할 자료구조(ArrayList → result)에 추가
            result.add(member);
        }

        // 리소스 반납
        rs.close();
        stmt.close();

        // 최종 결과값 반환
        return result;
    }


    // DB 연결 종료 액션 처리
    public void close() throws SQLException
    {
        DBConn.close();
    }
}

