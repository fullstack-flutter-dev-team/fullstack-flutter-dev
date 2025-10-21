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
public class StudentController
{
    @Autowired
    private SqlSession sqlSession;
    
    @RequestMapping(value="/studentlist.action", method=RequestMethod.GET)
    public String studentList(Model model) {
        IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
        model.addAttribute("list", dao.list());
        model.addAttribute("count", dao.count());
        return "/WEB-INF/view/StudentList.jsp";
    }
    
    @RequestMapping(value = "/studentinsertform.action", method = RequestMethod.GET)
    public String studentInsertForm(Model model) {
        return "/WEB-INF/view/StudentInsertForm.jsp";
    }

}
