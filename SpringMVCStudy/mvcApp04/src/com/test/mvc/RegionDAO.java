/**
 * =====================================
 *   RegionDAO.java
 *    - 데이터베이스 액션 처리 클래스
 *    - 지역 데이터 출력, 입력, 수정, 삭제 액션
 *    - Connection 객체에 대한 의존성 주입 준비
 *    - (인터페이스 속성 구성 / setter 구성)
 * =====================================
 */

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class RegionDAO implements IRegionDAO
{
    // 주요 속성 구성
    private DataSource dataSource;



    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }

    // 지역 리스트 조회
    @Override
    public ArrayList<Region> list() throws SQLException
    {
        /*
         * SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVIEW ORDER BY REGIONID;
         */
        
        ArrayList<Region> regList  = new ArrayList<Region>();
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT REGIONID, REGIONNAME, DELCHECK");
        sb.append(" FROM REGIONVIEW");
        sb.append(" ORDER BY REGIONID");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            Region region = new Region();
            region.setRegionId(rs.getString(1));
            region.setRegionName(rs.getString(2));
            region.setDelCheck(rs.getInt(3));
            
            regList.add(region);
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return regList;
    }

    // 지역 데이터 등록(입력, 추가)
    @Override
    public int add(Region region) throws SQLException
    {
        // INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '강원')
        int result = 0;
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("INSERT INTO REGION(REGIONID, REGIONNAME) ");
        sb.append(" VALUES(REGIONSEQ.NEXTVAL, ?)");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setString(1, region.getRegionName());
        
        pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
        
        return result;
    }

    /**
     *  지역 데이터 삭제
     */
    @Override
    public int remove(String regionId) throws SQLException
    {
        /*
         * DELETE FROM REGION WHERE REGIONID=3;
         */
        int result = 0;
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("DELETE");
        sb.append(" FROM REGION");
        sb.append(" WHERE REGIONID=?");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setInt(1, Integer.parseInt(regionId));
        
        result = pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
        
        return result;
    }

    // 지역 데이터 수정
    @Override
    public int modify(Region region) throws SQLException
    {
        /*
         * UPDATE REGION SET REGIONNAME='제주' WHERE REGIONID=4;
         */
        int result = 0;
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("UPDATE REGION");
        sb.append(" SET REGIONNAME=?");
        sb.append(" WHERE REGIONID=?");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setString(1, region.getRegionName());
        pstmt.setInt(2, Integer.parseInt(region.getRegionId()));
        
        result = pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
        
        return result;
    }

    // 지역 데이터 검색
    @Override
    public Region search(String regionId) throws SQLException
    {
        Region region = new Region();
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT REGIONID, REGIONNAME, DELCHECK");
        sb.append(" FROM REGIONVIEW");
        sb.append(" WHERE REGIONID=?");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setInt(1, Integer.parseInt(regionId));
        
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            region.setRegionId(rs.getString(1));
            region.setRegionName(rs.getString(2));
            region.setDelCheck(rs.getShort(3));
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return region;
    }

}
