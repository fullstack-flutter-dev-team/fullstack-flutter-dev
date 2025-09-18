/**
 * ============================================
 *  CalculatorAspect.java
 *   - 클래스
 *   - 보조 업무 수행 클래스
 *   - 보조 업무 적용 및 주 업무 호출 구조
 * ============================================
 */

package com.test.spr;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StopWatch;

// ※ Spring AOP Proxy 클래스를 설계하기(만들기) 위해서
//    MethodInterceptor 인터페이스를 구현하는 클래스로 설계한다.

public class CalculatorAspect implements MethodInterceptor
{

    // MethodInterceptor 인터페이스의 invoke() 메서드 재정의

    @Override
    //public Object invoke(MethodInvocation arg0) throws Throwable
    public Object invoke(MethodInvocation method) throws Throwable
    {
        Object result = null;
        
        //--------------------------[보조업무: Start]---------------------------
        // 보조 업무(cross-cutting concern) 설정
        //-- 연산 과정에서 소요된 시간 측정 및 로그 기록 작성
        Log log = LogFactory.getLog(this.getClass());      //-- 로그 구성 객체
        StopWatch sw = new StopWatch();                    //-- 스톱워치 객체
        log.info("처리 시간 측정 시작 ===============");   //-- 로그 기록(콘솔 창에 빨간색 글씨로 확인됨)
        sw.start();                                        //-- 스톱워치 시작버튼 딸깍~!!!
        //-------------------------------------------------------------------
        
        
        // 주 업무(core concern) 실행 내용
        result = method.proceed();
        
        
        //--------------------------[보조업무: Start]---------------------------
        // 보조 업무 (cross-cutting concern) 처리
        sw.stop();                                         //-- 스톱워치 멈춤버튼 딸깍~!!!
        log.info("처리 시간 측정 종료 ===============");   //-- 로그 기록
        log.info(String.format("경과 시간 : %s/1000초", sw.getTotalTimeMillis()));
        //-------------------------------------------------------------------
        
        return result;
    }

}
