/**
 * ============================================
 *  CalculatorImpl.java
 *   - 클래스
 *   - Calculator 인터페이스를 구현하는 클래스
 *   - 주 업무와 보조 업무가 결합되어 있는 형태
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
        
        //--------------------------[보조업무: Start]---------------------------
        // 보조 업무(cross-cutting concern) 설정
        //-- 연산 과정에서 소요된 시간 측정 및 로그 기록 작성
        Log log = LogFactory.getLog(this.getClass());      //-- 로그 구성 객체
        //                          ---- CalculatorImpl을 의미
        StopWatch sw = new StopWatch();                    //-- 스톱워치 객체
        log.info("처리 시간 측정 시작 ---------------");   //-- 로그 기록(콘솔 창에 빨간색 글씨로 확인됨)
        sw.start();                                        //-- 스톱워치 시작버튼 딸깍~!!!
        //-------------------------------------------------------------------
        
        // 주 업무(core concern) 실행 내용
        result = x + y;
        System.out.printf("%d + %d = %d%n", x, y, result); //-- 콘솔 창에 검정색 글씨로 확인됨
     
        //--------------------------[보조업무: Start]---------------------------
        // 보조 업무 (cross-cutting concern) 처리
        sw.stop();                                         //-- 스톱워치 멈춤버튼 딸깍~!!!
        log.info("처리 시간 측정 종료 ---------------");   //-- 로그 기록
        log.info(String.format("경과 시간 : %s/1000초", sw.getTotalTimeMillis()));
        //-------------------------------------------------------------------
        
        // 최종 결과값 반환
        return result;
    }

    @Override
    public int sub(int x, int y)
    {
        // 반환할 결과값
        int result = 0 ;
        
        //--------------------------[보조업무: Start]---------------------------
        // 보조 업무(cross-cutting concern) 설정
        //-- 연산 과정에서 소요된 시간 측정 및 로그 기록 작성
        Log log = LogFactory.getLog(this.getClass());      //-- 로그 구성 객체
        StopWatch sw = new StopWatch();                    //-- 스톱워치 객체
        log.info("처리 시간 측정 시작 ---------------");   //-- 로그 기록(콘솔 창에 빨간색 글씨로 확인됨)
        sw.start();                                        //-- 스톱워치 시작버튼 딸깍~!!!
        
        
        // 주 업무(core concern) 실행 내용
        result = x - y;
        
        System.out.printf("%d - %d = %d%n", x, y, result);
        
        //--------------------------[보조업무: Start]---------------------------
        sw.stop();
        log.info("처리 시간 측정 종료 ---------------");
        log.info(String.format("경과시간 : %s/1000초", sw.getTotalTimeMillis()));
        
        // 최종 결과값 반환
        return result;
    }

    @Override
    public int multi(int x, int y)
    {
        // 반환할 결과값
        int result = 0 ;
        
        //--------------------------[보조업무: Start]---------------------------
        // 보조 업무(cross-cutting concern) 설정
        //-- 연산 과정에서 소요된 시간 측정 및 로그 기록 작성
        Log log = LogFactory.getLog(this.getClass());      //-- 로그 구성 객체
        StopWatch sw = new StopWatch();                    //-- 스톱워치 객체
        log.info("처리 시간 측정 시작 ---------------");   //-- 로그 기록(콘솔 창에 빨간색 글씨로 확인됨)
        sw.start();                                        //-- 스톱워치 시작버튼 딸깍~!!!
        

        // 주 업무(core concern) 실행 내용
        result = x * y;
        
        System.out.printf("%d * %d = %d%n", x, y, result);
        
        //--------------------------[보조업무: Start]---------------------------
        // 보조 업무 (cross-cutting concern) 처리
        sw.stop();                                         //-- 스톱워치 멈춤버튼 딸깍~!!!
        log.info("처리 시간 측정 종료 ---------------");   //-- 로그 기록
        log.info(String.format("경과 시간 : %s/1000초", sw.getTotalTimeMillis()));
        
        // 최종 결과값 반환
        return result;
    }

    @Override
    public int div(int x, int y)
    {
        // 반환할 결과값
        int result = 0 ;
        
        //--------------------------[보조업무: Start]---------------------------
        // 보조 업무(cross-cutting concern) 설정
        //-- 연산 과정에서 소요된 시간 측정 및 로그 기록 작성
        Log log = LogFactory.getLog(this.getClass());      //-- 로그 구성 객체
        StopWatch sw = new StopWatch();                    //-- 스톱워치 객체
        log.info("처리 시간 측정 시작 ---------------");   //-- 로그 기록(콘솔 창에 빨간색 글씨로 확인됨)
        sw.start();                                        //-- 스톱워치 시작버튼 딸깍~!!!
        
        // 주 업무(core concern) 실행 내용
        result = x / y;
        
        System.out.printf("%d / %d = %d%n", x, y, result);
        
        //--------------------------[보조업무: Start]---------------------------
        // 보조 업무 (cross-cutting concern) 처리
        sw.stop();                                         //-- 스톱워치 멈춤버튼 딸깍~!!!
        log.info("처리 시간 측정 종료 ---------------");   //-- 로그 기록
        log.info(String.format("경과 시간 : %s/1000초", sw.getTotalTimeMillis()));
        
        // 최종 결과값 반환
        return result;
    }

}
