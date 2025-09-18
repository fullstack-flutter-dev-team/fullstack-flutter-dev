/**
 * ============================================
 *  CalculatorImpl.java
 *   - 클래스
 *   - Calculator 인터페이스를 구현하는 클래스
 *   - 주 업무(core concern)만 적용된 형태로 구성
 * ============================================
 */

package com.test.spr;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StopWatch;

public class CalculatorImpl implements Calculator
{
    // ※ 인터페이스로부터 상속받은 메소드 재정의를 통해
    //    주 업무(core concern) 진행(수행)을 위한 메서드 구현

    @Override
    public int add(int x, int y)
    {
        // 반환할 결과값
        int result = 0 ;
        
        // -----------[예외 발생]---------------------------------------
        // ※ 주 업무(core concern)를 수행하는 과정에서 예외가 발생할 수 있는 상황을 만들기 위해
        //    예외 객체를 생성하여 처리할 수 있도록 구성.
        //    - try ~ catch ~ finally : 예외 발생 시 자체적으로 처리
        //    - throws                : 예외 발생 시 자신을 호출한 객체에 예외를 던지는(넘기는) 처리
        //    - throw                 : 예외를 인위적으로 발생시키는 처리
        
        if (x > 100 || y > 100) {
            throw new IllegalArgumentException("100보다 큰 인자를 전달한 예외 발생~!!!");
        }
        
        // --------------------------------------------------
        
        // 주 업무(core concern) 실행 내용
        result = x + y;
        System.out.printf("%d + %d = %d%n", x, y, result); //-- 콘솔 창에 검정색 글씨로 확인됨
     
        // 최종 결과값 반환
        return result;
    }

    @Override
    public int sub(int x, int y)
    {
        // 반환할 결과값
        int result = 0 ;
        
        // 주 업무(core concern) 실행 내용
        result = x - y;
        
        System.out.printf("%d - %d = %d%n", x, y, result);
        
        // 최종 결과값 반환
        return result;
    }

    @Override
    public int multi(int x, int y)
    {
        // 반환할 결과값
        int result = 0 ;

        // 주 업무(core concern) 실행 내용
        result = x * y;
        
        System.out.printf("%d * %d = %d%n", x, y, result);
        
        // 최종 결과값 반환
        return result;
    }

    @Override
    public int div(int x, int y)
    {
        // 반환할 결과값
        int result = 0 ;
        
        // 주 업무(core concern) 실행 내용
        result = x / y;
        
        System.out.printf("%d / %d = %d%n", x, y, result);
        
        // 최종 결과값 반환
        return result;
    }

}
