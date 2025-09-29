/**
 * ========================================
 *   SampleController.java
 *    - 사용자 정의 컨트롤러 클래스
 *    - (ajax.action)
 *    - AJAX 요청 컨트롤러
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

public class AjaxController implements Controller
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
        String viewName = "/WEB-INF/view/Ajax.jsp";
        
        // 이전 페이지(→ EmployeeInsertForm.jsp)로부터 넘어온 데이터 수신
        //-- positionId
        String positionId = request.getParameter("positionId");
        System.out.println(">>> positionId:" + positionId);
        
        try {
            int minBasicPay = employeeDAO.getMinBasicPay(positionId);
            System.out.println(">>> minBasicPay:" + minBasicPay);
            
            mav.addObject("minBasicPay", minBasicPay);
            mav.setViewName(viewName);
        } catch(Exception e) {
            System.out.println(e.toString());
        }
        
        //-------------------------------------------------------
        return mav;
    }

}
