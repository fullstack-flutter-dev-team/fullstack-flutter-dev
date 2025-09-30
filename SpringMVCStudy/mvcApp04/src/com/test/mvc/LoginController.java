/**
 * ========================================
 *   LoginController.java
 *    - 사용자 정의 컨트롤러 클래스
 *    - 로그인 액션 컨트롤러
 *      - (login.action)
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

public class LoginController implements Controller
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
        
        // 이전 페이지(-> LoginForm.jsp)로부터 넘어온 데이터 수신
        // → id, pw, admin
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String admin = request.getParameter("admin");

        // String name = ""; //--(X) null 로 초기화 해야 함
        String name = null;  //--(O) null 로 초기화 해야 함

        try {
            // 로그인 처리
            //-- 사용자의 요청에 따른 로그인 처리 방식 구분(분기)
            if (admin==null) {
                // 일반 직원 로그인
                name = employeeDAO.login(id, pw);
            } else {
                // 관리자 로그인
                name = employeeDAO.loginAdmin(id, pw);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        // 위에서 로그인 시도 후....
        // 로그인 수행에 따른 성공 여부 확인 및 구분(분기)
        // if (name != null) {  //--(X) 로그인 실패 시 null 로 처리되므로
        if (name == null) {    //--(O) 로그인 실패 시 null 로 처리  되므로
            // 로그인 실패
            //-- 로그인 폼을 다시 요청할 수 있도록 안내
            // mav.setViewName("/WEB-INF/view/LoginForm.jsp");
            mav.setViewName("redirect:loginform.action");  //--(O) redirect 방식
        } else {
            // 로그인 성공
            //-> 세션 구성 -> 세션에 name 적재
            HttpSession session = request.getSession();
            session.setAttribute("name", name);

            // 관리자인지 일반직원인지으 여부 확인(분기)
            if (admin==null) { 
                // 일반 직원 로그인 성공
                mav.setViewName("redirect:emplist.action");  //--(O) redirect 방식
            } else {
                // 관리자 로그인 성공
                // session.setAttribute("admin", "grade1");
                // session.setAttribute("admin", "grade2");
                session.setAttribute("admin", "true");
                mav.setViewName("redirect:employeelist.action");  //--(O) redirect 방식
            }
        }


        //-------------------------------------------------------
        return mav;
    }

}
