/*=====================================
	■■■ 자바의 개요 및 특징 ■■■
	- 변수와 자료형
	- 키워드 및 식별자
	- printf()
=====================================*/

public class Test005
{
	public static void main(String[] args)
	{
		//변수 선언(메모리 확보) 및 초기화(메모리 값 할당)
		//int a = 10;
		//int b = 5;
		int a = 10, b = 5;
		
		//변수 선언
		int c, d;
		
		// 연산 및 처리
		c = a + b; // a + b 의 결과값을 변수 c 에 대입하라.
		d = a - b; // a - b 의 결과값을 변수 d 에 대입하라.
		
		
		//결과 출력
		//→ 『10 + 5 = 15』의 형태....
		System.out.println(a + " + " + b + " = " + c);
		//                 숫자 문자열 숫자 문자열 숫자		 
		//--===>> 10 + 5 = 15
		//-- 자바에서는 서로 다른 자료형의 데이터들끼리도
		//	별도의 변환 과정 없이 『+』 연산이 가능하며,
		//	다른 어떤 자료형과 문자열 데이터 『+』 연산 결과는 문자열.
		//	즉, 문자열 결합 연산자로써 『+』
		
		// print() / println() / printf() / format()
		System.out.println("abcd");
		System.out.print("1234\n");
		//--==>> abcd
		//		1234
		
		// ※ 문자열 영역 안에서 사용되는 『"\n"』 은 개행!!!
		
		System.out.print("1\n2\n3\n4\n");
		/*
		1
		2
		3
		4
		*/
		
		// printf() / format()
		// -- JDK 1.5 부터 지원되는 메서드
		//System.out.printf("○ + ○ = ○", 10, 20, 30); // 개행(줄바꿈) 기능이 없음
		//System.out.printf("○ + ○ = ○\n", 10, 20, 30);
		//-- "○ + ○ = ○" 을 템플릿으로 간주하면 됨
		System.out.printf("%d + %d = %d\n", 10, 20, 30);// 개행(\n) 추가 -- 『"\n"』 개행
		//→ 10 + 20 = 30
		System.out.printf("%d + %d = %d%n", 10, 20, 30);// 『"%n"』 도 개행 기능
		//→ 10 + 20 = 30
		
		System.out.printf("%d + %d = %d%n", a, b, c);
		//→ 10 + 5 = 15
		
		// "○ 과 ○"  → 10 20
		// 출력 후 개행
		//System.out.printf("○ 과 ○", 10, 20);
		//System.out.printf("○ 과 ○%n", 10, 20);
		System.out.printf("%d 과 %d%n", 10, 20);
		
		// "○ 과 ○"  → 10 3.14
		// 출력 후 개행
		//System.out.printf("○ 과 ○%n", 10, 3.14);
		//System.out.printf("%d 과 %d%n", 10, 3.14); // 런타임 에러 발생(10 과 Exception in thread "main" java.util.IllegalFormatConversionException: d != java.lang.Double)
		
		// "○ 과 △"  → 10 3.14
		// 출력 후 개행
		//System.out.printf("○ 과 △%n", 10, 3.14);
		System.out.printf("%d 과 %f%n", 10, 3.14);
		//→ 10 과 3.140000
		//--  『%d』 → 정수형 서식 지정 옵션
		//--  『%f』 → 실수형 서식 지정 옵션
		System.out.printf("%d 과 %.2f%n", 10, 3.14);
		//→ 10 과 3.14
		//--  『%.2f』 → 소수점 이하 두 번째 자리까지 표현
		
		System.out.printf("%f\n", 3.141592);
		//→ 3.141592
		
		System.out.printf("%.3f\n", 3.141592);
		//→ 3.142
		//--  『%.3f』 → 소수점 이하 세 번째 자리까지 표현(네 번째 자리에서 반올림 발생)
		
		// 실행 결과
		/*
			10 + 5 = 15
			abcd
			1234
			1
			2
			3
			4
			10 + 20 = 30
			10 + 20 = 30
			10 + 5 = 15
			10 과 20
			10 과 3.140000
			10 과 3.14
			3.141592
			3.142
		*/
	}
}