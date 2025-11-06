/**
 * =====================================================
 *   GradeController.java
 *    - 컨트롤러
 *    - mybatis 객체 활용(Controller)
 *    - 성적 데이터 입출력 및 처리를 위한 액션 처리
 * =====================================================
 */

package com.test.mybatis;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class GradeController
{
    @Autowired
    private SqlSession sqlSession;
    
    /**
     * 성적 리스트 출력 액션 처리
     * @param model
     * @return
     */
    @RequestMapping(value="/gradelist.action", method=RequestMethod.GET)
    public String gradeList(Model model) {
        IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
        model.addAttribute("list", dao.list());
        model.addAttribute("count", dao.count());
        
        return "/WEB-INF/view/GradeList.jsp";
    }
    
    /**
     * 성적 정보 입력 폼 출력 액션 처리
     * @param parameters
     * @return
     */
    @RequestMapping(value = "/gradeinsertForm.action",method = RequestMethod.GET)
    public ModelAndView gradeInsertForm(@RequestParam Map<String, String> parameters) {
        String sid = parameters.get("sid");
        String name = parameters.get("name");

        System.out.println(">>>> sid : " + sid);
        System.out.println(">>>> name : " + name);
        ModelAndView mav = new ModelAndView();

        mav.addObject("sid", sid);
        mav.addObject("name", name);
        mav.setViewName("/WEB-INF/view/GradeInsertForm.jsp");

        return mav;
    }
    
    /**
     * 성적 정보 입력 액션 처리
     * @param grade
     * @return
     */
    @RequestMapping(value = "/gradeinsert.action", method = RequestMethod.POST)
    public String studentInsert(GradeDTO grade) {
        System.out.println(">>> grade : " + grade.toString());
        System.out.println(">>> sid : " + grade.getSid());
        IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
        dao.add(grade);

        return "redirect:gradelist.action";
    }
}
