/**
 * =====================================================
 *   AjaxTest04okController.java
 * =====================================================
 */
package com.test.ajax;

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
public class AjaxTest04okController extends HttpServlet
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
        
        // 이전 페이지(→ AjaxTest04.jsp)로부터 넘어온 데이터 수신
        //-- title, content
        
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        request.setAttribute("title", title);
        request.setAttribute("content", content);
        
        String view = "WEB-INF/view/AjaxTest04ok.jsp";
        
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

}
