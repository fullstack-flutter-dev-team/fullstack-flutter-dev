/*========================================================================
	■■■ 클래스 고급 ■■■
	- 중첩 클래스 ▶ static 중첩 클래스(중첩 내부 클래스)
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/// @see [중첩클래스(중첩 내부클래스, 내부클래스, 로컬클래스, 익명클래스)](https://chicken-mola.tistory.com/32?category=881798)


/* 
Test126.class
Test.class
Test$StaticNested.class

	○ 중첩 클래스
	
		중첩 클래스란 클래스 안에 다른 클래스가 설계되어 있는 형태로
		클래스 내부에서만 사용할 보조 클래스가 필요한 경우
		클래스를 중첩하여 프로그램의 구조를 보다 더 간단하고 알아보기 쉽도록
		만들 수 있는데, 이러한 클래스를 중첩 클래스라 한다.
		이는, 특정 클래스를 자신의 클래스 내부적인 용도로만 사용할 목적으로 쓰이는데
		특정 클래스를 마치 자신의 멤버 변수나 메서드처럼 사용할 수 있게 한다.
		
	○ 중첩 클래스의 종류(4가지)
		1. static 중첩 클래스(중첩 내부 클래스)
		    → 클래스 내부에 ...   『public static class 클래스명』
		 
		    중첩 클래스를 감싸는 외부 클래스의 『{}』안에
		    static 을 붙인 새로운 클래스를 설계하는 것으로
		    모든 접근 제어 지시자를 사용할 수 있다.
		    static 중첩 클래스가 포함하고 있는 메서드에서는
		    외부 클래스의 인스턴스 변수나 인스턴스 메서드에는 접근할 수 없고
		    (외부 클래스의 객체를 생성하지 않은 상태)
		    클래스 변수와 클래스 메서드만 접근할 수 있다.
		 
		    - 프로그램의 구조를 더 간단하고 알아보기 쉽세 구성할 수 있다.
		    - static으로 선언된 내부 클래스이다.
		    - 중첩 클래스의 객체는 중첩 클래스를 포함하고 있는 외부 클래스이 객체와 동등하다.
		    - 외부 클래스의 클래스 변수와 클래스 메서드는 바로 접근하여 사용하는 것이 가능하다.
		    - 중첩 클래스와 중첩 클래스를 포함하고 있는 외부 클래스의 인스턴스 변수와 인스턴스 메서드는
		      객체를 생성하여 서로 접근하는 것이 가능하다.
		    - 중첩 클래스를 외부에서 단독으로 사용하는 것이 가능하다.
		 
		 
		2. 내부 클래스(inner class)
		    → 클래스 내부에...  『public class  클래스명』
		
		    - static  중첩 클래스와 마찬가지로 프로그램의 구조를 보다 더 간단하고 알아보기 쉽도록 한 것이다.
		    - 외부 클래스의 메서드에서 내부 멤버 클래스를 사용하기 위해서는 반드시 내부 멤버 클래스 객체를 생성해 주어야 한다.
		    - 외부 클래스의 멤버 변수와 메서드를 객체 생성 없이 바로 사용하는 것이 가능하다.
		    - 내부 멤버 클래스는 외부에서 단독으로 객체를 생성하여 사용할 수 없다.
		       즉, 내부 멤버 클래스는 외부 클래스의 인스턴스 생성이 선행되어야 한다는 것이다.
		    - static 으로 선언된 변수 또는 메서드를 가질 수 없다.
		
		    /// @see [Test128.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test128.java)
		
		3. 지역 클래스(로컬 클래스, local class)
		    → 메서드 내부에...  『class 클래스명』 또는 『static class 클래스명』
		 
		    - 클래스의 메서드 안에서 클래스를 정의하는 것으로 내부 멤버 클래스와 유사한 성격을 가지고 있긴 하지만, 
		      접근제어지사자는 붙일 수 없다.
		
		    /// @see [Test127.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test127.java)
		
		4. 무명 클래스(익명 클래스, annonymous class) → 이름 없는 클래스
		   - 클래스 또는 인터페이스에 대한 객체를 생성하면서 바로 클래스 또는 인터페이스를 정의하는 클래스.
		   - 정의하는 부분과 생성하는 부분이 하나로 묶여져, new 수식이 있는 곳에서 바로 클래스 또는 인터페이스를
		     정의하는 것을 의미한다.
	 
*/
 
/*
 ▣ 힌트: 
 	 
*/


// outer clas
class Test
{
	static int a = 10;   // static, class 변수
	int b = 20;          // 인스턴스 변수
	
	// inner class
	public static class StaticNested	 // static
	{
		int c = 30;
		
		void write()
		{
			System.out.println("write()...");
			System.out.println("a : " + a);
			//System.out.println("b : " + b);
			//--==>> 에러 발생(컴파일 에러)
			//    Test126.java:80: error: non-static variable b cannot be referenced from a static context
			System.out.println("c : " + c);	// StaticNested 클래스와 탄생 시점이 같음
			//--==>> c : 30
		}
	}
	
	void print()
	{
		StaticNested sn = new StaticNested();
		sn.write();
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test126
{
	
	public static void main(String[] args)
	{
		// 외부에서...Test(outer 클래스)기반 인스턴스 생성
		Test ob1 = new Test();
		ob1.print();
		//--실행 결과
		//write()...
		//a : 10
		//c : 30
		
		// 외부에서... StaticNested(inner 클래스) 기반 인스턴스 생성
		//StaticNested ob2 = new StaticNested();
		//--==>> 에러 발생(컴파일 에러)
		//       Test126.java:110: error: cannot find symbol
		
		/* ==================================================================
		   중첩 내부 클래스(static 중첩 클래스)는 외부에서 단독으로 객체를 생성할 수 있다.
		   단, 위와 같은 방법으로는 객체를 생성할 수 없고,
		   클래스 변수 접근이나 클래스 메서드 호출과 같은 방식을 통해
		   접근하여 인스턴스를 생성할 수 있도록 처리해야 한다.
		 ==================================================================== */
		
		// Test.a
		
		Test.StaticNested ob2 = new Test.StaticNested();
		ob2.write();
		//-- 실행 결과
		//write()...
		//a : 10
		//c : 30
	}
}