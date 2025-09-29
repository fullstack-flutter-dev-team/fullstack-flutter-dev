/**
 * ========================================
 *   EmployeeInsertFormController.java
 *    → 사용자 정의 컨트롤러 클래스
 *    → 직원 데이터 입력 폼 컨트롤러
 *    → 페이지 요청에 대한 액션 처리
 *        - (employeeinsertform.action) 액션
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

public class EmployeeInsertFormController implements Controller
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
        String viewName = "/WEB-INF/view/EmployeeInsertForm.jsp";
        ArrayList<Region> regionList = new ArrayList<Region>();
        ArrayList<Department> departmentList = new ArrayList<Department>();
        ArrayList<Position> positList = new ArrayList<Position>();
        
        try {
            regionList = employeeDAO.regionList();
            departmentList = employeeDAO.departmentList();
            positList = employeeDAO.positionList();
            
            mav.addObject("regionList", regionList);
            mav.addObject("departmentList", departmentList);
            mav.addObject("positionList", positList);
            
            mav.setViewName(viewName);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        // 확인
        System.out.println("<<<-- 지역 리스트 조회 -->>>");
        for (Region region : regionList) {
            System.out.println(region.toString());
        }
        // 확인
        System.out.println("<<<-- 부서 리스트 조회 -->>>");
        for (Department department : departmentList) {
            System.out.println(department.toString());
        }
        // 확인
        System.out.println("<<<-- 직위 리스트 조회 -->>>");
        for (Position position : positList) {
            System.out.println(position.toString());
        }
        //-------------------------------------------------------
        return mav;
    }

}