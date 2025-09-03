/**
 * =====================================================
 *   MVCTest01.java
 * =====================================================
 */
package com.svt;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author sist
 *
 */
public class MVCTest01 extends HttpServlet
{

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
        
        // 업무 구성(처리)
        //-- 1 부터 100까지 수를 객체(컬렉션)에 저장하는 과정
        ArrayList<String> list = new ArrayList<String>();
        for (int i =1; i<=100 ; i++) {   //-- i: 1 ~ 100
//            list.add(String.format("%d", i));
            list.add(String.valueOf(i));
        }
        
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("name", "홍길동");
        map.put("tel", "010-1234-5678");
        
        request.setAttribute("list", list);
        request.setAttribute("map", map);
        
        // 뷰(View →  MVCTest01.jsp)에 제어권 넘김
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/MVCTest01.jsp");
        rd.forward(request, response);
    }

}
