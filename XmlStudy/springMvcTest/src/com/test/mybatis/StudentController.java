/**
 * =====================================
 *   StudentController.java
 *    - 컨트롤러
 *    - mybatis 객체 활용(Controller)
 *    - 학생 관련 액션 처리
 * =====================================
 */

package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class StudentController
{
    @Autowired
    private SqlSession sqlSession;
    
    // 학생 리스트 액션 처리
    @RequestMapping(value="/studentlist.action", method=RequestMethod.GET)
    public String studentList(Model model) {
        IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
        model.addAttribute("list", dao.list());
        model.addAttribute("count", dao.count());

        return "/WEB-INF/view/StudentList.jsp";
    }
    
    // 학생 등록 폼 뷰 호출
    @RequestMapping(value = "/studentinsertform.action", method = RequestMethod.GET)
    public String studentInsertForm(Model model) {
        return "/WEB-INF/view/StudentInsertForm.jsp";
    }
    
    // 학생 등록 액션 처리
    @RequestMapping(value = "/studentinsert.action", method = RequestMethod.POST)
    public String studentInsert(StudentDTO student) {
        System.out.println(">>> student : " + student.toString());
        IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
        dao.add(student);

        return "redirect:studentlist.action";
    }

}
