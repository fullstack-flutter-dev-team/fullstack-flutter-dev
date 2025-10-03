/**
 * ========================================
 *   PositionListController.java
 *    - 사용자 정의 컨트롤러 클래스
 * ========================================
 */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring MVC 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성할 수 있도록 한다.

public class PositionListController implements Controller
{
    private IPositionDAO positionDAO;
    
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
        ModelAndView loginStatusMav= new LoginStatus(request, mav).check();
        if (loginStatusMav.getViewName() != null) {
            return loginStatusMav;
        }//------------[로그인 상태 & 관리자 로그인 상태 체크]

        String viewName = "/WEB-INF/view/PositionList.jsp";
        
        try {
            mav.addObject("positionList", positionDAO.list());
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        mav.setViewName(viewName);
        //-------------------------------------------------------
        return mav;
    }

}
