/**
 * =====================================================
 *   HelloReceive03Controller.java
 * =====================================================
 */
package com.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.HelloReceive03Model;

/**
 * @author sist
 *
 */
public class HelloReceive03Controller extends HttpServlet
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
        request.setCharacterEncoding("UTF-8");
        
        // Model 객체 연결(수행) → 업무로직 수행, view 정보 얻어내기
        HelloReceive03Model model = new HelloReceive03Model();
        String view = model.process(request, response);
        
        // View 객체 연결
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
        
    }

}
