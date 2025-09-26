/**
 * =========================================================
 *   PositionDAO.java
 *    - 데이터베이스 액션 처리 클래스
 *    - 직위 데이터 출력, 입력, 수정, 삭제 액션
 *    - Connection 객체(DataSource)에 대한 의존성 주입 준비
 *    - (인터페이스 속성 / setter 구성)
 * =========================================================
 */

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

/**
 * @author sist
 *
 */
public class PositionDAO implements IPositionDAO
{

    // 주요 속성 구성 
    private DataSource datasource;
    
    public void setDatasource(DataSource datasource)
    {
        this.datasource = datasource;
    }

    @Override
    public ArrayList<Position> list() throws SQLException
    {
        ArrayList<Position> posList = new ArrayList<Position>();
        Connection conn = datasource.getConnection();
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK");
        sql.append(" FROM POSITIONVIEW");
        sql.append(" ORDER BY POSITIONID");
        
        PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            Position pos = new Position();
            pos.setPositionId(rs.getString(1));
            pos.setPositionName(rs.getString(2));
            pos.setMinBasicPay(rs.getInt(3));
            pos.setDelCheck(rs.getInt(4));
            
            posList.add(pos);
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return posList;
    }

    @Override
    public int add(Position position) throws SQLException
    {
        /*
         * INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY)
         * VALUES(POSITIONSEQ.NEXTVAL, '상무', 5000000)
         */
        int result = 0;
        Connection conn = datasource.getConnection();
        StringBuffer sql = new StringBuffer();
        sql.append("INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) ");
        sql.append("  VALUES(POSITIONSEQ.NEXTVAL, ?, ?)");
        
        PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        pstmt.setString(1, position.getPositionName());
        pstmt.setInt(2, position.getMinBasicPay());
        
        result = pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
        
        return result;
    }

    @Override
    public int remove(String positionId) throws SQLException
    {
        int result = 0;
        Connection conn = datasource.getConnection();
        StringBuffer sql = new StringBuffer();
        sql.append("DELETE FROM POSITION WHERE POSITIONID=? ");
        
        PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        pstmt.setInt(1, Integer.parseInt(positionId));
        
        result = pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
        
        return result;
    }

    @Override
    public int modify(Position position) throws SQLException
    {
        int result = 0;
        Connection conn = datasource.getConnection();
        StringBuffer sql = new StringBuffer();
        
        sql.append("UPDATE POSITION");
        sql.append(" SET POSITIONNAME=?, MINBASICPAY=?");
        sql.append(" WHERE POSITIONID=?");
        
        PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        pstmt.setString(1, position.getPositionName());
        pstmt.setInt(2, position.getMinBasicPay());
        pstmt.setInt(3, Integer.parseInt(position.getPositionId()));
        
        result = pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
        
        return result;
    }

}
