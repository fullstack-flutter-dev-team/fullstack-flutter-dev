/**
 * ============================================
 *   Main.java
 *    - 클래스
 *    - main() 메서드가 포함된 테스트 클래스
 * ============================================
 */

package com.test.spr;

import java.lang.reflect.Proxy;

public class Main
{

    public static void main(String[] args)
    {
        // 주 업무(core concern)만 실행을 할 수 있는 객체 준비
        //
        // 인터페이스 변수 = new 인터페이스구현클래스();
        // List list = new ArrayList();
        // Calculator cal = new Calculator();
        Calculator calTarget = new CalculatorImpl();
        
        //-------------------------[Proxy : Start]------------------------------
        // 주 업무(core concern) 실행에 대한 테스트 → AOP 기법 적용 후
        //-- static 메소드 newProxyInstance()
        //-- proxy 기반으로 새로운 proxy 라는 인스턴스를 만들어 내는 것 (007 상자 툴킷...)
        //-- 진짜 행세를 하기 위해서 대상과 그 대상에게 속성을 물려준 인터페이스들의 정보를 요구
        
        //-- 오브젝트 타입 다운캐스팅
        // Proxy.newProxyInstance(loader, ingerface, h);
        // Proxy.newProxyInstance(ⓐ, ⓑ, ⓒ);
        //-- ⓐ : 주 업무 실행 클래스에 대한 정보 전달(제공)
        //-- ⓑ : 주 업무 실행 클래스의 인터페이스들에 대한 정보 전달(제공) 
        //-- ⓒ : 보조 업무 실행 클래스에 대한 정보 전달(제공)
        Calculator cal = (Calculator)Proxy.newProxyInstance(
                          calTarget.getClass().getClassLoader() // 주 업무 실행 클래스에 대한 정보 전달(제공)
                        , calTarget.getClass().getInterfaces()  // 주 업무 객체(대상) / 설계도 / 클래스가 implements 하고있는 인터페이스(들) 정보를 읽어오는 스캐너
                        , new CalculatorProxy(calTarget));      // 보조 업무 실행 클래스에 대한 정보 전달(제공)
        
        
        //-------------------------[Proxy : End]------------------------------
        
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
