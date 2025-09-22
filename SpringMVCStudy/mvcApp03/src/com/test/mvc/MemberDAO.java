/**
 * =========================================
 *   MemberDAO.java
 *   - 데이터베이스 액션 처리 클래스
 *   - IMemberDAO 인터페이스를 구현하는 클래스
 *   - Connection 객체에 대한 의존성 주입 준비
 *      (SimpleDriverDataSource 활용)
 *       → 인터페이스 자료형 속성 구성
 *       → setter 메서드 추가
 * =========================================
 */

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MemberDAO implements IMemberDAO
{

    // ※ Connection 객체에 대한 의존성 주입을 위한 준비
    //  --------------- DataSource 활용
    
    // ① 인터페이스 형태의 데이터타입을 취하는 속성 구성
    private DataSource dataSource;
    //-- 스프링에서 제공
    
    // ② setter 구성 
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }

    // ※ IMemberDAO 인터페이스의 메소드 오버라이딩
    
    @Override
    public int add(MemberDTO member) throws SQLException
    {
        int result = 0;
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE)");
        sb.append(" VALUES(MEMBERLISTSEQ.NEXTVAL, ?, ?)");
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setString(1, member.getName());
        pstmt.setString(2, member.getTelephone());
        result = pstmt.executeUpdate();

        // 자원 반환
        pstmt.close();
        conn.close();
        
        // 결과 반환
        return result;
    }

    @Override
    public int count() throws SQLException
    {
        int result = 0;
        Connection conn = dataSource.getConnection();
        String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        
        ResultSet rs = pstmt.executeQuery();
        // if (rs.next() {
        while (rs.next()) {
//            result = rs.getInt("COUNT");
            result = rs.getInt(1);
        }

        // 자원 반환
        rs.close();
        pstmt.close();
        conn.close();
        
        // 결과 반환
        return result;
    }

    @Override
    public ArrayList<MemberDTO> list() throws SQLException
    {
        ArrayList<MemberDTO>  result = new ArrayList<MemberDTO>();
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT MID, NAME, TELEPHONE FROM TBL_MEMBERLIST");
        sb.append(" ORDER BY MID");
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            MemberDTO member = new MemberDTO();
            
            //member.setMid(rs.getInt("MID"));
            //member.setName(rs.getString("NAME"));
            //member.setTelephone(rs.getString("TELEPHONE"));
            member.setMid(rs.getInt(1));
            member.setName(rs.getString(2));
            member.setTelephone(rs.getString(3));
            
            result.add(member);
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return result;
    }

}
