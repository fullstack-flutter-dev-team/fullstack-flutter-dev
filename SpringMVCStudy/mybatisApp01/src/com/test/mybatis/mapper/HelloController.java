package com.test.mybatis.mapper;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * =====================================
 *   HelloController.java
 *    - 컨트롤러
 * =====================================
 */


@Controller
public class HelloController
{
    @RequestMapping(value="/hello.action", method=RequestMethod.GET)
    public String hello(Model model) {
        
        model.addAttribute("message", "Hello Spring annotation + spring MVC + mybatis Framework");
        
        return "/WEB-INF/view/Hello.jsp";
    }

}
