package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
        IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
        model.addAttribute("list", dao.list());
        model.addAttribute("count", dao.count());
        return "/WEB-INF/view/GradeList.jsp";
    }
    
    @RequestMapping(value = "/gradeinsertForm.action",method = RequestMethod.GET)
    public ModelAndView gradeInsertForm(@RequestParam(value="sid") String sid) {
    	System.out.println(">>>> sid : " + sid);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("sid", sid);
    	mav.setViewName("/WEB-INF/view/GradeInsertForm.jsp");
        return mav;
    }
    
    @RequestMapping(value = "/gradeinsert.action", method = RequestMethod.POST)
    public String studentInsert(GradeDTO grade) {
    	System.out.println(">>> grade : " + grade.toString());
    	System.out.println(">>> sid : " + grade.getSid());
    	IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
    	dao.add(grade);
    	return "redirect:gradelist.action";
    }
}
