/**
 * =====================================
 *   IEmployeeDAO.java
 *    - 인터페이스
 * =====================================
 */

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IEmployeeDAO
{
    /*
     * 부서, 지역, 직위 모두 사용자로부터 직접 text 형태로 입력받는 것이 아니라 
     * 구성되어 있는 값들 중에서 선택하여 (Drop-Down) 값을 받아내야 하므로... 
     * 이에 대한 처리를 생각하여 이 인터페이스에 필요한 추상 메소드를 정의해 두어야 한다.
     */
    
    // 리스트 조회
    public ArrayList<Employee> list() throws SQLException;
    
    public ArrayList<Region> regionList() throws SQLException;
    public ArrayList<Department> departmentList() throws SQLException;
    public ArrayList<Position> positionList() throws SQLException;
    
    // 속성 조회
    public int getMinBasicPay(String positionId) throws SQLException;
    
    public int add(Employee employee) throws SQLException;
    public int remove(String employeeId) throws SQLException;
    public int modify(Employee employee) throws SQLException;
    
    public Employee searchId(String employeeId) throws SQLException;
    
    public String login(String id, String pw) throws SQLException;
    public String loginAdmin(String id, String pw) throws SQLException;
}
