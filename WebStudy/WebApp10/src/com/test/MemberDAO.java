/**
 * ==============================================
 *  MemberDAO.java
 *   - 데이터베이스 액션 처리 전용 객체 활용
 * ==============================================
 */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    
    // getter 구성
    public Connection getConn()
    {
        return conn;
    }
    
    // 생성자 → 사용자 정의 생성자 → 데이터베이스 연결
    public MemberDAO() throws ClassNotFoundException, SQLException {
        conn = DBConn.getConnection();
    }
    
    // 데이터 입력 메서드 정의
    public int add(MemberDTO member) throws SQLException {
        int result = 0;

        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBER_SEQ.nextval, ?, ?)");
        /* 
            // try with resource
            try (PreparedStatement pstmt = conn.prepareStatement(sb.toString())) {
                    pstmt.setString(1, member.getName());
                    pstmt.setString(2, member.getTel());
                    result = pstmt.executeUpdate();
                }
                
        */
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setString(1, member.getName());
        pstmt.setString(2, member.getTel());
        result = pstmt.executeUpdate();
        pstmt.close();
        
        return result;
    }
    
    
    // 리스트 출력(전체) 메서드 정의
    // public MemberDTO들 list(){
        public ArrayList<MemberDTO> list() throws SQLException {
        ArrayList<MemberDTO> result = new ArrayList<>();
        String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
        /* 
            try (PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                MemberDTO member = new MemberDTO();
                member.setSid(rs.getNString(1));
                member.setName(rs.getNString(2));
                member.setTel(rs.getNString(3));
                result.add(member);
            }
        }
         */
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            MemberDTO member = new MemberDTO();
            member.setSid(rs.getNString(1));
            member.setName(rs.getNString(2));
            member.setTel(rs.getNString(3));
            result.add(member);
        }

        rs.close();
        pstmt.close();

        return result;
    }
    
    
    // 인원수 확인을 위한 메서드 정의
    public int count() throws SQLException {
        int result = 0;

        String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            result = rs.getInt(1);
        }
        
        rs.close();
        pstmt.close();

        return result;
    }
    
    // 데이터베이스 연결 종료 담당 메서드 정의
    public void close() throws SQLException {
        DBConn.close();
    }
    

}
