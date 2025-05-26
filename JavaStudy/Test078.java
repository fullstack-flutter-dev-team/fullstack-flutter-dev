/*===================================================================
	■■■ 클래스와 인스턴스 ■■■
	-  생성자(Constructor)
===================================================================*/
// ※ ○ ★ 『  』  →   ←  ↓  ↑ ⬛ /* */

/* 

○ 생성자(Constructor)의 역활
	1. 인스턴스 생성 → 메모리 할당
	2. 초기화
	
	
○	생성자(Constructor)의 특징
	1. 생성자는 메서드이지만, 일반 메서드처럼 호출될 수 없으며,
		반환 자료형을 가질 수 없다.
		(『void』 조차 가질 수 없으며, 값을 반환할 수도 없다.)
	
	2. 생성자는 클래스와 동일한 이름을 가져야 한다.
		(대소문자 명확히 구분)
	
	3. 생성자는 객체를 생성하는 과정에서 『new 생성자();』 의 형태로 호출된다.
		(인스턴스 생성 과정에서 단 한 번만 호출)
		→ ★ final 변수 (상수화된 변수) 초기화 가능.
		
	※ 생성자는 특별한 메서드로 간주
*/

class NumberTest
{
	int num;	// NumberTest 클래스의 전역 변수, 자동으로 초기화 됨
	
	
	// check~!!!
	// 클래스에.. 사용자 정의 생성자를 정의하지 않았다면....
	// 컴파일 과정에서 디폴트(default) 생성자가 자동으로 삽입된다.
	
	//디폴트(default) 생성자
	/*
	NumberTest()
	{
	
	}
	*/
	
	//사용자 정의 생성자 → 디폴트(default) 생성자가 자동으로 삽입되지 않음~!!!
	NumberTest()
	{
		num = 10;
		System.out.println("생성자 호출~~!!!");
	}
	
	int getNum()
	{
		return num;
	}
}

public class Test078
{
	public static void main(String[] args)
	{
		//NumberTest 클래스(설계도) 기반의 인스턴스(객체) 생성
		NumberTest nt1 = new NumberTest();
		//					--------------
		//-- 인스턴스가 생성되는 시점에서
		//		이와 동시에 선택의 여지 없이 생성자 호출이 이루어진다.
		//									------------
		//									NumberTest()
		
		//nt1.NumberTest();
		//--==>> 에러 발생(컴파일 에러)
		
		/*
		int n = nt1.getNum();
		System.out.println("n : " + n);
		// n : 0
		// n : 10
		*/
		
		System.out.println(nt1.getNum());
		//--==>> 10
		
		System.out.println(nt1.num);
		//--==>> 10
		
		nt1.num = 200;
		System.out.println(nt1.getNum());
		//--==>> 200
		
		System.out.println(nt1.num);
		//--==>> 200
		
		//NumberTest 클래스 인스턴스 생성
		NumberTest nt2 = new NumberTest();
		//--==>> 생성자 호출~~!!!
		
		
		int testNum = nt2.getNum();
		System.out.println(testNum);
		//--==>> 10
		
		System.out.println(nt2.getNum());
		//--==>> 10
		
		System.out.println(nt2.num);
		//--==>> 10
	}
}

//
/*
생성자 호출~~!!!
10
10
200
200
생성자 호출~~!!!
10
10
10
계속하려면 아무 키나 누르십시오 . . .
*/