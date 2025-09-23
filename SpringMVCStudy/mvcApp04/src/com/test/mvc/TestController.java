/**
 * ========================================
 *   SampleController.java
 *    - 사용자 정의 컨트롤러 클래스
 * ========================================
 */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring MVC 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성할 수 있도록 한다.

public class TestController implements Controller
{

    private EmployeeDAO dao;
    
    
    
    public void setDao(EmployeeDAO dao)
    {
        this.dao = dao;
    }



    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        // Controller 가 수행해야 할 액션 코드
        ModelAndView mav = new ModelAndView();
        //-------------------------------------------------------
        String viewName = "/WEB-INF/view/Test.jsp";
        
        ArrayList<Employee> empList = dao.list();
        System.out.println("EMP List");
        for (Employee emp : empList) {
            System.out.println(emp.toString());
        }
        
        ArrayList<Region> regionList = dao.regionList();
        System.out.println("Region List");
        for (Region region : regionList) {
            System.out.println(region.toString());
        }
        
        
        ArrayList<Department> deptList = dao.departmentList();
        System.out.println("DEPT List");
        for (Department dept : deptList) {
            System.out.println(dept.toString());
        }
        
        ArrayList<Position> posList = dao.positionList();
        System.out.println("POS List");
        for (Position pos : posList) {
            System.out.println(pos.toString());
        }
        
        
        String name = dao.login("2", "1122334");
        System.out.println("login name: " + name);
        
        int minBasicPay = dao.getMinBasicPay("1");
        System.out.println("minBasicPay: " + minBasicPay);
        
        String adminName = dao.loginAdmin("1", "1234567");
        System.out.println("admin login name: " + adminName);
        
        Employee emp = dao.searchId("2");
        System.out.println("emp: " + emp.toString());
        
        mav.setViewName(viewName);
        
        //-------------------------------------------------------
        return mav;
    }

}
