/*===================================================================
	■■■ 지역변수와 전역변수 ■■■
===================================================================*/

// Test072.java 와 비교~!!!

/*
	※지역 변수는 초기화 과정을 거치지 않으면 사용할 수 없다.
		(→ 즉, 자바가 자동으로 초기화를 수행해 주거나 하지 않는다.)
*/

public class Test073
{
	// 클래스의 영역
	
	
	// 전역(global) 변수 a 선언
	int a;
	//-- ★ 자바가 자동으로 초기화 지원  → int 형 → 0 초기화
	
	boolean b;
	char c;
	double d;
	float f;
	
	public static void main(String[] args)
	{
		// 메서드의 영역
		
		
		// 지역(local) 변수 영역
		int n;
		
		//System.out.println("n : " + n);
		
		//System.out.println("a : " + a);
		//--==>> 에러 발생(컴파일 에러)
		//		Test073.java:31: error: non-static variable a cannot be referenced from a static context
		
		
		// 메모리에 적재
		// Test073 클래스(설계도)를 기반으로 인스턴스(객체) 생성
		Test073 ob = new Test073();
		
		// Test073 클래스 인스턴스 변수 ob
		System.out.println("ob.a (int) : " + ob.a);
		//--==> ob.a : 0
		//--실행 결과
		//ob.a : 0
		//계속하려면 아무 키나 누르십시오 . . .

		System.out.println("ob.b (boolean) : " + ob.b);
		System.out.printf("ob.c (char) : %c , %d\n", ob.c,  (int)ob.d);
		System.out.println("ob.d (double) : " + ob.d);
		System.out.println("ob.f (float) : " + ob.f);
		//-- 실행 결과
		// ob.a (int) : 0
		// ob.b (boolean) : false
		// ob.c (char) :  , 0
		// ob.d (double) : 0.0
		// ob.f (float) : 0.0
		// 계속하려면 아무 키나 누르십시오 . . .		
	}
}