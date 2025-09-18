/**
 * ============================================
 *   Main.java
 *    - 클래스
 *    - main() 메서드가 포함된 테스트 클래스
 * ============================================
 */

package com.test.spr;

public class Main
{

    public static void main(String[] args)
    {
        // 주 업무(core concern) 실행을 할 수 있는 객체 준비
        //-- 보조 업무(cross-cutting concern)와 밀접하게 결합되어 있는 주 업무(core concern)
        //
        // 인터페이스 변수 = new 인터페이스구현클래스();
        // List list = new ArrayList();
        // Calculator cal = new Calculator();
        Calculator cal = new CalculatorImpl();
        
        // 메서드 호출을 통해 업무 실행 테스트
        int add = cal.add(10,20);
        System.out.println(add);
        
        int sub = cal.sub(10,20);
        System.out.println(sub);
        
        int multi = cal.multi(10, 20);
        System.out.println(multi);
        
        int div = cal.div(10, 20);
        System.out.println(div);

    }

}
