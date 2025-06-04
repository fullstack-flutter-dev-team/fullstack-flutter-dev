/*========================================================================
	■■■ 클래스 고급 ■■■
	-  상속(Inheritance)
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯ ㄷ

/* 

*/

/*
	○ 상속(Inheritance)이란
		새로 설계(생성)하고자 하는 클래스가
		이미 설계되어 있는 다른 클래스의 기능과 중복되는 경우
		이미 설계된 클래스의 일부분이나 전체 구조를 공유할 수 있도록 하는 기능을 의미한다.
		
		즉, 상속은 객체를 좀 더 쉽게 만들 수 있는
		고수준의 재사용성(Reusability)을 확보하고, 객체 간의 관계를 구성함으로써
		객체 지향의 또 다른 특징인 『다형성』의 문법적 토대가 된다.
		
		상속은 기존 프로그램의 클래스 내용을 공유함으로써
		중복된 코드들을 재작성할 필요 없이 
		반복적이고 세부적인 작업을 처리하지 않기 때문에
		프로그램을 작성하는 시간을 절약할 수 있고
		유지보수를 편리하게 할 수 있으며,
		프로그램의 길이마저도 짧아지게 된다.
		
		또한, 이미 작성된 프로그램들은 앞서 테스트되었기 때문에
		오류를 줄일 수 있어 현재 작성 중인 프로그램에만 전념할 수 있다.
		
	※ 주의할 점
		자바는 『다.중.상.속』을 지원하지 않기 때문에
		두 개 이상의 클래스로부터 상속받을 수 없다.
		
		즉, 자바는 『단.일.상.속』만 지원한다.
*/

/*
 ▣ 힌트: 
      ※ 
 
*/

import java.io.IOException;
import java.util.Scanner;

// 부모 클래스 == 상위 클래스 == 슈퍼(Super) 클래스 == 물려주는 클래스 == 상속하는 클래스
class SuperTest115
{
	// 속성
	protected double area;
	
	// 생성자
	SuperTest115()
	{
		System.out.println("Super Class...");
	}
	
	// 메서드
	void write(String title)
	{
		System.out.println(title + " - " + area);
	}
}


// 자식 클래스 == 하위 클래스 == 서브(sub) 클래스 == 물려받는 클래스 ==상속반는 클래스
public class Test115 extends SuperTest115
{
	/*
	// 속성
	protected double area;					//-- 부모로부터 물려받은 area 속성
	
	// check~!!!
	// ※ 생성자는 상속 대상에서 제외된다.~!!!
	
	// 메서드
	void write(String title)				//-- 부모로부터 물려받은 write() 메서드
	{
		System.out.println(title + " - " + area);
	}
	*/
	
	// 사용자 정의 생성자를 별도로 정의하지 않았음...
	//				↓
	// 자동으로 삽입되는 default 생성자
	/*
	public Test115()
	{
		super();
		// SuperTest115(); //-- 부모 클래스의 생성자 호출 구문
	}
	*/
	
	// 사용자 정의 생성자
	public Test115()
	{
		// 자동 삽입
		// super();			//-- O
		// SuperTest115();	//-- X

		// ※ 생성자 내부에서 또 다른 생성자를 호출하는 문법
		//	- 가능하다. 단, 생성자 내부에서 가장 먼저 실행되어야 한다.
		
		System.out.println("Sub Class...");
		
	}
	
	public void actionCircle()
	{
		int r = 10;
		//area = r * r * 3.141592;
		//this.area = r * r * 3.141592; // this가 포함되어 있는 클래스로 간주
		//this.area = r * r * 3.141592; // this가 포함되어 있는 클래스로 간주 -- ⭕
		
		//super.area = r * r * 3.141592; // 상속받은 부모 클래스로 간주 -- ⭕
		//SuperTest115.area = r * r * 3.141592; // 상속받은 부모 클래스로 간주 -- ⭕
		super.area = r * r * 3.141592; // 상속받은 부모 클래스로 간주 -- ⭕
		
		write("원"); //  -- ⭕
	}
	
	public void actionRect()
	{
		int w = 20, h = 5;
		area = w * h;
		
		//write("사각형");//  -- ⭕
		//super.write("사각형");//  -- ⭕
		this.write("사각형");//  -- ⭕
	}
	
	
	public static void main(String[] args)
	{
		// 자식 클래스에서 생성자를 정의하기 이전에 수행한 구문
		// Test115 기반 인스턴스 생성
		//Test115 ob = new Test115();
		//--==>> Super Class...
		
		//자식 클래스에서 생성자를 정의한 이후에 수행한 구문
		Test115 ob = new Test115();
		//--==>> Super Class...
		//		Sub Class...
		
		ob.actionCircle();
		//--==>> 원 - 314.1592
		
		ob.actionRect();
		//--==>> 사각형 - 100.0
	}
}