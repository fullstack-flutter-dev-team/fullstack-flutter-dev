/**
 * =====================================
 *   DepartmentDAO.java
 *    - 데이터베이스 액션 처리 클래스
 *    - 부서 데이터 출력, 입력, 수정, 삭제 액션
 *    - Connection 객체에 대한 의존성 주입 준비
 *    - (인터페이스 속성 / setter 구성)
 * =====================================
 */

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class DepartmentDAO implements IDepartmentDAO
{
    // 주요 속성 구성 → 인터페이스 형태
    private DataSource dataSource;

    // setter 구성
 


    // 전체 부서 리스트 조회
    @Override
    public ArrayList<Department> list() throws SQLException
    {
        ArrayList<Department> deptList = new ArrayList<Department>();
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK");
        sb.append(" FROM DEPARTMENTVIEW");
        sb.append(" ORDER BY DEPARTMENTID");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            Department dept = new Department();
            dept.setDepartmentId(rs.getString(1));
            dept.setDepartmentName(rs.getString(2));
            dept.setDelCheck(rs.getInt(3));
            
            deptList.add(dept);
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return deptList;
    }


    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }


    // 부서 데이터 등록(입력, 추가)
    @Override
    public int add(Department department) throws SQLException
    {
        int result = 0;
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) ");
        sb.append(" VALUES(DEPARTMENTSEQ.NEXTVAL, ?)");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setString(1, department.getDepartmentName());
        
        result = pstmt.executeUpdate();
        pstmt.close();
        conn.close();
        
        return result;
    }

    // 부서 데이터 삭제(제거)
    @Override
    public int remove(String departmentId) throws SQLException
    {
        int result = 0;
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("DELETE");
        sb.append(" FROM DEPARTMENT");
        sb.append(" WHERE DEPARTMENTID=?");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setInt(1, Integer.parseInt(departmentId));
        
        result = pstmt.executeUpdate();
        pstmt.close();
        conn.close();
        
        return result;
    }

    // 부서 데이터 수정
    @Override
    public int modify(Department department) throws SQLException
    {
        int result = 0;
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("UPDATE DEPARTMENT");
        sb.append(" SET DEPARTMENTNAME=?");
        sb.append(" WHERE DEPARTMENTID=?");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setString(1, department.getDepartmentName());
        pstmt.setInt(2, Integer.parseInt(department.getDepartmentId()));
        
        result = pstmt.executeUpdate();
        pstmt.close();
        conn.close();
        
        return result;
    }


    /**
     * 부서 데이터 검색
     */
    @Override
    public Department search(String departmentId) throws SQLException
    {
        Department department = new Department();
        Connection conn = dataSource.getConnection();
        
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK");
        sb.append(" FROM DEPARTMENTVIEW");
        sb.append(" WHERE DEPARTMENTID=?");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setInt(1, Integer.parseInt(departmentId));
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            department.setDepartmentId(rs.getString(1));
            department.setDepartmentName(rs.getString(2));
            department.setDelCheck(rs.getInt(3));
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return department;
    }

}
