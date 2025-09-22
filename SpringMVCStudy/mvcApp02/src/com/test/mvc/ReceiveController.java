/**
 * ========================================
 *   ReceiveController.java
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

public class ReceiveController implements Controller
{

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        // Controller 가 수행해야 할 액션 코드
        ModelAndView mav = new ModelAndView();
        //-------------------------------------------------------
        request.setCharacterEncoding("utf-8");
        
        // 이전 페이지(→ Send.jsp)로부터 넘어온 데이터 수신
        //-- userName
        String name = request.getParameter("userName");
        String view = "/WEB-INF/view/Receive.jsp";
        
        // 뷰 페이지에 넘겨줄 데이터 구성
        mav.addObject("name", name);
        
        // 데이터 넘겨줄 뷰 페이지 지정
        mav.setViewName(view);
        //-------------------------------------------------------
        return mav;
    }

}
