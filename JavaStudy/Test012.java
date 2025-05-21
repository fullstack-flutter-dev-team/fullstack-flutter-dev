/*===================================================================
	■■■ 자바의 개요 및 특징 ■■■
		- 변수와 자료형
		- 자바 기본 입출력 : BufferedReader 클래스 활용
===================================================================*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test012
{
	// 프로그램의 시작과 끝
	public static void main(String[] args) throws IOException
	{
		// 키보드 장착(생성)
		//→ BufferedReader 클래스 기반의 인스턴스(객체) 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		//-------------------------------------
		//	문자 입력을 읽어들이는 장치
		//										--------------------
		//										번역하는 장치
		//										바이트 → 문자(번역)
		//															------------
		//															바이트 입력값
		
		// 주요 변수 선언 및 초기화
		int r;						//--반지름(r)
		final double PI = 3.141593;	//--원주율(π) → 변수의 상수화 『final』
		double a, b;				//--원의 넓이(a), 원의 둘레(b)
		
		
		// 연산 및 처리
		// ① 사용자에게 안내 메시지 출력
		//System.out.println("원의 반지름 입력: ");
		System.out.print("원의 반지름 입력: ");
		
		// ② 사용자가 입력한 값을 받아서 반지름 변수 r 에 담아내기
		// r = br.readLine();	//--BufferedReader 의 『readLine()』
		//						//  → 입력 대기열(입력 완료 될때까지 대기)에 남아있는 문자열 반환
		// r = "234";
		
		// Integer.parseInt("234");			// →  234
		// Integer.parseInt("90");			// → 90
		// Integer.parseInt("이동건");		// → 에러 발생
		// 『Integer.parseInt()』
		//-- 매개변수로 넘겨받은 문자열 데이터를 정수형으로 변환
		//	단, 이 때 넘겨받은 문자열 데이터는 숫자 모양(형태) 이어야 한다.  → Number format
		
		
		// 원의 반지름 입력 : 234
		//r = Integer.parseInt(br.readLine());
		//---------- JAVA Compile ----------
		//Test012.java:51: error: incompatible types: int cannot be converted to String
		//		r = Integer.parseInt(br.read());
		//									^
		//Note: Some messages have been simplified; recompile with -Xdiags:verbose to get full output
		//1 error
		
		// 추가
		// import java.io.IOException;
		// throws IOException
		
		
		// 원의 반지름 입력 : 234
		r = Integer.parseInt(br.readLine());
		//System.out.println("r : " + r);
		// r =Integer.parseInt("234");
		// r = 234;
		
		
		//-- 사용자가 입력한 값을 br 즉,  BufferedReader의 readLine()
		//		메소드를 활용하여 문자열 형태로 읽어들인 후
		//		그 값을 Integer.parseInt() 를 통해 정수혀응로 변환한 후
		//		정수 형태의 반지름 변수 r 에 담아내는 과정을 수행
		
		// 넓이 및 둘레 계산
		//		연산 결과를 각각 변수 a 와 b 에 담아내기
		a = PI * r * r; // 원의 넓이
		b = 2 * PI * r;	// 원의 둘레
		
		// 최종 결과 출력
		// 변수 a 와 b 에 담겨있는 값 출력
		System.out.println(">> 넓이 : " + a);
		System.out.println(">> 둘레 : " + b);
		//원의 반지름 입력: 42
		//>> 넓이 : 5541.770051999999
		//>> 둘레 : 263.89381199999997
		//계속하려면 아무 키나 누르십시오 . . .
		
		
		// 원의 반지름 입력: 42
		// >> 반지름이 42인 원의 넓이는 5541.77 이며,
		// >> 반지름이 42인 원의 둘레는 263.89 이다.
		// 계속하려면 아무 키나 누르십시오 . . .
		System.out.printf(">> 반지름이 %d인 원의 넓이는 %.2f\n", r, a);
		System.out.printf(">> 반지름이 %d인 원의 둘레는 %.2f\n", r, b);
		//>> 반지름이 42인 원의 넓이는 5541.77
		//>> 반지름이 42인 원의 둘레는 263.89
		//계속하려면 아무 키나 누르십시오 . . .

	}
}