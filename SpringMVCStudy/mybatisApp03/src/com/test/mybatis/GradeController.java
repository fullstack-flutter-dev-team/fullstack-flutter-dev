package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * =====================================
 *   SampleController.java
 *    - 컨트롤러
 * =====================================
 */


@Controller
public class GradeController
{
    @Autowired
    private SqlSession sqlSession;
    
    @RequestMapping(value="/gradelist.action", method=RequestMethod.GET)
    public String gradeList(Model model) {
        
        
        return "/WEB-INF/view/GradeList.jsp";
    }
    
    @RequestMapping(value = "/gradeinsert.action", method = RequestMethod.GET)
    public String gradeInsertForm(Model model) {
        return "/WEB-INF/view/StudentInsertForm.jsp";
    }

}
