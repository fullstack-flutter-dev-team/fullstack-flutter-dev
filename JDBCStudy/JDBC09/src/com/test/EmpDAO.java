/** ===========================
 *   ScoreDAO.java
 *  ===========================
 */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
        String sql = new StringBuilder().append("").toString();
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, ""); // 이름
        pstmt.setString(1, ""); // 주민번호
        pstmt.setString(1, ""); // 입사일
        pstmt.setString(1, ""); // 지역
        pstmt.setString(1, ""); // 전화번호
        pstmt.setString(1, ""); // 부서
        pstmt.setInt(1, 100); // 기본급
        pstmt.setInt(1, 100); // 수당
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
        String sql = "SELECT CITY_ID, CITY_LOC FROM TBL_CITY ORDER BY CITY_ID";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
             CityDTO cityDto = new CityDTO();
             cityDto.setCityId(rs.getInt("CITY_ID"));
             cityDto.setCityLoc(rs.getString("EMP_NAME"));
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
        String sql = "SELECT CITY_ID, CITY_LOC FROM TBL_CITY ORDER BY CITY_ID";
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
        String sql = "SELECT JIKWI_ID, JIKWI_NAME FROM TBL_JIKWI";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
             JikwiDTO jikwiDto = new JikwiDTO();
             jikwiDto.setJikwiId(rs.getInt("CITY_ID"));
             jikwiDto.setJikwiName(rs.getString("EMP_NAME"));
             result.add(jikwiDto);
         }
        
        rs.close();
        pstmt.close();

        return result;
    }

    // 직위에 따른 최소급여 확인
    public int minBasicpayByJikwi(String strJikwiName) throws SQLException
    {
        int result = 0;
        String sql  = new StringBuilder()
                        .append("SELECT MIN_BASICPAY")
                        .append(" FROM TBL_JIKWI")
                        .append(" WHERE JIKWI_NAME LIKE ?").toString();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "'%"+strJikwiName+"%'");

        ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
            result = rs.getInt("MIN_BASICPAY");
         }
        
        rs.close();
        pstmt.close();

        return result;
    }

     // 직원 검색 리스트 출력
    public ArrayList<EmpViewDTO> empSearchList(int nSubMenu, String strValue) throws SQLException
    {
        System.out.println("strValue :" + strValue);
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
        System.out.println(sql);
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



    // 전체 리스트 확인
    public ArrayList<EmpDTO01> lists() throws SQLException
    {
        ArrayList<EmpDTO01> result = new ArrayList<>();
        Statement stmt = conn.createStatement();
        String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT,"
                    + " round((KOR+ENG+MAT)/3, 1) AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
                    + " FROM TBL_SCORE ORDER BY SID ASC";

        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next())
        {
            EmpDTO01 dto = new EmpDTO01();
            dto.setSid(rs.getString("SID"));
            dto.setName(rs.getString("NAME"));
            dto.setKor(rs.getInt("KOR"));
            dto.setEng(rs.getInt("ENG"));
            dto.setMat(rs.getInt("MAT"));
            dto.setTot(rs.getInt("TOT"));
            dto.setAvg(rs.getDouble("AVG"));
            dto.setRank(rs.getInt("RANK"));
            result.add(dto);
        }
        
        rs.close();
        stmt.close();

        return result;
    }



    // 전체 인원 수 확인
    public int count() throws SQLException
    {
        int result = 0;
        Statement stmt = conn.createStatement();
        String sql = String.format("SELECT COUNT(*) AS COUNT FROM TBL_SCORE");
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next())
        {
            result = rs.getInt("COUNT");
        }

        rs.close();
        stmt.close();

        return result;
    }

    // 번호 검색 인원 수 확인
    public int count(int sid) throws SQLException
    {
        int result = 0;
        Statement stmt = conn.createStatement();
        String sql = String.format("SELECT COUNT(*) AS COUNT FROM TBL_SCORE WHERE SID=%d", sid);
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next())
        {
            result = rs.getInt("COUNT");
        }

        rs.close();
        stmt.close();

        return result;
    }

    // 데이터 수정
    // public modify(int sid) //-- x
    public int modify(EmpDTO01 dto) throws SQLException
    {
        int result = 0;
        Statement stmt = conn.createStatement();
        String sql = String.format("UPDATE TBL_SCORE SET KOR = %d, ENG=%d, MAT=%d"
                                + " WHERE SID=%s"
                                // + " WHERE SID=%d"
                                , dto.getKor(), dto.getEng(), dto.getMat()
                                , dto.getSid());
                                // , Integer.parseInt(dto.getSid()));
        result = stmt.executeUpdate(sql);
        stmt.close();

        return result;
    }

    // 데이터 삭제
    public int remove(int sid) throws SQLException
    {
        int result = 0;

        Statement stmt = conn.createStatement();
        String sql = String.format("DELETE FROM TBL_SCORE WHERE SID=%d", sid);
        result = stmt.executeUpdate(sql);
        stmt.close();
        
        return result;
    }

    // 데이터베이스 연결 종료
    public void close() throws SQLException
    {
        DBConn.close();
    }


}
