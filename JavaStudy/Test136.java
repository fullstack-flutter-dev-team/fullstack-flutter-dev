/*========================================================================
	■■■ 자바의 주요(중요) 클래스 ■■■
	- BigInteger 클래스
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/// @see [Package java.lang](https://docs.oracle.com/javase/8/docs/api/java/lang/package-summary.html) 
/// @see [Class BigInteger](https://docs.oracle.com/javase/8/docs/api/java/math/BigInteger.html)

/*
	○ 
	
*/


// package default;

//import java.lang.*;
// (→ import java.lang.Object;)

import java.math.BigInteger;

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test136  // extends Object
{
	public static void main(String[] args)
	{
		// 불가능
		//int a1 = 123456789123456789;
		//System.out.println(a1);
		//--==>> Test136.java:25: error: integer number too large: 123456789123456789
		
		// 불가능
		//long b1 = 123456789123456789;
		//System.out.println(a1);
		//--==>> Test136.java:29: error: integer number too large: 123456789123456789
		
		// 가능
		//long c1 = 123456789123456789L;
		//System.out.println(c1);
		//--==>> 123456789123456789
		
		// 불가능
		//long d1 = 123456789123456789123456789L;
		//System.out.println(d1);
		//--==>> Test136.java:40: error: integer number too large: 123456789123456789123456789
		
		
		//-- 큰 수의 값을 저장할 정수형 변수가 없어 "123456789123456789"와 같이 String형으로 전달
		BigInteger  a = new BigInteger("123456789123456789");
		BigInteger  b = new BigInteger("123456789123456789");
		
		
		//BigInteger c = a + b;
		//--==>> Test136.java:51: error: bad operand types for binary operator '+'
		
		
		// 더하기
		BigInteger c = a.add(b);
		System.out.println("덧셈 결과 : " + c);
		
		// 빼기
		BigInteger d = a.subtract(b);
		System.out.println("빼기 결과 : " + d);
		
		// 곱하기
		BigInteger e = a.multiply(b);
		System.out.println("곱하기 결과 : " + e);
		
		// 나누기
		BigInteger f = a.divide(b);
		System.out.println("나누기 결과 : " + f);
		
		
		// 지수승
		BigInteger g = new BigInteger("2");
		System.out.println("지수승 결과 : " + g.pow(3));
		//--
		//덧셈 결과 : 246913578246913578
		//빼기 결과 : 0
		//곱하기 결과 : 15241578780673678515622620750190521
		//나누기 결과 : 1
		//지수승 결과 : 8		
	}
	
}