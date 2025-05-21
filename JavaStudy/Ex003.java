/*=====================================
	■■■ 자바 기본 프로그래밍 ■■■
	- 변수와 자료형
======================================*/
public class Ex003
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
	}
	
	
}