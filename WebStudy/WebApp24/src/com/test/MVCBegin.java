/**
 * ====================================
*    MVCBegin.java
 * ====================================
 * 
 */

package com.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author sist
 *
 */
public class MVCBegin extends HttpServlet
{
    /**
     * 
     */
    private static final long serialVersionUID = -5534191825785802902L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGetPost(request, response);
    }

    // 사요
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGetPost(request, response);
    }
    
    protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // 서블릿 관련 코딩
        //-- get 과 post 방식으로 별도로 코딩 가능하나 이러한 경우가 별로 없기 때문에 하나로 구성
        //-- 필요하면 위 두 코드에 따로 작성도 가능
        
        // 필요한 경우 Model 구성하여 로직 수행
        //-- 즉, connection, dao, dto 구성하여 처리
        
        // 데이터 구성(_> 업무처리
        String message = "안녕하세요, MVC 패턴입니다.";
        
        // View 역할을 수행하는 JSP 페이지에 데이터를 전달해야 한다.
    }

}
