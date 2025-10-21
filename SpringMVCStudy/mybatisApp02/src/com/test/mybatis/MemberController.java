package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * =====================================
 *   MemberController.java
 *    - 컨트롤러
 * =====================================
 */

// ①MemberController 등록
@Controller
public class MemberController
{
    // 주요 속성 구성 인터페이스 형태 자료형
    /*
    private IMemberDAO memberDAO;
    
    public void setMemberDAO(IMemberDAO memberDAO)
    {
        this.memberDAO = memberDAO;
    }
    */
    
    // ② mybatis 객체 활용
    @Autowired
    private SqlSession sqlSession;
    //-- 객체 의존성 (자동) 주입~!!!!
    //   스프링 컨테이너가 자동으로 처리하게 요청


    @RequestMapping(value="/memberlist.action", method=RequestMethod.GET)
    public String memberList(Model model) {
        
        //IMemberDAO dao = (IMemberDAO)new MemberDAO();
        //sqlSession.getMapper(IMemberDAO.class);
        // ③
        IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
        
        //dao.count();
        //dao.list();
        
        model.addAttribute("count", dao.count());
        model.addAttribute("list", dao.list());
        
        return "/WEB-INF/view/MemberList.jsp";
    }
    
    // memberinsert.action
    // POST
    // memberInsert(MemberDTO m)
    // redirect:memberlist.action
    @RequestMapping(value="/memberinsert.action", method=RequestMethod.POST)
    public String memberInsert(MemberDTO member) {
        IMemberDAO dao  = sqlSession.getMapper(IMemberDAO.class);
        int result = dao.add(member);

        // memberlist 뷰로 화면 전환
        return "redirect:memberlist.action";
    }
    
    // 삭제 기능 처리
    @RequestMapping(value="/memberdelete.action", method=RequestMethod.GET)
    public String memberDelete(String mid) {
        IMemberDAO dao  = sqlSession.getMapper(IMemberDAO.class);
        dao.remove(mid);
        return "redirect:memberlist.action";
    }

}
