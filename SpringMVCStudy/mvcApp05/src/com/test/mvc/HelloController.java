/**
 * ========================================
 *   HelloController.java
 *    - 사용자 정의 컨트롤러 클래스
 * ========================================
 */

package com.test.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
*/

// ※ Spring MVC 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성할 수 있도록 한다.

// * Annotation 표기법으로 만든 컨트롤러 객체 지정

//@org.springframework.stereotype.Controller
@Controller  //-- check~!!!
public class HelloController //implements Controller
{

    /*
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        // Controller 가 수행해야 할 액션 코드
        ModelAndView mav = new ModelAndView();
        //-------------------------------------------------------
        
        
        //-------------------------------------------------------
        return mav;
    }
    */

    // ※ 액션 처리를 위한 메서드는 사용자가 지정(정의)
    /*
    @RequestMapping("URL매핑주소")
    public String 메소드이름(매개변수)
    {
        // ※ 비즈니스 로직 처리 (모델 활용)
        // ...
        
        return  "뷰 이름.jsp";
    }
    */
    
    
    // 메소드를 정의하는 과정에서 매개변수에 필요로 하는 객체를 지정하면
    // 이를 스프링에 전달해 주게 된다.
    //-- String 반환 형태로 유연성 체크
    @RequestMapping("/hello.action")
    public String hello(Model model) {
        // ※ 비즈니스 로직 처리(모델 활용)
        //...
        
        // 데이터 전달(스프링 컨테이너로(뷰로) 전달)
        // 모델을 컨트롤하는 주체 → 스프링 컨테이너
        model.addAttribute("hello", "Hello, SpringMVCAnnotation World~!!!");
        
        return "/WEB-INF/view/Hello.jsp";
    }
}
