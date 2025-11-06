package com.test.mybatis;

import java.util.ArrayList;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.mybatis.dto.InquiryDTO;
//import com.test.mybatis.dto.UserDTO;

/* ========================
    InquiryController.java
    - 컨트롤러 (DAO/DTO 구조 반영)
======================== */

@Controller
public class InquiryController<HttpSession> {

    @Autowired
    private SqlSession sqlSession;

    // 문의 등록 페이지
    @RequestMapping(value="/inquiry/write.do", method=RequestMethod.GET)
    public String writePage(Model model) {
        // 문의 등록 페이지를 반환
        return "/WEB-INF/view/inquiry/Write.jsp";
    }

    // 문의 등록 처리
    @RequestMapping(value="/inquiry/insert.do", method=RequestMethod.POST)
    public String insertInquiry(InquiryDTO dto, HttpSession session, Model model) {
//        UserDTO user = (UserDTO) session.getAttribute("user");

        // 세션에 사용자 정보가 있을 경우, 사용자 아이디 설정
//        if (user != null) {
//            dto.setUserId(user.getUserId());
//        }

        IInquiryDAO inquiryDAO = sqlSession.getMapper(IInquiryDAO.class);
        int result = inquiryDAO.insertInquiry(dto); // insert 성공 여부
        model.addAttribute("result", result);

        // 문의 등록 후 프로필 수정 페이지로 리다이렉트
        return "redirect:/profilemodify.do";
    }

    // 사용자별 문의 내역 조회 (프로필용)
    @RequestMapping(value="/inquiry/list.do", method=RequestMethod.GET)
    public String userInquiryList(HttpSession session, Model model) {
//        UserDTO user = (UserDTO) session.getAttribute("user");

        // 세션에 사용자 정보가 있을 경우, 사용자 아이디로 문의 내역 조회
//        if (user != null) {
//            String userId = user.getUserId();
//
//            IInquiryDAO inquiryDAO = sqlSession.getMapper(IInquiryDAO.class);
//            ArrayList<InquiryDTO> inquiries = inquiryDAO.userInquiryList(userId);
//            model.addAttribute("inquiries", inquiries);
//        }

        // 사용자 문의 내역 페이지로 이동
        return "/WEB-INF/view/inquiry/List.jsp";
    }

    // 문의 상세 조회
    @RequestMapping(value="/inquiry/detail.do", method=RequestMethod.GET)
    public String inquiryDetail(@RequestParam("inquiryNo") String inquiryNo, Model model) {
        IInquiryDAO inquiryDAO = sqlSession.getMapper(IInquiryDAO.class);
        
        // 문의 상세 조회
        InquiryDTO inquiry = inquiryDAO.inquiryDetail(inquiryNo);
        model.addAttribute("inquiry", inquiry);

        // 문의에 대한 답변 목록도 함께 조회
        ArrayList<InquiryDTO> answers = inquiryDAO.answerList(inquiryNo);
        model.addAttribute("answers", answers);

        // 문의 상세 페이지로 이동
        return "/WEB-INF/view/inquiry/Detail.jsp";
    }

    // 관리자 답변 등록
    @RequestMapping(value="/inquiry/answer.do", method=RequestMethod.POST)
    public String insertAnswer(InquiryDTO dto, Model model) {
        IInquiryDAO inquiryDAO = sqlSession.getMapper(IInquiryDAO.class);

        // 답변 등록 처리
        int result = inquiryDAO.insertAnswer(dto);
        model.addAttribute("result", result);

        // 답변 후 해당 문의 상세 페이지로 리다이렉트
        return "redirect:/inquiry/detail.do?inquiryNo=" + dto.getInquiryNo();
    }

    // 관리자 전체 문의 목록 조회
    @RequestMapping(value="/admin/inquiry/list.do", method=RequestMethod.GET)
    public String adminInquiryList(Model model) {
        IInquiryDAO inquiryDAO = sqlSession.getMapper(IInquiryDAO.class);

        // 전체 문의 내역 조회
        ArrayList<InquiryDTO> inquiries = inquiryDAO.allInquiryList();
        model.addAttribute("inquiries", inquiries);

        // 관리자 전체 문의 목록 페이지로 이동
        return "/WEB-INF/view/inquiry/AdminList.jsp";
    }
}