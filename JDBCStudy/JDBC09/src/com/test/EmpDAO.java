/** ===========================
 *   ScoreDAO.java
 *  ===========================
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
public class EmpDAO
{
    // 주요 속성 구성
    private Connection conn;


    // 데이터베이스 연결
    public Connection connection() throws ClassNotFoundException, SQLException
    {
        conn = DBConn.getConnection();
        return conn;
    }
    
    // 사원 데이터 입력
    public int addEmp(EmpDTO empDTO) throws SQLException
    {
        int result = 0;
        String sql = new StringBuilder()
                    .append("INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE")
                    .append(", CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG)")
                    .append(" VALUES(EMPSEQ.NEXTVAL")
                    .append(", ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?, ?)")
                    .toString();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, empDTO.getEmpName());  // EMP_NAME
        pstmt.setString(2, empDTO.getSsn());      // SSN
        pstmt.setString(3, empDTO.getIbsaDate()); // IBSADATE
        pstmt.setInt(4, empDTO.getCityId());      // CITY_ID
        pstmt.setString(5, empDTO.getTel());      // TEL
        pstmt.setInt(6, empDTO.getBuseoId());     // BUSEO_ID
        pstmt.setInt(7, empDTO.getJikwiId());     // JIKWI_ID
        pstmt.setInt(8, empDTO.getBasicpay());    // BASICPAY
        pstmt.setInt(9, empDTO.getSudang());      // SUDANG
        result = pstmt.executeUpdate();
        
        pstmt.close();

        return result;
    }
    
    
    // 사원 전체 리스트 확인
    public ArrayList<EmpViewDTO> empList(int nSubMenu) throws SQLException
    {
        ArrayList<EmpViewDTO> result = new ArrayList<>();
        String sql;
        StringBuilder sb = new StringBuilder()
                    .append("SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE")
                    .append(", C.CITY_LOC, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME, J.MIN_BASICPAY")
                    .append(", E.BASICPAY, E.SUDANG, (E.BASICPAY+E.SUDANG) AS PAY")
                    .append(" FROM TBL_EMP E, TBL_CITY C, TBL_BUSEO B, TBL_JIKWI J")
                    .append(" WHERE E.CITY_ID = C.CITY_ID")
                    .append("  AND E.BUSEO_ID =  B.BUSEO_ID")
                    .append("  AND E.JIKWI_ID = J.JIKWI_ID");
        switch (nSubMenu)
        {
            case 1: sb.append(" ORDER BY E.EMP_ID"); break;
            case 2: sb.append(" ORDER BY E.EMP_NAME"); break;
            case 3: sb.append(" ORDER BY B.BUSEO_ID"); break;
            case 4: sb.append(" ORDER BY J.JIKWI_ID"); break;
            case 5: sb.append(" ORDER BY (E.BASICPAY+E.SUDANG) DESC"); break;
            default: sb.append(" ORDER BY E.EMP_ID"); break;
        }

        sql = sb.toString();
        PreparedStatement pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
             EmpViewDTO empViewDto = new EmpViewDTO();
             empViewDto.setEmpId(rs.getInt("EMP_ID"));
             empViewDto.setEmpName(rs.getString("EMP_NAME"));
             empViewDto.setSsn(rs.getString("SSN"));
             empViewDto.setIbsaDate(rs.getString("IBSADATE"));
             empViewDto.setCityLoc(rs.getString("CITY_LOC"));
             empViewDto.setTel(rs.getString("TEL"));
             empViewDto.setBuseoName(rs.getString("BUSEO_NAME"));
             empViewDto.setJikwiName(rs.getString("JIKWI_NAME"));
             empViewDto.setBasicpay(rs.getInt("BASICPAY"));
             empViewDto.setSudang(rs.getInt("SUDANG"));
             empViewDto.setPay(rs.getInt("PAY"));
             result.add(empViewDto);
         }
        
        rs.close();
        pstmt.close();

        return result;
    }

     // 지역 전체 리스트 확인
    public ArrayList<CityDTO> cityList() throws SQLException
    {
        ArrayList<CityDTO> result = new ArrayList<>();
        String sql  = new StringBuilder()
                        .append("SELECT CITY_ID, CITY_LOC")
                        .append(" FROM TBL_CITY")
                        .append(" ORDER BY CITY_ID")
                        .toString();
        PreparedStatement pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
             CityDTO cityDto = new CityDTO();
             cityDto.setCityId(rs.getInt("CITY_ID"));
             cityDto.setCityLoc(rs.getString("CITY_LOC"));
             result.add(cityDto);
         }
        
        rs.close();
        pstmt.close();

        return result;
    }

    // 부서  전체 리스트 확인
    public ArrayList<BuseoDTO> buseoList() throws SQLException
    {
        ArrayList<BuseoDTO> result = new ArrayList<>();
        String sql  = new StringBuilder()
                        .append("SELECT BUSEO_ID, BUSEO_NAME")
                        .append(" FROM TBL_BUSEO")
                        .append(" ORDER BY BUSEO_ID")
                        .toString();
        PreparedStatement pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
             BuseoDTO buseoDto = new BuseoDTO();
             buseoDto.setBuseoId(rs.getInt("BUSEO_ID"));
             buseoDto.setBuseoName(rs.getString("BUSEO_NAME"));
             result.add(buseoDto);
         }
        
        rs.close();
        pstmt.close();

        return result;
    }

    // 직위 전체 리스트 확인
    public ArrayList<JikwiDTO> jikwiList() throws SQLException
    {
        ArrayList<JikwiDTO> result = new ArrayList<>();
        String sql  = new StringBuilder()
                        .append("SELECT JIKWI_ID, JIKWI_NAME")
                        .append(" FROM TBL_JIKWI")
                        .append(" ORDER BY JIKWI_ID")
                        .toString();
        PreparedStatement pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
             JikwiDTO jikwiDto = new JikwiDTO();
             jikwiDto.setJikwiId(rs.getInt("JIKWI_ID"));
             jikwiDto.setJikwiName(rs.getString("JIKWI_NAME"));
             result.add(jikwiDto);
         }
        
        rs.close();
        pstmt.close();

        return result;
    }

    // 직위에 따른 최소급여 확인
    public int getMinBasicpayByJikwi(String strJikwiName) throws SQLException
    {
        int result = 0;
        String sql  = new StringBuilder()
                        .append("SELECT MIN_BASICPAY")
                        .append(" FROM TBL_JIKWI")
                        .append(" WHERE JIKWI_NAME LIKE ?").toString();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "%" + strJikwiName + "%");

        ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
            result = rs.getInt("MIN_BASICPAY");
         }
        
        rs.close();
        pstmt.close();

        return result;
    }

    public int getCityIdByLoc(String strCityLoc) throws SQLException
    {
        int result = 0;
        String sql  = new StringBuilder()
                        .append("SELECT CITY_ID")
                        .append(" FROM TBL_CITY")
                        .append(" WHERE CITY_LOC LIKE ?").toString();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "%" + strCityLoc + "%");

        ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
            result = rs.getInt("CITY_ID");
         }
        
        rs.close();
        pstmt.close();

        return result;
    }

    public int getBuseoIdByName(String strBuseoName) throws SQLException
    {
        int result = 0;
        String sql  = new StringBuilder()
                        .append("SELECT BUSEO_ID")
                        .append(" FROM TBL_BUSEO")
                        .append(" WHERE BUSEO_NAME LIKE ?").toString();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "%" + strBuseoName + "%");

        ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
            result = rs.getInt("BUSEO_ID");
         }
        
        rs.close();
        pstmt.close();

        return result;
    }

    public int getJikwiIdByName(String strJikwiName) throws SQLException
    {
        int result = 0;
        String sql  = new StringBuilder()
                        .append("SELECT JIKWI_ID")
                        .append(" FROM TBL_JIKWI")
                        .append(" WHERE JIKWI_NAME LIKE ?").toString();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "%" + strJikwiName + "%");

        ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
            result = rs.getInt("JIKWI_ID");
         }
        
        rs.close();
        pstmt.close();

        return result;
    }

     // 직원 검색 리스트 출력
    public ArrayList<EmpViewDTO> empSearchList(int nSubMenu, String strValue) throws SQLException
    {
        ArrayList<EmpViewDTO> result = new ArrayList<>();
        String sql;
        StringBuilder sb = new StringBuilder()
                    .append("SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE")
                    .append(", C.CITY_LOC, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME, J.MIN_BASICPAY")
                    .append(", E.BASICPAY, E.SUDANG, (E.BASICPAY+E.SUDANG) AS PAY")
                    .append(" FROM TBL_EMP E, TBL_CITY C, TBL_BUSEO B, TBL_JIKWI J")
                    .append(" WHERE E.CITY_ID = C.CITY_ID")
                    .append("  AND E.BUSEO_ID =  B.BUSEO_ID")
                    .append("  AND E.JIKWI_ID = J.JIKWI_ID");
        switch (nSubMenu)
        {
            case 1: sb.append(" AND E.EMP_ID = ? ORDER BY E.EMP_ID"); break;
            case 2: sb.append(" AND E.EMP_NAME LIKE ? ORDER BY E.EMP_NAME"); break;
            case 3: sb.append(" AND B.BUSEO_NAME LIKE ? ORDER BY B.BUSEO_ID"); break;
            case 4: sb.append(" AND J.JIKWI_NAME LIKE ? ORDER BY J.JIKWI_ID"); break;
            default: sb.append(" AND E.EMP_ID = ? ORDER BY E.EMP_ID"); break;
        }

        sql = sb.toString();
        // System.out.println(sql);
        PreparedStatement pstmt = conn.prepareStatement(sql);

        if (nSubMenu == 1) {
            pstmt.setInt(1, Integer.parseInt(strValue));
        } else {
            pstmt.setString(1, "%" + strValue + "%"); 
        }

        ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
             EmpViewDTO empViewDto = new EmpViewDTO();
             empViewDto.setEmpId(rs.getInt("EMP_ID"));
             empViewDto.setEmpName(rs.getString("EMP_NAME"));
             empViewDto.setSsn(rs.getString("SSN"));
             empViewDto.setIbsaDate(rs.getString("IBSADATE"));
             empViewDto.setCityLoc(rs.getString("CITY_LOC"));
             empViewDto.setTel(rs.getString("TEL"));
             empViewDto.setBuseoName(rs.getString("BUSEO_NAME"));
             empViewDto.setJikwiName(rs.getString("JIKWI_NAME"));
             empViewDto.setBasicpay(rs.getInt("BASICPAY"));
             empViewDto.setSudang(rs.getInt("SUDANG"));
             empViewDto.setPay(rs.getInt("PAY"));
             result.add(empViewDto);
         }
        
        rs.close();
        pstmt.close();

        return result;
    }
    
    // 직원 데이터 삭제
    public int removeEmp(int nEmpId) throws SQLException
    {
        int result = 0;
        String sql = "DELETE FROM TBL_EMP WHERE EMP_ID=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, nEmpId);
        
        result = pstmt.executeUpdate();
        pstmt.close();
        
        return result;
    }


    // 직원 정보 변경
    public int updateEmpInfo(EmpDTO dto) throws SQLException
    {
        int result = 0;
        String sql = new StringBuilder()
                    .append("UPDATE TBL_EMP ")
                    .append(" SET EMP_NAME = ?")
                    .append(" , SSN = ?")
                    .append(" , IBSADATE = TO_DATE(?, 'YYYY-MM-DD')")
                    .append(" , CITY_ID = ?")
                    .append(" , TEL = ?")
                    .append(" , BUSEO_ID = ?")
                    .append(" , JIKWI_ID = ?")
                    .append(" , BASICPAY = ?")
                    .append(" , SUDANG = ?")
                    .append(" WHERE EMP_ID = ?")
                    .toString();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, dto.getEmpName());
        pstmt.setString(2, dto.getSsn());
        pstmt.setString(3, dto.getIbsaDate());
        pstmt.setInt(4, dto.getCityId());
        pstmt.setString(5, dto.getTel());
        pstmt.setInt(6, dto.getBuseoId());
        pstmt.setInt(7, dto.getJikwiId());
        pstmt.setInt(8, dto.getBasicpay());
        pstmt.setInt(9, dto.getSudang());
        pstmt.setInt(10, dto.getEmpId());

        result = pstmt.executeUpdate();
        pstmt.close();

        return result;
    }

    // 데이터베이스 연결 종료
    public void close() throws SQLException
    {
        DBConn.close();
    }


}
