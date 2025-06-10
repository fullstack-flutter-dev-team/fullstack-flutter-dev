/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- BigDecimal 클래스
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/// @see [BigDecimal](https://docs.oracle.com/javase/8/docs/api/java/math/BigDecimal.html) 

/*
	○ 
	
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.math.BigDecimal;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test137  // extends Object
{
	public static void main(String[] args)
	{
		BigDecimal a = new BigDecimal("123456789.123456789");
		
		// movePointLeft() : 소수점을 왼쪽으로 이동
		BigDecimal b = a.movePointLeft(3);
		System.out.println("처리 결과 : " + b);
		//--==>> 처리 결과 : 123456.789123456789
		
		// 나눗셈 연산
		BigDecimal c = a.divide(b);
		System.out.println("처리 결과 : " + c);
		//--==>> 처리 결과 : 1E+3
		//                  -----
		//                 → e 표기법
		
		BigDecimal d = a.divide(b, BigDecimal.ROUND_DOWN);	//-- 반올림을 하지 않는다. → 절삭
		System.out.println("처리 결과 : " + d);			//  (API → 대체 속성 확인)
		//--==>> 처리 결과 : 1000.000000000
		
		// BigInteger 객체로 변환
		System.out.println("처리 결과 : " + a.toBigInteger());	//-- toXXXX 변환하는 메서드
		//--==>> 처리 결과 : 123456789
	}
	
}