/**
 * =================================
 *    Test06.java
 * =================================
 */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.DBConn;

/**
 * @author sist
 *
 */
public class Test06
{

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException
	{

		try {
			Connection conn = DBConn.getConnection();

			if (conn != null) {
				System.out.println(">> 데이터베이스 연결 성공~!!!");
			}

			try {
				// 쿼리문 준비
				String sql = "SELECT SID, NAME, TEL  FROM TBL_MEMBER ORDER BY SID";

				// 작업 객체 생성()
				PreparedStatement pstmt = conn.prepareStatement(sql);

				// 작업 객체 실행 -> select 쿼리문 -> ResulatSet 반환
				ResultSet rs = pstmt.executeQuery();

				// ResultSet 처리 -> 반복문 구성

				while (rs.next()) {
					int sid = rs.getInt("sid");
					String name = rs.getString("name");
					String tel = rs.getString("tel");

					String str = String.format("%3d %10s %20s", sid, name, tel);
					System.out.println(str);
				}
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		DBConn.close();
		System.out.println(">> 데이터베이스 닫힘~!!!!");
		System.out.println(">> 프로그램 종료됨~!!!");
	}

}
