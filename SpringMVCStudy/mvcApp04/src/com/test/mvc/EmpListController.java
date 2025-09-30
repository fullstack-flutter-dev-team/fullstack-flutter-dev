/**
 * ========================================
 *   EmpListController.java
 *    - 사용자 정의 컨트롤러 클래스
 *    - 직원 리스트 출력 액션 컨트롤러
 *    - emplist.action
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

public class EmpListController implements Controller
{
    private EmployeeDAO employeeDAO;
    public void setEmployeeDAO(EmployeeDAO employeeDAO)
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
        //   (→ LoginController 에서 세션에 『name』 이라는 키값으로
        //       사용자 이름을 저장한 것을 확인할 수 있다.)
        HttpSession session = request.getSession();
        String name = (String)session.getAttribute("name");

        if (name == null)  //-- 비정상적인 접근(로그인 과정 없이 직접 접근)
        {
            // 로그인이 되어 있지 않은 상태이므로
            // 로그인 폼으로 다시 보내버린다.
            mav.setViewName("redirect:loginform.action");
            return mav;  //-- 메소드 종료
        }   

        // -------------------------------------- [자격 검증]


        String viewName = "/WEB-INF/view/EmpList.jsp";
        
        try {
            // 직원 리스트 조회
            mav.addObject("employeeList", employeeDAO.list());
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        mav.setViewName(viewName);
        //-------------------------------------------------------
        return mav;
    }

}
