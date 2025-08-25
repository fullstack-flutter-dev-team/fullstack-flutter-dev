/*==========================================
     MemberScoreDAO.java
     - 데이터베이스 액션 처리 전용 클래스
       (TBL_MEMBERSCORE 테이블 전용 DAO)
============================================*/
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
public class MemberScoreDAO
{
    // 주요 속성 구성
    private Connection conn;

    // 데이터베이스 연결 담당 메소드
    public Connection connection() throws ClassNotFoundException, SQLException
    {
        conn = DBConn.getConnection();
        return conn;
    }

    // 데이터 입력 담당 메소드(성적 데이터 입력)
    public int add(MemberScoreDTO score) throws SQLException
    {
        int result = 0;
        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT)");
        sb.append(" VALUES(?, ?, ?, ?)");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setInt(1, Integer.parseInt(score.getSid()));
        pstmt.setInt(2, score.getKor());
        pstmt.setInt(3, score.getEng());
        pstmt.setInt(4, score.getMat());

        result = pstmt.executeUpdate();
        pstmt.close();

        return result;
    }

    // 성적 전체 리스트 출력 담당 메소드 (성적 데이터 전체 출력)
    // 성적 정보 출력 메소드 (sid, name, kor, eng, mat, tot, avg, rank)
    public ArrayList<MemberScoreDTO> list() throws SQLException
    {
        ArrayList<MemberScoreDTO> result = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT SID, NAME, KOR, ENG, MAT");
        sb.append(", (KOR+ENG+MAT) AS TOT");
        sb.append(", (KOR+ENG+MAT)/3 AS AVG");
        sb.append(", RANK() OVER (ORDER BY (KOR+ENG+MAT) DESC) AS RANK");
        sb.append(" FROM VIEW_MEMBERSCORE");
        sb.append(" ORDER BY SID");

        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        ResultSet rs = pstmt.executeQuery();

        while (rs.next())
        {
            MemberScoreDTO memberScore = new MemberScoreDTO();

            memberScore.setSid(rs.getString("SID"));
            memberScore.setName(rs.getString("NAME"));
            memberScore.setKor(rs.getInt("KOR"));
            memberScore.setEng(rs.getInt("ENG"));
            memberScore.setMat(rs.getInt("MAT"));
            memberScore.setTot(rs.getInt("TOT"));
            memberScore.setAvg(rs.getDouble("AVG"));
            memberScore.setRank(rs.getInt("RANK"));

            result.add(memberScore);

        }

        rs.close();
        pstmt.close();

        return result;
    }

    // 성적 정보 개수 확인 메소드
    public int count() throws SQLException
    {
        int result = 0;

        String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();

        while (rs.next())
        {
            result = rs.getInt("COUNT");
        }

        rs.close();
        pstmt.close();

        return result;
    }

    // 성적 데이터 수정 담당 메소드
    public int modify(MemberScoreDTO score) throws SQLException
    {
        int result = 0;

        StringBuilder sb = new StringBuilder();
        sb.append("UPDATE TBL_MEMBERSCORE");
        sb.append(" SET KOR=?, ENG=?, MAT=?");
        sb.append(" WHERE SID=?");

        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setInt(1, score.getKor());
        pstmt.setInt(2, score.getEng());
        pstmt.setInt(3, score.getMat());
        pstmt.setInt(4, Integer.parseInt(score.getSid()));

        result = pstmt.executeUpdate();

        pstmt.close();

        return result;
    }

    // 성적 데이터 삭제 담당 메소드
    public int remove(String sid) throws SQLException
    {
        int result = 0;

        String sql = "DELETE FROM TBL_MEMBERSCORE" + " WHERE SID=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(sid));

        result = pstmt.executeUpdate();

        return result;
    }

    // 메소드 추가
    // 번호 검색 담당 메소드
    // 성적 정보 검색 메소드 (SID)
    public MemberScoreDTO search(String sid) throws SQLException
    {
        MemberScoreDTO result = new MemberScoreDTO();

        String sql = "SELECT SID, NAME, KOR, ENG, MAT" + " FROM VIEW_MEMBERSCORE" + " WHERE SID=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setInt(1, Integer.parseInt(sid));

        ResultSet rs = pstmt.executeQuery();

        while (rs.next())
        {
            result.setSid(rs.getString("SID"));
            result.setName(rs.getString("NAME"));
            result.setKor(rs.getInt("KOR"));
            result.setEng(rs.getInt("ENG"));
            result.setMat(rs.getInt("MAT"));
        }

        // [참 고 사 항]
        // ****************************************************************
        // MemberScoreDTO의 항목 중
        // tot, avg, rank 를 set 해주지 않아도 된다.
        // 성적 정보를 수정을 하기 위해 가져올 때
        // 입력창에 뿌려줄 항목들을 가져오기 위해 구성한 메소드이므로...

        // 그리고, MemberScoreDTO 의 속성변수
        // tot, avg, rank 를 set 해 주지 않으면
        // 초기값으로 설정되기 때문에 신경쓰지 않아도 괜찮다.
        // ****************************************************************

        rs.close();
        pstmt.close();

        return result;
    }

    // 데이터베이스 연결 종료(해제) 담당 메소드
    public void close() throws SQLException
    {
        DBConn.close();
    }

}
