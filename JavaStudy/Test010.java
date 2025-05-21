/*===================================================================
	■■■ 자바의 개요 및 특징 ■■■
===================================================================*/

//○ 퀴즈
//	사전에 부여된 반지름 정보를 통해
//	원의 넓이롸 둘레를 구하는 프로그램을 구현한다.
//	→ 반지름 : 10
	
//※ 원의 넓이 : 반지름 * 반지름 * 3.141592
//	원의 둘레: 지름 * 3.141592
//				---
//				(반지름 *2)

//실행 예)
//넓이 : xxx
//둘레 : xxx
//계속하려면 아무 키나 누르세요....


public class Test010
{
	// 내가 풀이한 내용
	// 상수 PI 선언 및 초기화
	public static final double PI = 3.141592;
	
	public static void main(String[] args)
	{
		// 내가 풀이한 내용
		/*
		// 원의 반지름
		int radius = 10;
			
		// 원의 넓이 계산(PI * r^2)
		double a = PI * radius * radius;
			
		// 원의 둘레 계산(2 * PI * r)
		double b = 2 * PI * radius;
		
			
		// 원의 넓이 & 둘레 계산 값 출력
		System.out.printf("넓이 : %f\n",a);
		System.out.printf("둘레 : %f\n",b);
		*/
		
		
		// 함께 풀이한 내용
		
		// 주요 변수 선언
		int r = 10;					//-- 반지름(r)
		final double pi = 3.141592;	//-- 원주율(π)
		//-- 『final』  키워드 : 변수의 상수화~!!!  check~!!!
		//-- 상수 명은 대문자로 표기
		
		double area, length;		//--원의 넓이, 둘레
		
		
		// 연산 및 처리
		// ① 넓이 연산
		//		원의 넓이 = 반지름 * 반지믈 * 3.141592;
		area = r * r * PI;
		
		
		// ② 둘레 연산
		//		원의 둘레 = 지름 * 3.141592;
		//		원의 둘레 = 반지름 * 2 * 3.141592;
		length = r * 2 * PI;
		
		// 결과 출력
		//System.out.println("넓이 : " + 10*10*3.141592 + "\n둘레 : " + 10*2*3.141592);
		/*
		System.out.println("넓이 : " + area);
		System.out.println("둘레 : " + length);
		//--
		//넓이 : 314.1592
		//둘레 : 62.83184
		*/
		
		System.out.printf("넓이 : %f\n", area);
		System.out.printf("둘레 : %f\n", length);
		//--
		//넓이 : 314.159200
		//둘레 : 62.831840
		
		
		System.out.printf("넒이 : %.2f\n", area);
		System.out.printf("둘레 : %.2f\n", length);
		//--
		//넒이 : 314.16
		//둘레 : 62.83
	}
}