/**
 * ========================================
 *   EmployeeInsertController.java
 *    → 사용자 정의 컨트롤러 클래스
 *    → 직원 데이터 입력 액션 수행
 *    → DAO 필요
 *      → DAO 객체에 대한 의존성 주입(DI)을 위한 준비
 *         → 인터페이스 형태의 자료형 속성 구성
 *         → setter 구성
 *    → 직원 데이터 입력 액션 컨트롤러
 *    → 이후 employeelist.action을 다시 요청할 수 있도록 안내
 *       → redirect
 * ========================================
 */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring MVC 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성할 수 있도록 한다.

public class EmployeeInsertController implements Controller
{
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
        
        // 이전 페이지(→ EmployeeInsertFrom.jsp)로 부터 넘어온 데이터 수신
        //-- name, ssn1, ssn2, bitrhday, lunar, telephone
        //   , regionId, dapartmentId, positonId, basicPay, extrapay
        
        // request.setCharacterEncoding("UTF-8");
        //-- front controller 에 추가한 필터를 통해 수행
        
        String name = request.getParameter("name");
        String ssn1 = request.getParameter("ssn1");
        String ssn2 = request.getParameter("ssn2");
        String birthday = request.getParameter("birthday");
        String lunar = request.getParameter("lunar");
        String telephone = request.getParameter("telephone");
        String regionId = request.getParameter("regionId");
        String departmentId = request.getParameter("departmentId");
        String positionId = request.getParameter("positionId");
        String basicPay = request.getParameter("basicPay");
        String extraPay = request.getParameter("extraPay");
        
        System.out.println(">>> extraPay : " + extraPay);
        
        try {
            // Employee 객체 구성 → DAO 의 add() 메서드에 넘겨주어야 하므로...
            Employee employee = new Employee();
            employee.setName(name);
            employee.setSsn1(ssn1);
            employee.setSsn2(ssn2);
            employee.setBirthday(birthday);
            employee.setLunar(Integer.parseInt(lunar));
            employee.setTelephone(telephone);
            employee.setRegionId(regionId);
            employee.setDepartmentId(departmentId);
            employee.setPositionId(positionId);
            employee.setBasicPay(Integer.parseInt(basicPay));
//            employee.setExtraPay(Integer.parseInt(extraPay));
            if (extraPay != "" && extraPay != null) {
                employee.setExtraPay(Integer.parseInt(extraPay));
            } else {
                employee.setExtraPay(0);
            }
            
            System.out.println(">>>> employee : " + employee.toString());
            
            employeeDAO.add(employee);

            // check~!!!
            // mav.setViewName("/WEB-INF/view/EmployeeList.jsp"); //--- (X)
            String viewName = "redirect:employeelist.action";
            mav.setViewName(viewName);
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        
        //-------------------------------------------------------
        return mav;
    }

}
