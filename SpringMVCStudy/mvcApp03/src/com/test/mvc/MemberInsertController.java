/**
 * ========================================
 *   MemberInsertController.java
 *    - 사용자 정의 컨트롤러 클래스
 *    - 회원 데이터 추가 액션 처리 클래스
 *    - DAO 객체대 대한 의존성 주입 준비
 *      → 인터페이스를 자료형으로 취하는 속성 구성
 *      → setter 구성
 * ========================================
 */


package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring MVC 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성할 수 있도록 한다.

public class MemberInsertController implements Controller
{
    // 주요 속성 구성 → 인터페이스 형태
    private IMemberDAO dao;

    // setter 구성
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
        
        // check~!!! (→ MemberListController 스킵하고 jsp로 이동)
        //String viewName = "/WEB-INF/view/MemberList.jsp";  //-- (X)
        
        // 사용자에게 memberlist.do 를 다시 요청할 수 있도록 안내
        // (→ MemberListController 통해서 jsp로 이동)
        // → sendRedirect() → memberlist.do
        String viewName = "redirect:memberlist.do";
        
        // 이전 페이지(→ MemberList.jsp)로부터 넘어온 데이터 수신
        //-- name, telephone
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String telephone = request.getParameter("telephone");
        
        try {
            MemberDTO member = new MemberDTO();
            member.setName(name);
            member.setTelephone(telephone);
            dao.add(member);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        // check~!!!
        mav.setViewName(viewName);
        //-------------------------------------------------------
        return mav;
    }

}
