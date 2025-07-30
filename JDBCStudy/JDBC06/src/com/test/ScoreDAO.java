/**
 * 
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

    // SELECT COUNT(*) AS COUNT FROM TBL_SCORE;
    // INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.nextval, '도우너', 90, 80, 70);
    // SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND((KOR+ENG+MAT)/3) AS AVG FROM TBL_SCORE ORDER BY SID ASC;

    private Connection dbConn;

    public ScoreDAO() throws ClassNotFoundException, SQLException
    {
        dbConn = DBConn.getConnection();
    }

    public int getCount() throws SQLException
    {
        int result = 0;
        String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
        try (Statement stmt = dbConn.createStatement()) {
            ResultSet rs  = stmt.executeQuery(sql);
            while (rs.next())
            {
                result = rs.getInt("COUNT");
            }
        }

        return result;
    }

    public int addScore(ScoreDTO scoreDto) throws SQLException
    {
        Statement stmt = dbConn.createStatement();
        String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)" 
                       + " VALUES(SCORESEQ.nextval, '%s', %s, %s, %s)"
                       , scoreDto.getName(), scoreDto.getKor(), scoreDto.getEng(), scoreDto.getMat());
        int result = stmt.executeUpdate(sql);
        return result;

    }

    public ArrayList<ScoreDTO> listAll() throws SQLException
    {
        ArrayList<ScoreDTO> scoreList = new ArrayList<>();
        String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND((KOR+ENG+MAT)/3, 1) AS AVG FROM TBL_SCORE ORDER BY SID ASC";
        Statement stmt = dbConn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next())
        {
            ScoreDTO score = new ScoreDTO();
            score.setSid(rs.getString("SID"));
            score.setName(rs.getString("NAME"));
            score.setKor(rs.getString("KOR"));
            score.setEng(rs.getString("ENG"));
            score.setMat(rs.getString("MAT"));
            score.setTot(rs.getString("TOT"));
            score.setAvg(rs.getString("AVG"));
            scoreList.add(score);
        }

        rs.close();
        stmt.close();
        return scoreList;
    }

    public void disConn() throws SQLException
    {
        dbConn.close();
    }

    public void connect() throws ClassNotFoundException, SQLException
    {
        dbConn = DBConn.getConnection();
    }

}
