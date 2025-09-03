/**
 *  ===========================================
 *    HelloReceive03Model.java
 *  ===========================================
 */
package com.test;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author sist
 *
 */
public class HelloReceive03Model
{
    public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String result = "";
        
        request.setCharacterEncoding("UTF-8");
        //-- 일반클래스에서는 실제 인코딩 방식을 지정하는 것은,
        //-- 해당 방식을 지원하지 않는 상태일 수 있기 때문에
        //-- UnsupportedEncodingException 예외가 발생한다.

        // 데이터 수신
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        
        // 필요한, 추가적인 업무처리 가능
        firstName = "☆ " + firstName + " ☆";
        lastName = "♥ " + lastName + " ♥";
        
        // 데이터 전달
        request.setAttribute("fName", firstName);
        request.setAttribute("lName", lastName);
        
        // 상황에 따른 뷰 선택(지정) 가능
        result = "WEB-INF/view/HelloReceive03.jsp";
        
        return result;
    }
}
