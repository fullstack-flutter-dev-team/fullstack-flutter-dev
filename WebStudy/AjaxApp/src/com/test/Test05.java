/**
 * =====================================================
 *   Test05.java
 * =====================================================
 */
package com.test;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author sist
 *
 */
public class Test05 extends HttpServlet
{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGetPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGetPost(request, response);
    }
    
    protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // 서블릿 관련 코드 구성
        
        // 완성형 한글 형태로 전송된 데이터 수신
        request.setCharacterEncoding("UTF-8");
        
        // 이전 페이지로부터 넘어온 데이터 수신
        String search = request.getParameter("search");
        
        
        // DB 연결 및 액션 처리
        // ~~~~ WHERE COLUMN LIKE 'search%'; 와 같은 쿼리문 구성
        // ~~~~ WHERE COLUMN LIKE '%search%'; 와 같은 쿼리문 구성
        
        // 위와 같이 조회한 결과를 가지고 자료구조 활용 → WordDTO 들
        ArrayList<WordDTO> list = new ArrayList<>();
        
        
        if (search.equals("가")) {
            list.add(new WordDTO("가나"));
            list.add(new WordDTO("가수"));
            list.add(new WordDTO("가을"));
            list.add(new WordDTO("가을하늘"));
            list.add(new WordDTO("가루"));
        } else if (search.equals("가방")) {
            list.add(new WordDTO("가방끈"));
            list.add(new WordDTO("가방 색"));
            list.add(new WordDTO("가방 종류"));
            list.add(new WordDTO("가방 수선"));
        }  else if (search.equals("가방끈")) {
            list.add(new WordDTO("가방끈"));
            list.add(new WordDTO("가방끈 수리"));
            list.add(new WordDTO("가방끈 재고"));
            list.add(new WordDTO("가방끈 구입"));
        }
        
        // 처리한 업무 내용 추가
        request.setAttribute("list", list);
        
        String view = "WEB-INF/view/Test05ok.jsp";
        
        // Test05ok.jsp 에 전달
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

}
