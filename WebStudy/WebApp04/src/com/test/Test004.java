/* ============================
 *  Test004.java
 *  - Servlet 실습
 * ============================
 */

// 현재.... 자바의 기본 클래스 Test004
// 이를 Servlet 으로 구성하는 방법


// GenericServlet(추상클래스) 을 상속받는 클래스로 설계 → Servlet 구성
package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/* 
 * Servlet
 * ㄴinit
 *  ㄴservice
 *      ㄴdoGet
 *      ㄴdoPost
 * ㄴdestory
 */

// public class Test004
// public class Test004 implements Servlet     //-- Type A.
// public class Test004 extends GenericServlet //-- Type B.
// public class Test004 extends HttpServlet    //-- Type C.
public class Test004 extends GenericServlet    //-- Type B.
{

    // 객체 직렬화
    private static final long serialVersionUID = 1L;

    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
    {
        // 요청에 대한 응답 처리
        
        // 요청에 대한 응답 방법
        response.setContentType("text/html; charset=UTF-8");
        
        try {
            // 출력 스트림 구성
            PrintWriter out = response.getWriter();
            
            out.println("<html>");
            out.print("<head>");
            out.print("<title>");
            out.print("<Test004.java>");
            out.print("</title>");
            out.print("</head>");

            out.print("<body>");
            out.print("<div>");
            out.print("<h1>");
            out.print("서블릿 관련 실습 및 관찰");
            out.print("</h1>");
            out.print("<hr>");
            out.print("</div>");

            out.print("<div>");
            out.print("<h2>");
            out.print("&lt;GenericServlet 클래스를 이용한 서블릿 실습&gt;");
            out.print("</h2>");
            out.print("</div>");
            
            out.print("</body>");
            out.print("</html>");
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
    }

}
