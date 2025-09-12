/**
 * =====================================================
 *   JsonTest03okController.java
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
public class JsonTest03okController extends HttpServlet
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
        
        String view = "WEB-INF/view/JsonTest03ok.jsp";
        
        String strSu1 = request.getParameter("su1");
        String strSu2 = request.getParameter("su2");
        String oper = request.getParameter("oper");
        
        try {
            int su1 = Integer.parseInt(strSu1);
            int su2 = Integer.parseInt(strSu2);
            String result = "";
            String op = "";
            switch(oper) {
                case "add": result = String.format("%d", su1+su2); op = "+"; break;
                case "sub": result = String.format("%d", su1-su2); op = "-"; break;
                case "mul": result = String.format("%d", su1*su2); op = "*"; break;
                case "div": result = String.format("%.2f", su1/(double)su2); op = "/"; break;
            }
            
            request.setAttribute("result", result);
            request.setAttribute("op", op);
            
            RequestDispatcher rd = request.getRequestDispatcher(view);
            rd.forward(request, response);
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
    }

}
