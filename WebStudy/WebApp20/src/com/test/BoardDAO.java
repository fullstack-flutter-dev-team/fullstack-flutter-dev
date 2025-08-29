/**
 * 
 */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author sist
 *
 */
public class BoardDAO
{
    
    // 주요 속성 구성
    private Connection conn;
    
    // 생성자 정의
    public BoardDAO(Connection conn) {
        this.conn = conn;
    }
    
    // 게시물 번호의 최대값 얻어오기
    public int getMaxNum() {
        int result = 0;
        
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "";
        
        try
        {
            sql = "SELECT NVL(MAX(NUM),0) AS MAXNUM FROM TBL_BOARD";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next())
                result = rs.getInt("MAXNUM");
            rs.close();
            stmt.close();
            
        } catch (Exception e){
            System.out.println(e.toString());
        }
        
        return result;
    }
    
    
    // 게시물 작성 → 데이터 입력
    public int insertData(BoardDTO dto) {
        int result = 0;
        PreparedStatement pstmt = null;
        StringBuilder sql = new StringBuilder();
        // INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) 
        // VALUES(1, 'KIM', '1234', 'cgs@test.com', '첫번째 게시물입니다.', '첫번째 게시물 내용입니다.','211.238.142.161', 0, SYSDATE);

        try {
            // hitCount 기본값 『0』 또는 『default』 또는 『입력항목생략』 가능
            // created 기본값 『sysdate』 또는 『default』 또는 『입력항목생략』 가능
            sql.append("INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)");
            sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)");
            System.out.println(">>=sql=> " + sql.toString());
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, dto.getNum());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getPwd());
            pstmt.setString(4, dto.getEmail());
            pstmt.setString(5, dto.getSubject());
            pstmt.setString(6, dto.getContent());
            pstmt.setString(7, dto.getIpAddr());
            
            result = pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return result;
    }
    
    // DB 레코드의 갯수를  가져오는 메서드 정의(지금은 전체 리스트)
    // ★ →  추후.... 검색 기능을 추가하게 되면...수정이 필요할 수 있는 메서드
    public int getDataCount()
    {
        int result = 0;
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";
        
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return result;
    }
    
    // 특정 영역(시작번호~끝번호)의 게시물의 목록을 읽어오는 메서드 정의
    // ★ → 추후.... 검색 기능을 추가하게 되면...수정이 필요할 수 있는 메서드
    public List<BoardDTO> getLists(int start, int end) {
        List<BoardDTO> result = new ArrayList<BoardDTO>();
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder sql = new StringBuilder();

        //    SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
        //    FROM (
        //        SELECT ROWNUM RNUM, DATA.*
        //        FROM(
        //            SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        //            FROM TBL_BOARD
        //            ORDER BY NUM DESC
        //        ) DATA
        //    )
        //    WHERE RNUM >= 1 AND RNUM <= 10
        //    ORDER BY RNUM DESC
        
        try {
            sql.append("SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED");
            sql.append(" FROM (");
            sql.append("SELECT ROWNUM RNUM, DATA.*");
            sql.append(" FROM(");
            sql.append(" SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED");
            sql.append("  FROM TBL_BOARD");
            sql.append("  ORDER BY NUM DESC");
            sql.append(" ) DATA");
            sql.append(" )");
            sql.append(" WHERE RNUM >= ? AND RNUM <= ?");
//            sql.append(" ORDER BY RNUM DESC");
            System.out.println(">>=sql=> " + sql.toString());
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setNum(rs.getInt(1));
                board.setName(rs.getString(2));
                board.setSubject(rs.getString(3));
                board.setHitCount(rs.getInt(4));
                board.setCreated(rs.getString(5));
                
                result.add(board);
            }
            
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return result;
    }
    
    // 특정 게시물 조회에 따른 조회 횟수 증가 메서드 정의
    public int updateHitCount(int num) {
        int result = 0;
        
        PreparedStatement pstmt = null;
        StringBuilder sql = new StringBuilder();
        
        // UPDATE TBL_BOARD
        // SET HITCOUNT = HITCOUNT + 1  -- 조회수 1 증가, HITCOUNT += 1 -- HITCOUNT++
        // WHERE NUM = 1;
        
        try {
            sql.append("UPDATE TBL_BOARD");
            sql.append(" SET HITCOUNT = HITCOUNT + 1");
            sql.append(" WHERE NUM = ?");
            System.out.println(">>=sql=> " + sql.toString());
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, num);
            
            result = pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return result;
    }
    
    // 특정 게시물의 내용을 읽어오는 메서드 정의
    public BoardDTO getReadData(int num) {
        BoardDTO result = null;
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder sql = new StringBuilder();
        
        //  SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT
        //     , TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        //  FROM TBL_BOARD
        //  WHERE NUM = 1630;
        
        try {
            sql.append("SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT");
            sql.append(", TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED");
            sql.append(" FROM TBL_BOARD");
            sql.append(" WHERE NUM = ?");
            System.out.println(">>=sql=> " + sql.toString());
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                result = new BoardDTO();
                
                result.setNum(rs.getInt(1));
                result.setName(rs.getString(2));
                result.setPwd(rs.getString(3));
                result.setEmail(rs.getString(4));
                result.setSubject(rs.getString(5));
                result.setContent(rs.getString(6));
                result.setIpAddr(rs.getString(7));
                result.setHitCount(rs.getInt(8));
                result.setCreated(rs.getString(9));
            }
            
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return result;
    }
    
    // 특정 게시물을 삭제하는 기능의 메서드
    public int deleteData(int num)
    {
        int result = 0;
        PreparedStatement pstmt = null;
        StringBuilder sql = new StringBuilder();
        
        try
        {
            sql.append("DELETE FROM TBL_BOARD WHERE NUM=?");
            System.out.println(">>=sql=> " + sql.toString());
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, num);

            result = pstmt.executeUpdate();
            
            pstmt.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return result;
    }
    
    // 특정 게시물의 내용을 수정하는 기능의 메서드
    public int updateData(BoardDTO dto) {
        int result = 0;
        
        PreparedStatement pstmt = null;
        StringBuilder sql = new StringBuilder();
        //    UPDATE TBL_BOARD
        //    SET NAME = '도우너'
        //       , PWD = '59876'
        //       , EMAIL = 'dwn@test.com'
        //        , SUBJECT = '수정한 제목'
        //        , CONTENT = '수정한 내용'
        //    WHERE NUM = 22;
        try {
            sql.append("UPDATE TBL_BOARD");
            sql.append(" SET NAME = ?");
            sql.append(", PWD = ?");
            sql.append(", EMAIL = ?");
            sql.append(", SUBJECT = ?");
            sql.append(", CONTENT = ?");
            sql.append(" WHERE NUM = ?");
            System.out.println(">>=sql=> " + sql.toString());
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getPwd());
            pstmt.setString(3, dto.getEmail());
            pstmt.setString(4, dto.getSubject());
            pstmt.setString(5, dto.getContent());
            pstmt.setInt(6, dto.getNum());
            
            result = pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return result;
    }
    
    // 특정 게시물의 이전 번호를 얻어내는 기능의 메서드 정의
    // → 이전 게시물이 존재하지 않을 경우 『-1』 반환
    public int getBeforeNum(int num) {
        int result = 0;
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder sql = new StringBuilder();
        //    SELECT NVL(MAX(NUM), -1) AS BEFORENUM
        //    FROM TBL_BOARD
        //    WHERE NUM < 50;
        try {
            sql.append("SELECT NVL(MAX(NUM), -1) AS BEFORENUM");
            sql.append(" FROM TBL_BOARD");
            sql.append(" WHERE NUM < ?");
            System.out.println(">>=sql=> " + sql.toString());
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, num);
            
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
            
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return result;
    }
    
    // 특정 게시물의 다음 게시물 번호를 얻어내는 기능의 메서드 정의
    // → 다음 게시물이 존재하지 않을 경우 『-1』 반환
    public int getNextNum(int num) {
        int result = 0;
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StringBuilder sql = new StringBuilder();
        //    SELECT NVL(MIN(NUM), -1) AS NEXTNUM
        //    FROM TBL_BOARD
        //    WHERE NUM > 50;
        try {
            sql.append("SELECT NVL(MIN(NUM), -1) AS NEXTNUM");
            sql.append(" FROM TBL_BOARD");
            sql.append(" WHERE NUM > ?");
            System.out.println(">>=sql=> " + sql.toString());
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, num);
            
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
            
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return result;
    }
    
}
