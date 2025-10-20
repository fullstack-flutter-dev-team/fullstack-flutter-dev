/**
 * =====================================
 *   EmployeeDAO.java
 *    - 데이터베이스 액션 처리 클래스
 *    - 직원 데이터 출력, 입력, 수정, 삭제 액션
 *    - Connection 객체에 대한 의존성 주입 준비
 *    - (인터페이스 속성 구성 / setter 구성)
 * =====================================
 */


package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class EmployeeDAO implements IEmployeeDAO
{
    // 주요 속성 구성 → 인터페이스 형태
    private DataSource dataSource;
    
    // setter 구성
    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }

    // 직원 리스트
    @Override
    public ArrayList<Employee> list() throws SQLException
    {
        ArrayList<Employee> employeeList = new ArrayList<Employee>();
        StringBuffer sb = new StringBuffer();
        Connection conn = dataSource.getConnection();
        
        // EMPLOYEEVIEW 테이블 조회
        sb.append("SELECT * FROM EMPLOYEEVIEW");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            Employee emp = new Employee();
            
            emp.setEmployeeId(rs.getString(1));
            emp.setName(rs.getString(2));
            emp.setSsn(rs.getString(3));
            emp.setBirthday(rs.getString(4));
            emp.setLunar(rs.getInt(5));
            emp.setLunarName(rs.getString(6));
            emp.setTelephone(rs.getString(7));
            emp.setDepartmentId(rs.getString(8));
            emp.setDepartmentName(rs.getString(9));
            emp.setPositionId(rs.getString(10));
            emp.setPositionName(rs.getString(11));
            emp.setRegionId(rs.getString(12));
            emp.setRegionName(rs.getString(13));
            emp.setBasicPay(rs.getInt(14));
            emp.setExtraPay(rs.getInt(15));
            emp.setPay(rs.getInt(16));
            emp.setGrade(rs.getInt(17));
            
            employeeList.add(emp);
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return employeeList;
    }

    // 지역 리스트
    @Override
    public ArrayList<Region> regionList() throws SQLException
    {
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        
        // REGIONVIEW 테이블 조회
        sb.append("SELECT * FROM REGIONVIEW");
        ArrayList<Region> regionList = new ArrayList<Region>();
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            Region region = new Region();
            region.setRegionId(rs.getString(1));
            region.setRegionName(rs.getString(2));
            region.setDelCheck(rs.getInt(3));
            
            regionList.add(region);
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return regionList;
    }

    @Override
    public ArrayList<Department> departmentList() throws SQLException
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

    @Override
    public ArrayList<Position> positionList() throws SQLException
    {
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT * FROM POSITIONVIEW");
        ArrayList<Position> positionList = new ArrayList<Position>();
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            Position position = new Position();
            position.setPositionId(rs.getString(1));
            position.setPositionName(rs.getString(2));
            position.setMinBasicPay(rs.getInt(3));
            position.setDelCheck(rs.getInt(4));
            
            positionList.add(position);
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return positionList;
    }

    // 직위 아이디에 따른 최소 기본급 확인/검색
    @Override
    public int getMinBasicPay(String positionId) throws SQLException
    {
        int result = 0;
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=?");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setInt(1, Integer.parseInt(positionId));
        
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            result = rs.getInt(1);
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return result;
    }

    
    // 직원 데이터 추가
    @Override
    public int add(Employee employee) throws SQLException
    {
        int result = 0;
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR");
        sb.append("  , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID");
        sb.append("  , BASICPAY, EXTRAPAY)");
        sb.append(" VALUES(EMPLOYEESEQ.NEXTVAL, ?, ?, CRYPTPACK.ENCRYPT(?, ?)");
        sb.append("  , TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?");
        sb.append("  , ?, ?)");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setString(1, employee.getName());
        pstmt.setString(2, employee.getSsn1());
        pstmt.setString(3, employee.getSsn2());
        pstmt.setString(4, employee.getSsn2());
        pstmt.setString(5, employee.getBirthday());
        pstmt.setInt(6, employee.getLunar());
        pstmt.setString(7, employee.getTelephone());
        pstmt.setInt(8, Integer.parseInt(employee.getDepartmentId()));
        pstmt.setInt(9, Integer.parseInt(employee.getPositionId()));
        pstmt.setInt(10, Integer.parseInt(employee.getRegionId()));
        pstmt.setInt(11, employee.getBasicPay());
        pstmt.setInt(12, employee.getExtraPay());
        
        result = pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
        
        return result;
    }

    // 직원 데이터 삭제
    @Override
    public int remove(String employeeId) throws SQLException
    {
        int result = 0;
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("DELETE FROM EMPLOYEE WHERE EMPLOYEEID=?");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setInt(1, Integer.parseInt(employeeId));
        
        result = pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
        
        return result;
    }

    // 직원 데이터 수정
    @Override
    public int modify(Employee employee) throws SQLException
    {
        int result = 0;
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        sb.append("UPDATE EMPLOYEE");
        sb.append(" SET NAME=?");
        sb.append(" , BIRTHDAY=TO_DATE(?, 'YYYY-MM-DD')");
        sb.append("  , LUNAR=?");
        sb.append("  , TELEPHONE=?");
        sb.append("  , DEPARTMENTID=?");
        sb.append("  , POSITIONID=?");
        sb.append("  , REGIONID=?");
        sb.append("  , BASICPAY=?");
        sb.append("  , EXTRAPAY=?");
        sb.append("  , SSN1=?");
        sb.append("  , SSN2=CRYPTPACK.ENCRYPT(?, ?)");
        sb.append(" WHERE EMPLOYEEID=?");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setString(1, employee.getName());
        pstmt.setString(2, employee.getBirthday());
        pstmt.setInt(3, employee.getLunar());
        pstmt.setString(4, employee.getTelephone());
        pstmt.setInt(5, Integer.parseInt(employee.getDepartmentId()));
        pstmt.setInt(6, Integer.parseInt(employee.getPositionId()));
        pstmt.setInt(7, Integer.parseInt(employee.getRegionId()));
        pstmt.setInt(8, employee.getBasicPay());
        pstmt.setInt(9, employee.getExtraPay());
        pstmt.setString(10, employee.getSsn1());
        pstmt.setString(11, employee.getSsn2());
        pstmt.setString(12, employee.getSsn2());
        pstmt.setInt(13, Integer.parseInt(employee.getRegionId()));
        
        result = pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
        
        return result;
    }

    // 아이디로 직원 검색
    @Override
    public Employee searchId(String employeeId) throws SQLException
    {
        Employee employee = null;
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        
        sb.append("SELECT EMPLOYEEID, NAME, SSN1");
        sb.append(", TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY");
        sb.append(", LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID");
        sb.append(", BASICPAY, EXTRAPAY");
        sb.append(" FROM EMPLOYEE");
        sb.append(" WHERE EMPLOYEEID=?");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setInt(1, Integer.parseInt(employeeId));
        
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            employee = new Employee();
            employee.setEmployeeId(rs.getString(1));
            employee.setName(rs.getString(2));
            employee.setSsn1(rs.getString(3));
            employee.setBirthday(rs.getString(4));
            employee.setLunar(rs.getInt(5));
            employee.setTelephone(rs.getString(6));
            employee.setDepartmentId(rs.getString(7));
            employee.setPositionId(rs.getString(8));
            employee.setRegionId(rs.getString(9));
            employee.setBasicPay(rs.getInt(10));
            employee.setExtraPay(rs.getInt(11));
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return employee;
    }

    // 일반 직원 로그인
    @Override
    public String login(String id, String pw) throws SQLException
    {
        //String resultName = "";
        String resultName = null;
        // 【check~!!!】
        //★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
        // 결과값으로 반환할 값을 절대로 빈 문자열로 하지 말고
        // null 로 해야한다!!
        // 반환한 것이 null 일 때 로그인 실패를 처리해야 하는데
        // 빈 문자열이 들어가 있으면 null 이 아니므로~!!!
        //★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
        
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        
        sb.append("SELECT NAME");
        sb.append(" FROM EMPLOYEE");
        sb.append(" WHERE EMPLOYEEID=?");
        sb.append(" AND SSN2 = CRYPTPACK.ENCRYPT(?, ?)");
        sb.append(" AND GRADE = 1");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setInt(1, Integer.parseInt(id));
        pstmt.setString(2, pw);
        pstmt.setString(3, pw);
        
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            resultName = rs.getString(1);
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return resultName;
    }

    // 관리자 로그인
    @Override
    public String loginAdmin(String id, String pw) throws SQLException
    {
        //String resultName = "";
        String resultName = null;
        // 【check~!!!】
        //★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
        // 결과값으로 반환할 값을 절대로 빈 문자열로 하지 말고
        // null 로 해야한다!!
        // 반환한 것이 null 일 때 로그인 실패를 처리해야 하는데
        // 빈 문자열이 들어가 있으면 null 이 아니므로~!!!
        //★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
        
        Connection conn = dataSource.getConnection();
        StringBuffer sb = new StringBuffer();
        
        sb.append("SELECT NAME");
        sb.append(" FROM EMPLOYEE");
        sb.append(" WHERE EMPLOYEEID=?");
        sb.append(" AND SSN2 = CRYPTPACK.ENCRYPT(?, ?)");
        sb.append(" AND GRADE = 0");
        
        PreparedStatement pstmt = conn.prepareStatement(sb.toString());
        pstmt.setInt(1, Integer.parseInt(id));
        pstmt.setString(2, pw);
        pstmt.setString(3, pw);
        
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            resultName = rs.getString("NAME");
        }
        
        rs.close();
        pstmt.close();
        conn.close();
        
        return resultName;
    }

}
