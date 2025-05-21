/*===================================================================
	■■■ 자바의 개요 및 특징 ■■■
		- 변수와 자료형
		- 자바 기본 입출력 : BufferedReader 클래스 활용
===================================================================*/
import java.io.BufferedReader;		// BufferedReader 클래스
import java.io.InputStreamReader;	// InputStreamReader 클래스
import java.io.IOException;			// IOException 클래스, IOE 는 축약어

// ○ 삼각형의 밑변의 길이와 높이를 사용자로부터 입력받아
//	이 삼각형의 넓이를 구하는 프로그램을 구현한다.

// 실행 예)
// ■ 삼각형의 넓이 구하는 프로그램 ■ 
// - 삼각형의 밑변 입력 : 30
// - 삼각형의 높이 입력 : 50

// >> 밑변이 30, 높이가 50인 삼각형의 넓이: xxx
// 계속하려면 아무 키나 누르세요....

// ※ 삼각형의 넓이 = 밑변 * 높이 / 2

// ※ 문제 인식 및 분석
//		- 삼각형의 넓이 = 밑변 * 높이 / 2
//		- 사용자로부터 데이터를 입력받아 처리 → BufferedReader 활용
//		- 밑변과 높이를 사용자로부터 입력받는다고 해서
//			BufferedReader 두 개를 활용할 필용는 없다.

public class Test013
{
	public static void main(String[] args) throws IOException
	{
		// 작성한 코드
		/*
		// 변수 선언 및 초기화
		int a = 0, b = 0;
		double area = 0d;
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.println("■ 삼각형의 넓이 구하는 프로그램 ■");
		System.out.print("- 삼각형의 밑변 입력 : ");
		a = Integer.parseInt(br.readLine());
		
		System.out.print("- 삼각형의 높이 입력 : ");
		b = Integer.parseInt(br.readLine());
		
		// 삼각형의 넓이 계산
		area = a * b / 2.0;
		
		// 결과 출력
		System.out.println();	//-- 개행
		System.out.printf(">> 밑변이 %d, 높이가 %d인 삼각형의 넓이 : %.2f\n", a, b, area);
		//--출력
		//■ 삼각형의 넓이 구하는 프로그램 ■
		//- 삼각형의 밑변 입력 : 10
		//- 삼각형의 높이 입력 : 10
		//>> 밑변이 10, 높이가 10인 삼각형의 넓이 : 50.000000
		//계속하려면 아무 키나 누르십시오 . . .
		*/
		
		// 주요 변수 선언 및 초기화
		//BufferedReader br = new BufferedReader(System.in);
		//				-------------------- -----------
		//				  문자열 기반			바이트 단위기반
		
		// BufferedReader 인스턴스 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		//				-------------------- -------------------   ------
		//				  [문자열 기반]		 [바이트 단위 → 문자열 기반]	[바이트 단위기반]
		
		
		// 밑변, 높이, 넓이
		int underLength, height;	//-- 밑변과 높이
		//int area; // 삼각형의 넓이는 실수형으로 표현
		double area;				//-- 넓이  check~!!!
		
		
		// 연산 및 처리
		// ① 사용자에게 안내 메시지 출력
		System.out.println("■ 삼각형의 넓이 구하는 프로그램 ■");
		System.out.print("- 삼각형의 밑변 입력 : ");
		
		// ② 사용자가 입력한 데이터(문자열)를 정수 형태로 변환한 후
		//		변수 underLength에 담아내기
		//br.readLine(); // throws IOException 추가, 문자열 형태로 입력 값 가져옴
		underLength = Integer.parseInt(br.readLine());
		
		// ③ 다시 사용자에게 안내 메시지 출력
		System.out.print("- 삼각형의 높이 입력 : ");
		
		// ④ 사용자가 입력한 데이터(문자열)를 정수 형태로 변환한 후
		//		변수 height에 담아내기
		//br.readLine(); // throws IOException 를 또 추가 할 필요가 없음, 문자열 형태로 입력 값 가져옴
		height = Integer.parseInt(br.readLine());
		
		// ⑤  삼각형의 넓이 구하는 연산  처리
		//		삼각형의 넓이 = 밑변 * 높이 / 2;
		//area = underLength * height / 2;
		//		정수형		정수형	정수형 → 정수 기반의 연산(즉, 몫을 취하고 나머지는 버림)
		
		//area = (double)(underLength * height / 2); // → (X)
		//area = (double)underLength * height / 2 ;
		//area = underLength * (double)height / 2 ;
		//area = underLength * height / (double)2 ;
		area = underLength * height / 2.0;
		//System.out.println("area : " + area);
		
		
		// ※ 실수 자료형이 결과값으로 나오는 과정에서
		//		실수 기반의 연산이 필요한 상황이다.
		//		정수형 『2	ㄴ 가 아닌 실수형 2.0 으로 나눗셈 연산을 수행하게 되면
		//		이 연산을 실수 기반으로 처리한다.
		
		// 최종 결과 출력
		System.out.println();	//-- 개행
		//System.out.print();	//-- 에러 발생(컴파일 에러)
		System.out.printf(">> 밑변이 %d, 높이가 %d인 삼각형의 넓이 : %.2f\n", underLength, height, area);
		//-- 최종 출력
		//■ 삼각형의 넓이 구하는 프로그램 ■
		//- 삼각형의 밑변 입력 : 3
		//- 삼각형의 높이 입력 : 5

		//>> 밑변이 3, 높이가 5인 삼각형의 넓이 : 7.50
		//계속하려면 아무 키나 누르십시오 . . .
	}
}