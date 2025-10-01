/**
 * ========================================
 *   PositionDeleteController.java
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

public class PositionDeleteController implements Controller
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
        String viewName = "redirect:/positionlist.action";
        
        // 이전 페이지(PositionList.jsp)로 부터 넘어온 데이터 수신
        //-- positionId
        String positionId = request.getParameter("positionId");
        
        try {
            positionDAO.remove(positionId);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        mav.setViewName(viewName);
        
        //-------------------------------------------------------
        return mav;
    }

}
