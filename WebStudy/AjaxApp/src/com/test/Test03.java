/**
 * =====================================================
 *   Test03.java
 * =====================================================
 */
package com.test;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author sist
 *
 */
public class Test03 extends HttpServlet
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
        String COLOR_GREEN    = "\u001B[32m" ;
        
        // 이전 페이지로부터 넘어온 데이터 수신
        // id
        String id = request.getParameter("id");
        System.out.println(COLOR_GREEN + ">>> id:" + id);
        int result = 0;
        
        
        // id가 hgd일 경우...
        // Model -> DB액션 처리 요청 -> DAO(처리 요청)
        //                            -----------------
        //                             DTO, Connection 활용
        // ->  SELECT COUNT(*) AS COUNT FROM MEMBER WHERE ID ='hgd'
        //            ----------------
        //              수신 처리
        //              → 1 or 0
        
        // * DB 구성을 별도로 하지 않았기 때문에 컬렉션 자료구조로 대신함~!!!
        
        ArrayList<String> db = new ArrayList<String>();
        db.add("superman");
        db.add("batman");
        db.add("admin");
        
        // 수신한 데이터와 이미 존재하는 아이디를 비교하는 과정 수행~!!!
        //  -> 1 or 0
        for (String strId : db) {
            if (strId.equals(id)) {
                result++;
                break;
            }
        }
        
        
        // 최종 result 에 1 이 남아있으면... 이미 존재하는 id → 사용 불가
        // result 에 0 이 계속 남아있으면... 존재하지 않는 id → 사용 가능
        
        // 이 최종 result 값을 반환하기 위해 조각 데이터를 view 에 넘긴다.
        request.setAttribute("result", result);
        
        // 뷰 구성
        String view = "WEB-INF/view/Test03_ok.jsp";
        
        // 요청 내용 전달
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }

}
