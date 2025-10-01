/**
 * ========================================
 *   SampleController.java
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

public class RegionUpdateController implements Controller
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
       String viewName = "redirect:regionlist.action";
       
       // 이전 페이지(RegionUpdateForm.jsp)로부터 넘어온 데이터
       //-- regionId, regionName
       String regionId = request.getParameter("regionId");
       String regionName = request.getParameter("regionName");
        
        try {
            Region region = new Region();
            region.setRegionId(regionId);
            region.setRegionName(regionName);
            regionDAO.modify(region);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        mav.setViewName(viewName);
        //-------------------------------------------------------
        return mav;
    }

}
