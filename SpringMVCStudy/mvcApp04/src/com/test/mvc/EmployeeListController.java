/**
 * ========================================
 *   EmployeeListController.java
 *    → 사용자 정의 컨트롤러 클래스
 *    → 직원 리스트 컨트롤러 
 *    → 리스트 페이지 요청에 대한 액션 처리
 *        - (employeelist.action) 리스트 출력 액
 *    → DAO 객체에 대한 의존성 주입(DI)을 위한 준비
 *        - 인터페이스 형태의 자료형 속성으로 구성
 *        - setter 구성 
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

public class EmployeeListController implements Controller
{
    // 주요 속성 구성 → 인터페이스 형태의 자료형 속성으로 구성
    private IEmployeeDAO employeeDAO;

    public void setEmployeeDAO(IEmployeeDAO employeeDAO)
    {
        this.employeeDAO = employeeDAO;
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        // Controller 가 수행해야 할 액션 코드
        ModelAndView mav = new ModelAndView();
        //-------------------------------------------------------
        String viewName = "/WEB-INF/view/EmployeeList.jsp";
        ArrayList<Employee> empList = new ArrayList<Employee>();
        
        try {
            empList = employeeDAO.list();
            
            mav.addObject("employeeList", empList);
            mav.setViewName(viewName);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        // 확인
        System.out.println("<<<-- 직원 리스트 조회 -->>>");
        for (Employee emp : empList) {
            System.out.println(emp.toString());
        }
        //-------------------------------------------------------
        return mav;
    }

}
