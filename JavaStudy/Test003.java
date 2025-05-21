/*=====================================
	■■■ 자바 기본 프로그래밍 ■■■
	- 변수와 자료형
======================================*/
public class Test003
{
	public static void main(String[] args)
	{
		// 변수 선언
		int a;
		
		// 변수 a에 10 대입(변수 초기화)
		a = 10;
		
		// 변수 선언과 동시에 초기화(선언과 대입을 한 번에 처리)
		int b = 20;
		
		a = 30;
		
		// 변수 선언
		int c;
		
		// 테스트 및 확인
		System.out.println("a:" + a);
		System.out.println("b:" + b);
		//System.out.println("c:" + c);
		//--===>> 에러 발생(컴파일 에러)
		
		// 연산 및 처리
		c = a + b;
		// c = 30 + b
		// c = 30 + 20
		// c = 50
		
		// 확인
		System.out.println("c:" + c);
		//-==>> 50
		
		// 변수 a, b, c 값 확인
		System.out.println("a = " + a);
		System.out.println("b = " + b);
		System.out.println("c = " + c);
		
		// 32 20 50
		// System.out.println(a b c);
		// --==>> 에러 발생(컴파일 에러)
		
		System.out.println(a + ' '); // + b + ' ' + c);
		System.out.println(a + " " + b + " " + c);
		//System.out.println(30 + " " + b + " " + c);
		//System.out.println("30 " + b + " " + c);
		//System.out.println("30 " + 20 + " " + c);
		//System.out.println("30 20 " + c);
		//System.out.println("30 20 50");
		// --==>> 30 20 50
		
		// a 의 값은 30입니다.
		// b 의 값은 20입니다.
		// c 의 값은 50입니다.
		System.out.println("a 의 값은 " + a + "입니다.");
		System.out.println("b 의 값은 " + b + "입니다.");
		System.out.println("c 의 값은 " + c + "입니다.");
		
		// 결과 출력
		/*
			a 의 값은 30입니다.
			b 의 값은 20입니다.
			c 의 값은 50입니다.
		*/
		
		// ※ 덧셈 연산자(+)를 사용하는 과정에서
		//		피연산자 중 문자열이 포함되어 있을 경우
		//		문자열 결합 연산자로 활용되며,
		//		처리의 최종 결과는 문자열 형태로 반환된다.
		
		// 추가 관찰
		System.out.println(1 + 2);// -- 산술 연산자 +
		//--==>> 3
		
		System.out.println("1" + 2);//-- 문자열 결합연산자 +
		//--==>> 12
		
		System.out.println(1 + "2");//-- 문자열 결합연산자 +
		//--==>> 12
		
		System.out.println("1 + 2");//-- 문자열 +
		//-->> 1 + 2
				
		
		// ※ 덧셈 연산자(+)
		// 피연산자 중 어느 하나라도 문자열 형태의 데이터가 존재한다면,
		// 산술연산자로써의 기능을 수행하는 것이 아니라
		// 문자열 결합 연산자로써의 기능을 수행하게 된다.
		// "1" → 문자열
		// '1'
		// 1
		// 1.0
		
	}
	
	
}