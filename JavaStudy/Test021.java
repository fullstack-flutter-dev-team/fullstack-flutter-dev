/*===================================================================
	■■■ 연산자(Operator) ■■■
		- 비트 단위 연산자 : 연산 속도가 빠른 장점
===================================================================*/

public class Test021
{
	public static void main(String[] args)
	{
		// 변수 선언 및 초기화
		int a = 10, b = -10;
		
		// 출력
		System.out.printf("~a : %d%n", ~a);
		System.out.printf("~b : %d%n", ~b);
		//--결과
		//~a : -11
		//~b : 9
		
		// a = 10        →     00001010
		//	                      ↓ ~a
		//						11110101 → -11 ? → 11~!!!
		//					+	00001011 → 11
		//					------------
		//					1    00000000 → 0
		//
		// b = -10		→	????????		00001001
		//					↓ ~b		
		//					00001010	→ 10
		//					↓ 1의 보수(비트열 반전)		
		//						   1
		//					11110101
		//				+		   1
		//				----------------
		//					11110110
		
		System.out.println();
		System.out.printf("  a(%d) 의 2진수 표현: %s%n", a, Integer.toBinaryString(a));
		System.out.printf("~a(%d) 의 2진수 표현: %s%n", ~a, Integer.toBinaryString(~a));
		System.out.printf("  b(%d) 의 2진수 표현: %s%n", b, Integer.toBinaryString(b));
		System.out.printf("~b(%d) 의 2진수 표현: %s%n", ~b, Integer.toBinaryString(~b));
	}
}