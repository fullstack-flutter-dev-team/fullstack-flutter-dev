/**
 * =====================================================
 *   SampleServlet.java
 * =====================================================
 */
package com.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author sist
 *
 */
public class Test02 extends HttpServlet
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
        // 데이터 수신(→ AjaxTest02.jsp)로 부터 넘어온 데이터
        
        //-- n1, n2
        int n1 = Integer.parseInt(request.getParameter("n1"));
        int n2 = Integer.parseInt(request.getParameter("n2"));
        
        // 로직 처리 (연산 처리)
        //-- 업무 내용을 처리하는 Model 에 위임 가능
        int result = n1 + n2;
        
        // 반환할 결과값 데이터 준비
        request.setAttribute("result", result);
        
        // 뷰 구성
        String view = "WEB-INF/view/Test02_ok.jsp";
        
        // 요청 내용 전달
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }

}
