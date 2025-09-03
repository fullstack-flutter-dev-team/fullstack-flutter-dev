/**
 * ==========================================
 *  MVCTest02Model.java
 *   - Model 역활을 수행할 클래스
 *   - 비즈니스 로직 처리
 */
package com.test;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author sist
 *
 */
public class MVCTest02Model
{
    
    public String actionCount(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        
        // 업무 구성(처리)
        //-- 1 부터 100 까지의 수를 객체(컬렉션)에 저장하는 과정
        List<String> list = new ArrayList<String>();
        
        int i = 1;
        while (i<=100) {
            list.add(String.valueOf(i++));
        }
        
        
        request.setAttribute("modelActionResult", list);
        
        result = "WEB-INF/view/MVCTest02.jsp";
        
        return result;
    }

}
