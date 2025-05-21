/*===================================================================
	■■■ 연산자(Operator) ■■■
		- 논리 연산자
===================================================================*/

public class Test025
{
	public static void main(String[] args)
	{
		// 변수 선언 및 초기화
		boolean a = true, b= false;
		
		
		// 출력
		System.out.printf("a && b : %b%n", (a && b));
		System.out.printf("a || b : %b%n", (a || b));
		System.out.printf("!a : %b%n", !a);
		System.out.printf("!b : %b%n", !b);
		//--결과 출력
		//a && b : false
		//a || b : true
		//!a : false
		//!b : true
	}
}