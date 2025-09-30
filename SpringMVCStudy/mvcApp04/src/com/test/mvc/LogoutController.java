/**
 * ========================================
 *   SampleController.java
 *    - 사용자 정의 컨트롤러 클래스
 *    - 로그아웃 액션 컨트롤러
 *    - logout.action
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

public class LogoutController implements Controller
{

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        // Controller 가 수행해야 할 액션 코드
        ModelAndView mav = new ModelAndView();
        //-------------------------------------------------------
        
        // 로그아웃 처리
        // → 세션 무효화 처리(invalidate())
        HttpSession session = request.getSession();
        // session.invalidate();
        // → 세션에 저장되어 있는 모든 데이터가 제거된다.

        session.removeAttribute("name");
        session.removeAttribute("admin");
        // → 세션에 저장되어 있는 특정 데이터만 제거된다.
        //    (※ invalidate() 메소드를 호출하는 경우에는 의미 없음)
        //    (※ removeAttribute() 메소드를 호출하는 경우에는 의미 있음)
        //    (※ removeAttribute() 메소드를 호출하는 경우에는
        //        반드시 세션에 저장된 데이터의 키값을 정확히 알고 있어야 함)
        //    (※ removeAttribute() 메소드를 호출하는 경우에는
        //        존재하지 않는 키값을 지정하는 경우에도 에러 발생하지 않음)
        //    (※ removeAttribute() 메소드를 호출하는 경우에는
        //        해당 키값이 존재하지 않는 경우에는 단순 무시 처리됨)
        //    (※ removeAttribute() 메소드를 호출하는 경우에는
        //        해당 키값이 존재하는 경우에만 제거 처리됨)

        // 로그아웃 뷰 페이지 지정
        // -> 안전하게 로그아웃 처리되었습니다.
        //   -> 로그인 폼으로 이동
        // -> redirect 방식으로 처리
        //    (로그아웃 처리 후 다시 뒤로 가기(Back) 버튼을 누르는 경우
        //      로그인이 되어 있는 상태가 되지 않도록 하기 위해)    
        // → 로그인 폼으로 이동
        mav.setViewName("redirect:loginform.action");

        //-------------------------------------------------------
        return mav;
    }

}
