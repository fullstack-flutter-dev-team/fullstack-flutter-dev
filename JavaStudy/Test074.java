/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
	- 직사각형 클래스 설계 실습
===================================================================*/

/*
	
	
	직사각형의 넓이와 둘레 계산 클래스로 표현(설계)

	클래스의 정체성	→ 직사각형 객체의 설계도
	클래스의 속성	→ 가로, 세로, 넓이, 둘레
						(, 부피, 무게, 재질, 질량, 냄새, ...)
	클래스의 기능	→ 넓이 계산, 둘레 계산, 가로 세로 입력, 결과 출력
						(, 일부 잘라내기, 가로 변경, 세로 변경, 재질 변경, ...)
	
	※ 객체를 구성 → 데이터(속성, 상태) + 기능(동작, 행위)
			↓				↓					↓

		클래스 설계 →		변수			+ 메서드


public class 직사각형
{
	// 데이터(속성, 상태)	→ 변수(순서는 의미 없음)
	int 가로, 세로;
	
	// 기능(동작, 행위)		→ 메서드(순서는 의미 없음)
	가로세로입력()
	{
	
	}
	
	둘레계산()
	{
	}
	
	넓이계산()
	{
	}
	
	결과출력()
	{
	}
	
}


*/


import java.util.Scanner;	// 파일내에 여러개의 클래스가 있는 경우, 최상단에 import문 삽입

// 직사각형 클래스 설계
//public class Rect
class Rect
{
	// 데이터(속성, 상태)	→ 변수(순서 의미 없음)
	int w, h;		// 가로, 세로; → 전역변수(global 변수)
	
	// 기능(동작, 행이)		→  메서드(순서는 의미 없음)
	void input()			// 가로세로입력()
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.print("가로 입력 : ");
		//int a = sc.nextInt();	// 지역변수(local 변수)
		w = sc.nextInt();
		
		System.out.print("세로 입력 : ");
		h = sc.nextInt();
		
		//return xxx;
	}
	
	// 둘레 계산에만 집중
	int calLength()		// 둘레계산() → 직사각형의 둘레 연산 수행 → (가로 + 세로)*2
	{
		// (가로 + 세로) * 2
		//return (가로 + 세로) * 2;
		//return ( w + h ) * 2;
		
		int result = 0;
		result = (w + h) * 2;
		
		return result;	// → calLength() 메서드 종료
		
		//..... → 의미 없음
		//	......
	}
	
	// 넓이 계산에만 집중
	int calArea()		// 넓이계산()	→ 직사각형의 넓이 연산 수행 → 가로 * 세로
	{
		//주요 변수 선언 및 초기화
		int result = 0;	//-- 지역 변수(local 변수)
		
		//연산 및 처리 → 선언한 변수들에 값 담아내기
		//result = 가로 * 세로;
		result = w * h;
		
		//결과 처리
		return result;
	}
	
	void print(int a, int l)			// 결과출력() → ★ 출력에만 집중
	{
		//가로 : xxx
		//세로 : xxx
		//넓이 : xxx
		//둘레 : xxx
		System.out.println("가로 : " + w);
		System.out.println("세로 : " + h);
		System.out.println("넓이 : " + a);
		System.out.println("둘레 : " + l);
	}
	
	
}

// ※ 하나의 자바 파일(.java)에 여러 개의 클래스(class)를 설계할 수 있다.
//		하지만, 『public class』는 이 파일 내에서 하나만 올 수 있다.
//		파일을 저장할 때의 이름은
//		이 『public class』의 이름으로 지정해야 한다.
//		일반적으로(실무적으로는) 하나의 파일에 하나의 클래스를 설계한다.
//		또한, 여러 개의 클래스가 설계된 파일을 컴파일하게 되면
//		내부에 설계된 클래스의 수 만큼 클래스 (.class)이 파생된다.


// 외부의 다른 클래스
public class Test074
{
	public static void main(String [] args)
	{
		//Rect 클래스 기반의 인스턴스(객체) 생성
		//Rect 변수명 = new Rect();
		Rect ob = new Rect();
		
		int area;
		int length;
		
		// 입력 메소드 호출
		ob.input();
		
		// 사각형 넓이 연산 메서드 호출
		//ob.calArea();
		//int area = ob.calArea();	// int area = 40;
		area = ob.calArea();
		
		//둘레 연산 메서드 호출
		//ob.calLength();
		//int length = ob.calLength();
		length = ob.calLength();
		
		//출력 메서드 호출
		ob.print(area, length);
		
	}
}

//실행 결과
/*

가로 입력 : 20
세로 입력 : 40
가로 : 20
세로 : 40
넓이 : 800
둘레 : 120
계속하려면 아무 키나 누르십시오 . . .

*/