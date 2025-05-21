/*=======================================
	■■■ 변수와 자료형 ■■■
	- 형 변환 / 접미사 활용
=======================================*/

public class Test006
{
	public static void main(String[] args)
	{
		int a;
		a = 10;
		System.out.println("a 의 결과 : " + a);
		//→ a 의 결과 : 10
		
		int b = 20;
		System.out.println("b 의 결과 : " + b);
		//→ b 의 결과 : 20
		
		// 형 변환
		short c;
		//c = a; // 컴파일 타임 에러 발생
		//→ 에러 발생(컴파일 에러)
		//-- 기본적으로 자료형이 작은 것에 큰 것을 담아내지 못한다.
		//	(→ 자동 형 변환 규칙 위반~!!)
		
		//명시적인 형 변환(강제 형 변환)
		c = (short)a;
		
		//	00000000 00000000 00000000 00001010   → int 형 변수 a 에 담겨있는 10
		//				↓ (형 변환)
		//					  00000000 00001010   → short형 10
		
		System.out.println("c 의 결과 : " + c);
		//→ c 의 결과 : 10
		
		// 변수 선언 및 초기화
		//int d = 10000000000; // 백억
		//→ 에러 발생(컴파일 에러), Test006.java:37: error: integer number too large: 10000000000
		
		//long d = 10000000000; // 백억
		//→ 에러 발생(컴파일 에러),Test006.java:40: error: integer number too large: 10000000000
		
		//long d = 10000000000l; // 백억
		long d = 10000000000L; // 백억
		//-- 접미사 『L』 이 중요하다.
		// long 형은 숫자(상수) 뒤에 『L』 또는 『l』 을 붙여
		//상수를 표현해야 한다.
		//	즉, 약 21억의 범위를 넘어서는 정수 형태의 상수에는
		//	데이터 뒤에 접미사를 꼭 붙여서 처리해줄 수 있도록 한다.
		
		System.out.println("d 의 결과 : " + d);
		//→ d 의 결과 : 10000000000
		
		// 변수 선언 및 초기화
		int e = 030;
		//-- 접두사 0 → 8진수를 의미
		
		System.out.println("e 의 결과 : " + e);
		//→ e 의 결과 : 24
		
		// 변수 선언 및 초기화
		int f = 0xa6;
		//-- 접두사 0x → 16진수를 의미

		System.out.println("f 의 결과 : " + f);
		//→ f 의 결과 : 166
		// 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		//                      a  b  c  d  e  f
		
		// 변수 선언 및 초기화
		//float g = 0; //→ g 의 결과 : 0.0
		//float g = 0.0; // 자바에서 실수 기본형은 double, 컴파일 에러 발생(Test006.java:72: error: incompatible types: possible lossy conversion from double to float)
		float g = 0.0f;
		//-- 『F』 또는 『f』
		
		// 실행 결과
		/*
			a 의 결과 : 10
			b 의 결과 : 20
			c 의 결과 : 10
			d 의 결과 : 10000000000
			e 의 결과 : 24
			f 의 결과 : 166
			g 의 결과 : 0.0
		*/
		
		System.out.println("g 의 결과 : " + g);
	}
}