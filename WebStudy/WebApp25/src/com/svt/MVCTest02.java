/**
 * =====================================================
 *   MVCTest2.java
 *    - 
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

import com.test.MVCTest02Model;

/**
 * @author sist
 *
 */
public class MVCTest02 extends HttpServlet
{

    /**
     * 
     */
    private static final long serialVersionUID = -5495208441995710933L;

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
        
        // 모델 객체 생성 및 액션 처리  → 모델이 처리한 결과 수신(+ View 추천 → View 페이지 정보 획득)
        MVCTest02Model model = new MVCTest02Model();
        String view = model.actionCount(request, response);
        
        // ...
        // ........
        
        // view = 
        
        // 뷰(View →  MVCTest01.jsp)에 제어권 넘김
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

}
