/**
 * ================================================
 *   EmployeeUpdateFormController.java
 *    - 사용자 정의 컨트롤러 클래스
 *    - 직원 데이터 수정 폼 요청에 대한 액션 처리
 *    - DAO 객체에 대한 의존성 주입(DI)를 위한 준비
 *    → 인터페이스 형태의 자료형을 속성으로 구성
 *    → setter 메소드 준비
 * ================================================
 */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring MVC 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성할 수 있도록 한다.

public class EmployeeUpdateFormController implements Controller
{
    // check~!!!
    // EmployeeInsertFormController 구성했을 때와는 다른 방식으로 처리~!!!
    // ----------------------------
    // EmployeeInsertFormController 의 경우에는
    //  → 필요한 모든 메소드를 EmployeeDAO 에 정의해 두었던 상태로 진행 했음.
    
    
    // ※【EmployeeInsertFormController.java 와의 차이점】
    //====================================================================================
    // 선택 가능한 부서(Department), 지역(Region), 직위(Position) 정보를
    // Database에서 가져와서, ArrayList 형태로 반환하는 메소드를
    // EmployeeDAO 에 선언된 『departmentList()』『regionList()』『positionList()』 를
    // 사용하지 않고,
    // 각각의 부서, 지역, 직위 DAO 인터페이스(Interface)
    // 『IDepartmentDAO』 『IRegionDAO』 『IPositionDAO』 를 선언 + setter 구성한 후
    // dispatcher-servlet.xml 에서 각각의 DAO를 의존주입(Dependency Injection)으로
    // 받아서 사용하도록 구성했다.
    //====================================================================================
    
    private IEmployeeDAO employeeDAO;
    private IDepartmentDAO departmentDAO;
    private IRegionDAO regionDAO;
    private IPositionDAO positionDAO;
    

    public void setEmployeeDAO(IEmployeeDAO employeeDAO)
    {
        this.employeeDAO = employeeDAO;
    }


    public void setDepartmentDAO(IDepartmentDAO departmentDAO)
    {
        this.departmentDAO = departmentDAO;
    }


    public void setRegionDAO(IRegionDAO regionDAO)
    {
        this.regionDAO = regionDAO;
    }


    public void setPositionDAO(IPositionDAO positionDAO)
    {
        this.positionDAO = positionDAO;
    }


    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        // Controller 가 수행해야 할 액션 코드
        ModelAndView mav = new ModelAndView();
        //-------------------------------------------------------
        
        ArrayList<Region> regionList = new ArrayList<Region>();
        ArrayList<Department> departmentList = new ArrayList<Department>();
        ArrayList<Position> positionList = new ArrayList<Position>();
        
        try {
            // 이전 페이지로() 부터 넘어온 데이터 수신
            //-- employeeId
            String employeeId = request.getParameter("employeeId");
            
            Employee employee = new Employee();
            
            // 『searchId(String employeeId)』 메소드를 통해
            // employeeId 에 해당하는 직원 객체를 찾아서
            // 위에서 생성한 Employee 객체에 저장.
            //==================================================
            employee = employeeDAO.searchId(employeeId);
            
            //====================================================================
            // ① RegionDAO, DepartmentDAO, PositionDAO 의 각각의
            //   『list()』 메소드를 통해
            //   『ArrayList』 형태의 지역, 부서, 직위 리스트를 반환받은 후
            //====================================================================
            regionList = regionDAO.list();
            departmentList = departmentDAO.list();
            positionList = positionDAO.list();
            
            //====================================================================
            //  ② 『ModelAndView』 객체에 저장을 해 준다.
            //====================================================================
            mav.addObject("employee", employee);
            mav.addObject("regionList", regionList);
            mav.addObject("departmentList", departmentList);
            mav.addObject("positionList", positionList);
            
            System.out.println(">>>> employee : " + employee.toString());
            
            //=========================================================================================
            //  ③ 이 『ModelAndView』 객체를 View 페이지 [EmployeeUpdateForm.jsp]에서 받아서
            //     EL(JSTL)로 수신하여 직원 정보는 기존의 입력칸에 뿌려주고,
            //     지역 정보, 부서 정보, 포지션 정보를 <select> 엘리먼트의 <option> 값으로 하나씩
            //     보여줄 수 있도록 한다.
            //=========================================================================================
            mav.setViewName("/WEB-INF/view/EmployeeUpdateForm.jsp");
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        
        //-------------------------------------------------------
        return mav;
    }

}
