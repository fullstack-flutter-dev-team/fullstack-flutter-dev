/**
 * ========================================
 *   EmployeeUpdateController.java
 *    - 사용자 정의 컨트롤러 클래스
 *    - 직원 데이터 수정 액션 컨트롤러
 *      (employeeupdate.action)
 * ========================================
 */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring MVC 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성할 수 있도록 한다.

public class EmployeeUpdateController implements Controller
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
       
        // [자격 검증] -------------------------------------
        //-- 정상적인 로그인 과정을 거쳤는지의 여부 확인
        //   (→ LoginController 에서 세션에 『admin』 이라는 키값으로
        //       사용자 이름을 저장한 것을 확인할 수 있다.)
        HttpSession session = request.getSession();
        String admin = (String)session.getAttribute("admin");

        if (session.getAttribute("name") == null)  //-- 비정상적인 접근(로그인 과정 없이 직접 접근)
        {
            // 로그인이 되어 있지 않은 상태이므로
            // 로그인 폼으로 다시 보내버린다.
            mav.setViewName("redirect:loginform.action");
            return mav;  //-- 메소드 종료
        } else if (admin == null) { //-- 비정상적인 접근(로그인 과정 없이 직접 접근)
            // 로그인은 되어있지만 이 때 클라이언트는
            // 관리자가 아닌 일반 직원으로 로그인 되어 있는 상태이므로
            // 로그아웃 처리 후
            // 로그인 폼으로 다시 보내버린다.
            mav.setViewName("redirect:logout.action");
            return mav;  //-- 메소드 종료
        }
        // -------------------------------------------- [자격 검증]
        
        // 이전 페이지(→ EmployeeUpdateFrom.jsp)로 부터 넘어온 데이터 수신
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
            
            employeeDAO.modify(employee);

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
