/**
 * ========================================
 *   MemberListController.java
 *    - 사용자 정의 컨트롤러 클래스
 *    - 리스트 출력 액션
 *    - DAO 객체대 대한 의존성 주입 준비
 *      → 인터페이스를 자료형으로 취하는 속성 구성
 *      → setter 구성
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

public class MemberListController implements Controller
{
    // 인터페이스 자료형을 취하는 속성 구성
    private IMemberDAO dao;

    public void setDao(IMemberDAO dao)
    {
        this.dao = dao;
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        // Controller 가 수행해야 할 액션 코드
        ModelAndView mav = new ModelAndView();
        //-------------------------------------------------------
        String viewName = "/WEB-INF/view/MemberList.jsp";
        int count = 0;
        ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
        
        try {
            count = dao.count();
            memberList = dao.list();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
                
        mav.addObject("count", count);
        mav.addObject("memberList", memberList);

        mav.setViewName(viewName);
        
        //-------------------------------------------------------
        return mav;
    }

}
