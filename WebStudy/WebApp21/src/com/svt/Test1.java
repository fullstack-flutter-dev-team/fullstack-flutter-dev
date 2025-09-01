/**
 * =====================================================
 *   SampleServlet.java
 * =====================================================
 */
package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author sist
 *
 */
public class Test1 extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println(">>> doGet");
        doGetPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println(">>> doPost");
        doGetPost(request, response);
    }
    
    protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println(">>> doGetPost");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter pw = response.getWriter();
        
        pw.println("<html>");
        pw.println("<head>");
        pw.println("<meta charset='UTF-8'>");
        pw.println("<title>Test1.java</title>");
        pw.println("</head>");
        pw.println("<body>");
        pw.println("<div>");
        pw.println("<h1>name: 홍길동</h1>");
        pw.println("<h1>age: 23 </h1>");
        pw.println("</div>");
        pw.println("</body>");
        
        
        
        pw.println("</html>");
        
        
    }

}
