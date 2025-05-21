/*===================================================================
	■■■ 변수와 자료형 ■■■
	- 변수와 자료형 실습 및 테스트 : boolean ( 1-바이트 논리형)
===================================================================*/
public class Test007
{
	public static void main(String[] args)
	{
		//  주요 변수 선언
		boolean a = true; // boolean a = "true"; --❌
		boolean b;
		
		int c = 10, d = 5;
		
		
		// 연산 및 처리
		//b = c + d; // 컴파일 에러 발생(Test007.java:17: error: incompatible types: int cannot be converted to boolean)
		b = c > d;
		b = 10 > d;
		b = 10 > 5;
		b = true;
		
		b = c < d;
		b = 10 < d;
		b = 10 < 5;
		b = false;
		
		
		// 결과 출력
		System.out.println("a : " + a);
		System.out.println("b : " + b);
		
		// 실행 결과
		/*
			a : true
			b : false
		*/
		
	}
}