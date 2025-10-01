/**
 * ========================================
 *   RegionListController.java
 *    - 사용자 정의 컨트롤러 클래스
 *    - 지역 리스트 출력 액션 컨트롤러
 *    - regionList.action
 * ========================================
 */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring MVC 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성할 수 있도록 한다.

public class RegionListController implements Controller
{
    private IRegionDAO regionDAO;

    public void setRegionDAO(IRegionDAO regionDAO)
    {
        this.regionDAO = regionDAO;
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        // Controller 가 수행해야 할 액션 코드
        ModelAndView mav = new ModelAndView();
        //-------------------------------------------------------
        String viewName = "/WEB-INF/view/RegionList.jsp";
        
        try {
            mav.addObject("regionList", regionDAO.list());
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        mav.setViewName(viewName);
        //-------------------------------------------------------
        return mav;
    }

}
