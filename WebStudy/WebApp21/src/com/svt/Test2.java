/**
 * 
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
public class Test2 extends HttpServlet
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
        System.out.println("\u001B[31m>>> doPost");
        doGetPost(request, response);
    }
    protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // 서블릿 관련 코드 구성
        // 이전 페이지로()부터 넘어온 데이터 수신
        //-> name, age
        
        System.out.println(">>> doGetPost");
        
        // 한글깨짐 방지 (인코딩 처리)
        request.setCharacterEncoding("utf-8");
        
        // 데이터 수신
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        
        // 특정 로직에 따른 업무 처리
        String str = "이름은 " + name + " 이며, 나이는 " + age + "세 입니다.";

        // 처리한 업무로 직접 서비스 구성
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        pw.println("<html>");
        pw.println("<head>");
        pw.println("<meta charset='UTF-8'>");
        pw.println("<title>Test1.java</title>");
        pw.println("</head>");
        pw.println("<body>");
        pw.println("<div>");
//        pw.printf("<h1>이름은 %s 이며, 나이는 %s세 입니다.</h1>",name, age);
        pw.println("<h1>결과확인</h1>");
        pw.println("<h2>"+ str +"</h2>");
        pw.println("</div>");
        pw.println("</body>");
        pw.println("</html>");
        
        
    }

}
