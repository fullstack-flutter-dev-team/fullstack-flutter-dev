/* ============================
 *  Test005.java
 *  - Servlet 실습
 * ============================
 */

// 현재.... 자바의 기본 클래스 Test004
// 이를 Servlet 으로 구성하는 방법


// HttpServlet 을 상속받는 클래스로 설계 → Servlet 구성
package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
//public class Test005 extends HttpServlet     //-- Type C.

public class Test005 extends HttpServlet    //-- Type C.
{
    // 객체 직렬화
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // GET 방식의 요청에 대해 처리하는 코드
//        super.doGet(request, response);
        doGetPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // POST 방식의 요청에 대해 처리하는 코드
//        super.doPost(request, response);
        doGetPost(request, response);
    }
    
    
    // 사용자 정의 메서드
    void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
//        super.doPost(request, response);
        // GET 방식이든 POST 방식이든
        // 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메서드

        // 클라이언트로부터 데이터 수신
        String id = request.getParameter("userId");  // "superman"
        String pw = request.getParameter("userPwd"); // "java007"
    }


}
