/**
 * =====================================================
 *   SampleServlet.java
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
public class PostTest02okController extends HttpServlet
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
        String view = "WEB-INF/view/PostTest02ok.jsp";
        String strSu1 = request.getParameter("su1");
        String strSu2 = request.getParameter("su2");
        String oper = request.getParameter("oper");
        
        try {
            int su1 = Integer.parseInt(strSu1);
            int su2 = Integer.parseInt(strSu2);
            String result = "";
            
            switch (oper) {
                case "add" : result = String.format("%s + %s = %d", strSu1, strSu2, su1+su2); break;
                case "sub" : result = String.format("%s - %s = %d", strSu1, strSu2, su1-su2); break;
                case "mul" : result = String.format("%s * %s = %d", strSu1, strSu2, su1*su2); break;
                case "div" : result = String.format("%s / %s = %.2f", strSu1, strSu2, su1/(double)su2); break;
            }
            
            request.setAttribute("result", result);
            System.out.println(">>>strSu1 : " + strSu1);
            System.out.println(">>>strSu2 : " + strSu2);
            System.out.println(">>>oper : " + oper);
            System.out.println(">>>result : " + result);
            
            RequestDispatcher rd = request.getRequestDispatcher(view);
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

}
