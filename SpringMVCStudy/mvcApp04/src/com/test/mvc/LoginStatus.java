package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public final class LoginStatus {
	private HttpServletRequest request;
	private ModelAndView mav;
	
	public LoginStatus(HttpServletRequest request, ModelAndView mav) {
		this.request = request;
		this.mav = mav;
	}

	public ModelAndView check() {
		// [자격 검증] -------------------------------------
        //-- 정상적인 로그인 과정을 거쳤는지의 여부 확인
        //   (→ LoginController 에서 세션에 『admin』 이라는 키값으로
        //       사용자 이름을 저장한 것을 확인할 수 있다.)
        HttpSession session = request.getSession();
        String admin = (String)session.getAttribute("admin");

        if (session.getAttribute("name") == null)  //-- 비정상적인 접근(로그인 과정 없이 직접 접근)
        {
            // 로그인이 되어 있지 않은 상태이므로
            // 로그인 폼으로 다시 보내버린다.
            mav.setViewName("redirect:loginform.action");
        } else if (admin == null) { //-- 비정상적인 접근(로그인 과정 없이 직접 접근)
            // 로그인은 되어있지만 이 때 클라이언트는
            // 관리자가 아닌 일반 직원으로 로그인 되어 있는 상태이므로
            // 로그아웃 처리 후
            // 로그인 폼으로 다시 보내버린다.
            mav.setViewName("redirect:logout.action");
        }
        return mav;  //-- 메소드 종료
	}
}
