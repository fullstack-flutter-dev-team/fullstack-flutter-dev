/**
 * =====================================================
 *   HelloSend03Controller.java
 * =====================================================
 */
package com.svt;

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
public class HelloSend03Controller extends HttpServlet
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
        
        // 사전에 수행해야 할 업무 없음
        
        // View 객체에 대한 연결
//        RequestDispatcher rd = request.getRequestDispatcher("HelloSend03.html");
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/HelloSend03.html");
        rd.forward(request, response);
    }

}
