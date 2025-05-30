/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
	-  static 변수(클래스 변수)와 static 메서드(클래스 메서드)
	   ------------------------   ----------------------------
	        정적 변수                      정적 메서드     
===================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ① ② ③ ④   →  ←  ↓ ↑  …  ：  /*  */  ─ ┃ ┛

/* 
	
*/


/* 
    ★ static 변수/메서드
       ※ 공유
       ※ 탄생 시점
*/

/*
 ▣ 힌트:
    
*/

import java.util.Scanner;
import java.util.Random;


// 실습 편의상 접근제어 지시자 생략
public class Test104
{
	/*
	   클래스 변수 또는 클래스 메서드는
	   클래스 정보가 로딩되는 순간 메모리 할당이 이루어지며
	   클래스 이름 또는 객체(인스턴스)를 통해 접근할 수 있다.
	   즉, 『new』 연산자를 통해 메모리를 할당받지 않아도
	   사용이 가능하다는 것이다.
	
	*/
	
	static int a = 10;      //-- static 변수(클래스 변수, class 변수, 정적 변수)
	
	int b = 20;             //-- non-static 변수(인스턴스 변수, instance 변수)
	
	void write()            //-- not-static 메서드(인스턴스 메서드, instance 메서드)
	{
		System.out.println("클래스   변수 a : " + a);
		System.out.println("인스턴스 변수 b : " + b);
	}
	
	static void print()   //-- static 메서드(클래스 메서드, class 메서드, 정적 메서드)
	{
		System.out.println("클래스   변수 a : " + a);
		//System.out.println("인스턴스 변수 b : " + b);
		//--실행결과
		//--===>> 에러 발생(컴파일 에러)
		//Test104.java:54: error: non-static variable b cannot be referenced from a static context
		//		System.out.println("인스턴스 변수 b : " + b);
		//		                                    ^
		//1 error
	}
	
	public static void main(String[] args)
	{
		System.out.println("main()  → 클래스   변수 a : " + Test104.a);
		//--===>> main()  → 클래스   변수 a : 10
		//-- 클래스 변수에 접근하기 위해서는
		//   『클래스명.변수명』 의 형태로 클래스이ㅡ 이름을 통해
		//   접근하는 것이 가능하다.

		System.out.println("main()  → 클래스   변수 a : " + a);
		//--===>> main()  → 클래스   변수 a : 10
		//-- 같은 클래스 내부에 존재하기 때문에 
		//   (→  『a』 와 『main()』은 둘 다 Test104의 멤버)
		//    클래스의 이름을 생략하는 것이 가능하다.
		
		
		Test104.print();
		//--==>> 클래스   변수 a : 10
		
		print();
		//--==>> 클래스   변수 a : 10
		//-- 클래스 메서드에서 클래스 메서드의 호출은 가능하며,
		//   『클래스명.메서드명()』 의 형태로 접근하여 호출하는 것이 가능하다.
		//   또한, 지금은 같은 클래스 내부에 존재하기 때문에
		//   클래스의 이름을 생략하는 것도 가능하다.
		
		//System.out.println("main()  → 인스턴스 변수 b : " + b);
		//--에러 발생(컴파일 에러)
		//Test104.java:88: error: non-static variable b cannot be referenced from a static context
		//		System.out.println("main()  → 인스턴스 변수 b : " + b);
		//		                                              ^
		//1 error
		
		//System.out.println("main() → 인스턴스 변수 b : " + Test)
		//--==>> 에러 발생(컴파일 에러)
		//Test104.java:95: error: ';' expected
		//		System.out.println("main() → 인스턴스 변수 b : " + Test)
		//		                                                  ^
		//1 error
		
		//write();
		//--==>> 에러 발생(컴파일 에러)
		//Test104.java:102: error: non-static method write() cannot be referenced from a static context
		//		write();
		//		^
		//1 error
		
		//Test104.write();
		//--==>> 에러 발생(컴파일 에러)
		//Test104.java:109: error: non-static method write() cannot be referenced from a static context
		//		Test104.write();
		//		       ^
		//1 error
		
		// Test104 클래스의 인스턴스 생성
		Test104 ob1 = new Test104();
		
		//System.out.println("main() → 인스턴스 변수 b : " + b);
		//--==>> 에러 발생(컴파일 에러)
		//Test104.java:119: error: non-static variable b cannot be referenced from a static context
		//		System.out.println("main() → 인스턴스 변수 b : " + b);
		//		                                             ^
		//1 error
		
		//System.out.println("main() → 인스턴스 변수 b : " + ob1.b);
		//--==>> main() → 인스턴스 변수 b : 20
		
		
		//write();
		//--==>> 에러 발생(컴파일 에러)
		//Test104.java:130: error: non-static method write() cannot be referenced from a static context
		//		write();
		//		^
		//1 error		
		
		// 생성된 인스턴스를 통해 인스턴스 메서드 접근(호출)
		ob1.write();
		//--실행 결과
		//클래스   변수 a : 10
		//인스턴스 변수 b : 20
		
		// 생성된 인스턴스를 통해 클래스 변수 접근
		System.out.println("main() 클래스 변수 a : " + ob1.a);
		//--
		
		//생성된 인스턴스를 통해 클래스 메서드 접근(호출)
		ob1.print();
		//--==>>
		
		/*
		   클래스 변수나 클래스 메서드는 
		   『생성된인스턴스명.변수명』
		   『생성된인스턴스명.메서드명()』
		   의 형태로 접근(호출)이 가능하지만
		   『클래스명.변수명』
		   『클래스명.메서드명()』
		   의 형태로 접근(호출)하는 것이 일반적이다.
		   
		*/
		
		System.out.println(); // 개행
		
		System.out.println("main()  클래스메서드 print()");
		print();
		ob1.print();
		Test104.print();
		//-- main() → 클래스메서드 print()
		//  클래스   변수 a : 10
		//  클래스   변수 a : 10
		//  클래스   변수 a : 10
		
		
		
		System.out.println(); // 개행
		
		//Test104 클래스의 인스턴스 생성
		Test104 ob2 = new Test104();
		
		ob2.a = 100000;  // 클래스 변수(공유)
		ob2.b = 100000;  // 인스턴스 변수(독립적인 공간)
		
		System.out.println("ob2 확인--------------------");
		ob2.write();
		//ob2 확인--------------------
		//클래스   변수 a : 100000
		//인스턴스 변수 b : 100000
		
		System.out.println("ob1 확인--------------------");
		ob1.write();
		//---
		//ob1 확인--------------------
		//클래스   변수 a : 100000
		//인스턴스 변수 b : 20		
		
	}
}