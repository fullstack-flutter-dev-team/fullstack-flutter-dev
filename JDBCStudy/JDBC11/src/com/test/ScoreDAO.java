/** ===========================
 *   ScoreDAO.java
 *  ===========================
 */
package com.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

import oracle.jdbc.OracleTypes;

/**
 * @author sist
 *
 */
public class ScoreDAO
{
    // 주요 속성 구성
    private Connection conn;


    // 데이터베이스 연결
    public Connection connection() throws ClassNotFoundException, SQLException
    {
        conn = DBConn.getConnection();
        return conn;
    }

    // 데이터 입력
    public int add(ScoreDTO dto) throws SQLException
    {
        int result = 0;
        String sql = "{call PRC_SCOREINSERT(?,?,?,?)}";
        CallableStatement cstmt = conn.prepareCall(sql);

        cstmt.setString(1, dto.getName());
        cstmt.setInt(2, dto.getKor());
        cstmt.setInt(3, dto.getEng());
        cstmt.setInt(4, dto.getMat());

        result = cstmt.executeUpdate();

        cstmt.close();
        return result;
    }


    // 전체 리스트 확인
    public ArrayList<ScoreDTO> lists() throws SQLException
    {
        ArrayList<ScoreDTO> result = new ArrayList<>();
        String sql = "{call PRC_SCORESELECT(?)}";
        CallableStatement cstmt = conn.prepareCall(sql);
        cstmt.registerOutParameter(1, OracleTypes.CURSOR); //-- OUT 매개변수 등록
        cstmt.executeQuery();
        ResultSet rs = (ResultSet)cstmt.getObject(1);

        while (rs.next())
        {
            ScoreDTO dto = new ScoreDTO();
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
        cstmt.close();

        return result;
    }

    // 이름 검색
    public ArrayList<ScoreDTO> lists(String name) throws SQLException
    {
        ArrayList<ScoreDTO> result = new ArrayList<>();
        String sql = "{call PRC_SEARCHNAME(?,?)}";
        CallableStatement cstmt = conn.prepareCall(sql);
        cstmt.registerOutParameter(1, OracleTypes.CURSOR); //-- OUT 매개변수 등록
        cstmt.setString(2, name);
        cstmt.executeQuery();
        ResultSet rs = (ResultSet)cstmt.getObject(1);

        while (rs.next())
        {
            ScoreDTO dto = new ScoreDTO();
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
        cstmt.close();

        return result;
    }

    // 번호 검색
    // public ArrayList<ScoreDTO> searchSid(int sid)
    public ArrayList<ScoreDTO> lists(int sid) throws SQLException
    {
        ArrayList<ScoreDTO> result = new ArrayList<>();
        String sql = "{call PRC_SEARCHSID(?,?)}";
        CallableStatement cstmt = conn.prepareCall(sql);
        cstmt.registerOutParameter(1, OracleTypes.CURSOR); //-- OUT 매개변수 등록
        cstmt.setInt(2, sid);
        cstmt.executeQuery();
        ResultSet rs = (ResultSet)cstmt.getObject(1);

        while (rs.next())
        {
            ScoreDTO dto = new ScoreDTO();
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
        cstmt.close();

        return result;
    }

    // 전체 인원 수 확인
    public int count() throws SQLException
    {
        int result = 0;
        String sql = "{call PRC_SCORECOUNT(?)}";
        CallableStatement cstmt = conn.prepareCall(sql);
        cstmt.registerOutParameter(1, OracleTypes.CURSOR); //-- OUT 매개변수 등록
        cstmt.executeQuery();
        ResultSet rs = (ResultSet)cstmt.getObject(1);

        while (rs.next())
        {
            result = rs.getInt("COUNT");
        }

        rs.close();
        cstmt.close();

        return result;
    }

    // 번호 검색 인원 수 확인
    public int count(int sid) throws SQLException
    {
        int result = 0;
        String sql = "{call PRC_SCORECOUNTSID(?,?)}";
        CallableStatement cstmt = conn.prepareCall(sql);
        cstmt.registerOutParameter(1, OracleTypes.CURSOR); //-- OUT 매개변수 등록
        cstmt.setInt(2, sid);
        cstmt.executeQuery();
        ResultSet rs = (ResultSet)cstmt.getObject(1);

        while (rs.next())
        {
            result = rs.getInt("COUNT");
        }

        rs.close();
        cstmt.close();

        return result;
    }

    // 데이터 수정
    // public modify(int sid) //-- x
    public int modify(ScoreDTO dto) throws SQLException
    {
        int result = 0;
        String sql = "{call PRC_SCOREUPDATE(?,?,?,?)}";
        CallableStatement cstmt = conn.prepareCall(sql);

        cstmt.setInt(1, dto.getKor());
        cstmt.setInt(2, dto.getEng());
        cstmt.setInt(3, dto.getMat());
        cstmt.setInt(4, Integer.parseInt(dto.getSid()));

        result = cstmt.executeUpdate();
        cstmt.close();

        return result;
    }

    // 데이터 삭제
    public int remove(int sid) throws SQLException
    {
        int result = 0;

        String sql = "{call PRC_SCOREDELETE(?)}";
        CallableStatement cstmt = conn.prepareCall(sql);
        cstmt.setInt(1, sid);
        result = cstmt.executeUpdate();
        cstmt.close();
        
        return result;
    }

    // 데이터베이스 연결 종료
    public void close() throws SQLException
    {
        DBConn.close();
    }


}
