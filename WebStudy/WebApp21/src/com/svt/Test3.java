/**
 * 
 */
package com.svt;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author sist
 *
 */
public class Test3 extends HttpServlet
{
    public static final String COLOR_BLACK    = "\u001B[30m" ;
    public static final String COLOR_RED      = "\u001B[31m" ;
    public static final String COLOR_GREEN    = "\u001B[32m" ;
    public static final String COLOR_YELLOW   = "\u001B[33m" ;
    public static final String COLOR_BLUE     = "\u001B[34m" ;
    public static final String COLOR_PURPLE   = "\u001B[35m" ;
    public static final String COLOR_CYAN     = "\u001B[36m" ;
    public static final String COLOR_WHITE    = "\u001B[37m" ;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println(COLOR_CYAN + ">>> doGet");
        doGetPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println(COLOR_BLUE + ">>> doPost");
        doGetPost(request, response);
    }
    @SuppressWarnings("deprecation")
    protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // 서블릿 관련 코드 구성
        // 이전 페이지로(→ Test3.jsp)부터 넘어온 데이터 수신
        // → name, age
        
        System.out.println(COLOR_GREEN + ">>> doGetPost");
        
        // 한글깨짐 방지 (인코딩 처리)
        request.setCharacterEncoding("utf-8");
        
        // 데이터 수신
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        
        // 특정 로직에 따른 업무 처리
        String str = "이름은 " + name + " 이며, 나이는 " + age + "세 입니다.";
        
        // 처리한 업무 넘기기
        request.setAttribute("result", str);
        //-- 포워딩하는 페이지에 값을 넘기기 위한 준비(설정)
        //   즉, str값을 result라는 이름으로 Test3_ok.jsp 페이지로 넘길 준비.
        
        // 포워딩~!!!
        RequestDispatcher rd = request.getRequestDispatcher("/Test3_ok.jsp");
        rd.forward(request, response);
        
        // redirecting
//        String cp = request.getContextPath();
//        String param = URLEncoder.encode(str, "UTF-8");
//        response.sendRedirect(cp + "/Test3_ok.jsp?param="+param);
    }

}
