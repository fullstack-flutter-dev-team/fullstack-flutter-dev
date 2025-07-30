/** ===========================
 *   ScoreDAO.java
 *  ===========================
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
        String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
                                 + " VALUES(SCORESEQ.nextval, '%s', %d, %d, %d)"
                                   , dto.getName(), dto.getKor(), dto.getEng(), dto.getMat());
        Statement stmt = conn.createStatement();

        result = stmt.executeUpdate(sql);
        stmt.close();

        return result;
    }


    // 전체 리스트 확인
    public ArrayList<ScoreDTO> lists() throws SQLException
    {
        ArrayList<ScoreDTO> result = new ArrayList<>();
        Statement stmt = conn.createStatement();
        String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT,"
                    + " round((KOR+ENG+MAT)/3, 1) AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
                    + " FROM TBL_SCORE ORDER BY SID ASC";

        ResultSet rs = stmt.executeQuery(sql);
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
        stmt.close();

        return result;
    }

    // 이름 검색
    public ArrayList<ScoreDTO> lists(String name) throws SQLException
    {
        ArrayList<ScoreDTO> result = new ArrayList<>();
        Statement stmt = conn.createStatement();
        String sql = String.format("SELECT T.* FROM (SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, round((KOR+ENG+MAT)/3, 1) AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE ORDER BY SID ASC) T WHERE NAME LIKE '%%%s%%'", name);
        ResultSet rs = stmt.executeQuery(sql);

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
        stmt.close();

        return result;
    }

    // 번호 검색
    // public ArrayList<ScoreDTO> searchSid(int sid)
    public ArrayList<ScoreDTO> lists(int sid) throws SQLException
    {
        ArrayList<ScoreDTO> result = new ArrayList<>();
        Statement stmt = conn.createStatement();
        String sql = String.format("SELECT T.* FROM (SELECT SID, NAME, KOR, ENG, MAT,"
                     + " (KOR+ENG+MAT) AS TOT, round((KOR+ENG+MAT)/3, 1) AS AVG,"
                     + " RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
                     + " FROM TBL_SCORE ORDER BY SID ASC) T WHERE SID=%d", sid);
        ResultSet rs = stmt.executeQuery(sql);

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
    public int modify(ScoreDTO dto) throws SQLException
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
