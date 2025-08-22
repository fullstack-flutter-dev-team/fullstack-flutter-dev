/**
 * 
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
public class ScoreDAO
{
	
	private Connection conn;
	
	public ScoreDAO() throws ClassNotFoundException, SQLException {
		conn = DBConn.getConnection();
	}
	
	
	public ArrayList<ScoreDTO> listScore() throws SQLException {
		ArrayList<ScoreDTO> scoreList = new ArrayList<>();
		
		// SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND((KOR+ENG+MAT)/3, 1) AS AVG FROM TBL_SCORE ORDER BY SID;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT SID, NAME, KOR, ENG, MAT");
		sb.append(", (KOR+ENG+MAT) AS TOT, ROUND((KOR+ENG+MAT)/3, 1) AS AVG");
		sb.append(" FROM TBL_SCORE ORDER BY SID");
		
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());
		ResultSet rs =  pstmt.executeQuery();
		
		while (rs.next()) {
			ScoreDTO score = new ScoreDTO();
			score.setSid(rs.getInt(1));
			score.setName(rs.getString(2));
			score.setKor(rs.getString(3));
			score.setEng(rs.getString(4));
			score.setMat(rs.getString(5));
			score.setTot(rs.getString(6));
			score.setAvg(rs.getString(7));
			scoreList.add(score);
		}
		
		return scoreList;
	}
	
	public int addScore(ScoreDTO score) throws SQLException {
		int result = 0;
		
		// INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '김한국', 90, 80, 70)
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)");
		sb.append(" VALUES(SCORESEQ.NEXTVAL, \'?\', ?, ?, ?)");
		
		PreparedStatement pstmt = conn.prepareStatement(sb.toString());
		System.out.println(">>>sql : " + sb.toString());
		
		pstmt.setString(1, score.getName());
		pstmt.setString(2, score.getKor());
		pstmt.setString(3, score.getEng());
		pstmt.setString(4, score.getMat());
		
		System.out.println(">>>sql(pstmt) : " + pstmt.toString());
		
		result = pstmt.executeUpdate();
		
		return result;
	}
	
	
	
	public void close() throws SQLException {
		DBConn.close();
	}

}
