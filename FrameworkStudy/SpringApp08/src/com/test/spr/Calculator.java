/**
 * ======================================
 *  Calculator.java
      - 인터페이스
 * =======================================
 */

package com.test.spr;


// ※ 스프링에서 AOP 기법을 적용하기 위해서는
//    대상 객체가 인터페이스를 구현하고 있어야 한다.


public interface Calculator
{
    // 주 업무(core concern) 진행을 위한 메소드 선언 → 추상 메소드
    //-- 덧셈, 뺄셈, 곱셈, 나눗셈
    public int add(int x, int y);
    public int sub(int x, int y);
    public int multi(int x, int y);
    public int div(int x, int y);   //-- 실습 편의상 정수형 처리
    //-- 가이드 라인 제시

}
