/**
 * =====================================================
 *   GetTest02okController.java
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
public class GetTest02okController extends HttpServlet
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
        String view = "WEB-INF/view/GetTest02ok.jsp";
        
        // 
        String su1 = request.getParameter("su1");
        String su2 = request.getParameter("su2");
        String oper = request.getParameter("oper");
        
        try {
            int nSu1 = Integer.parseInt(su1);
            int nSu2 = Integer.parseInt(su2);
            String result = "";
            
            switch (oper) {
                case "add" : result = String.format("%d", nSu1+nSu2); break;
                case "sub" : result = String.format("%d", nSu1-nSu2); break;
                case "mul" : result = String.format("%d", nSu1*nSu2); break;
                case "div" : result = String.format("%.2f", nSu1/(double)nSu2); break;
            }
            
            request.setAttribute("result", result);
            
            RequestDispatcher rd = request.getRequestDispatcher(view);
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
    }

}
