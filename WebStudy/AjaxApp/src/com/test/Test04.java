/**
 * =====================================================
 *   Test04.java
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
public class Test04 extends HttpServlet
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
        
        // 한글깨짐 방지 처리
        request.setCharacterEncoding("UTF-8");
        
        // 이전 페이지(→ AjaxTest04.jsp)로부터 넘어온 데이터 수신
        //-- addr(→ 한글 동 이름)
        String addr = request.getParameter("addr");
        //-- 서교 or 망원 or 역삼 or etc....
        
        System.out.println(">>> addr: " + addr);
        
        // ※ 여기서도 앞에서 처리했던 실습 내용과 마찬가지로
        // 
        // 대신 직접 자료구조 구성
        ArrayList<ZipCodeDTO> list = new ArrayList<>();
        
        if (addr.indexOf("합정") > -1) {
            list.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로 2 (합정동)"));
            list.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로 10 (합정동)"));
            list.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로 16 (합정동)"));
            list.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로 16-2 (합정동, 한강그린2차아파트)"));
            list.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로 16-5 (합정동)"));
            list.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로 16-6 (합정동, 동광팰리스)"));
            list.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로 16-13 (합정동, 한강빌)"));
            list.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로 16-14 (합정동, 동인리버빌(가동)) 가동"));
            list.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로 16-18 (합정동, 동인리버빌(나동)) 나동"));
            list.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로 20 (합정동)"));
            list.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로 20-1 (합정동, 동인리버빌(3차))"));
            list.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로 22 (합정동)"));
        } else if (addr.indexOf("망원") > -1) {
            list.add(new ZipCodeDTO("04005", "서울특별시 마포구 동교로 7 (망원동)"));
            list.add(new ZipCodeDTO("04017", "서울특별시 마포구 동교로 23 (망원동)"));
            list.add(new ZipCodeDTO("04017", "서울특별시 마포구 동교로 23-3 (망원동)"));
            list.add(new ZipCodeDTO("04017", "서울특별시 마포구 동교로 23-4 (망원동)"));
            list.add(new ZipCodeDTO("04017", "서울특별시 마포구 동교로 23-5 (망원동)"));
        } else if (addr.indexOf("서교") > -1){
            list.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 13 (서교동)"));
            list.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 17 (서교동, 용성빌딩)"));
            list.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 18 (서교동)"));
            list.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 20 (서교동)"));
            list.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 21 (서교동)"));
            list.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 21-3 (서교동)"));
            list.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 21-4 (서교동)"));
            list.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 21-6 (서교동)"));
            list.add(new ZipCodeDTO("04044", "서울특별시 마포구 독막로3길 23 (서교동)"));
            list.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 24 (서교동)"));
            list.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 24-6 (서교동)"));
            list.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 24-7 (서교동)"));
        }
        
        request.setAttribute("list", list);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/Test04ok.jsp");
        dispatcher.forward(request, response);
    }

}
