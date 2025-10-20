/**
 * ========================================
 *   DepartmentDeleteController.java
 *    - 사용자 정의 컨트롤러 클래스
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

public class DepartmentDeleteController implements Controller
{
    private IDepartmentDAO departmentDAO;
    
    public void setDepartmentDAO(IDepartmentDAO departmentDAO)
    {
        this.departmentDAO = departmentDAO;
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        // Controller 가 수행해야 할 액션 코드
        ModelAndView mav = new ModelAndView();
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
        // -------------------------------------- [자격 검증]
            
        String viewName = "redirect:/departmentlist.action";
        
        // 이전 페이지(DepartmentList.jsp)로 부터 넘어온 데이터 수신
        //-- departmentId
        String departmentId = request.getParameter("departmentId");
        
        try {
            departmentDAO.remove(departmentId);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        mav.setViewName(viewName);
        
        //-------------------------------------------------------
        return mav;
    }

}
