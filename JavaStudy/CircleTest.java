/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
===================================================================*/

//	※ Test075.java 파일과 한묶음~!!! (main() 메서드 존재)

/*
	
	원의 넓이아 둘레 구하기
	원의 넓이와 둘레를 구할 수 있는 클래스를 설계한다.
	(클래스명 : CircleTest)
	Test074 클래스를 참고하여 설계할 수 있도록 한다.
	데이터 입력은 BufferedReader 의 readLine() 활용
	

	실행 예)
	반지름 입력 : xxx
	
	>> 반지름이 xxx인 원의
	>> 넓이 : xxx.xx
	>> 둘레 : xxx.xx
	계속하려면 아무 키나 누르세요.
	
	※ 원의 넓이 = 반지름 * 반지름 * 3.141592(원주율)
	   원의 둘레 = 반지름 * 2 * 3.141592(원주율)

*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class CircleTest
{
	/*
	// 속성: 전역변수 선언
	final double PI = 3.141592;
	int radius;
	
	void input() throws IOException
	{
		// 변수 선언
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		//사용자 입력 문구 출력
		System.out.print("반지름 입력 : ");
		radius = Integer.parseInt(br.readLine());
	}
	
	double calArea()
	{
		// 변수 선언
		double area;
		
		// 원의 넓이 계산
		area = PI*radius*radius;
		
		// 원의 넓이 값 반환
		return area;
	}
	
	
	double calLength()
	{
		// 변수 선언;
		double length;
		
		//원의 둘레 계산
		length = 2 * PI * radius;
		
		//원의 둘레 값 반환
		return length;
	}
	
	
	void print(double area, double length)
	{
		System.out.printf(">> 반지름이 %d인 원의\n", radius);
		System.out.printf(">> 넓이 : %.2f\n", area);
		System.out.printf(">> 둘레 : %.2f\n", length);
	}
	
	
	*/
	
	
	//주요 속성(데이터)		→ 멤버 변수
	int r;						//-- 반지름
	final double PI = 3.141592;	//-- 원주율(변수의 상수화)
	
	//주요 기능(동작, 행위)	→ 멤버 메서드
	//반지름 입력 기능		→ 메서드 정의
	void input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("반지름 입력 : ");
		r = Integer.parseInt(br.readLine());
	}
	
	//넓이 계산 기능		→ 메서드 정의
	double calArea()
	{
		//원의 넓이 = 반지름 * 반지름 * 3.141592(원주율)
		//return 반지름 * 반지름 * 3.141592(원주율)
		return r * r * PI;
	}
	
	//둘레 계산 기능		→ 메서드 정의
	double calLength()
	{
		//원의 둘레 = 반지름 * 2 * 3.141592(원주율)
		double result = 0;
		
		//연산
		result = r * 2 * PI;
		
		return result;
	}
	
	
	//결과 출력 기능		→ 메서드 정의
	void print(double a, double b)
	{
		//>> 반지름이 xxx인 원의
		//>> 넓이 : xxx.xx
		//>> 둘레 : xxx.xx
		
		System.out.printf("\n>>반지름이 %d 인 원의\n", r);
		System.out.printf(">> 넓이 : %.2f\n", a);
		System.out.printf(">> 둘레 : %.2f\n", b);
	}
}