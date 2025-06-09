/*========================================================================
	■■■ 클래스 고급 ■■■
	- 중첩 클래스 ▶ 내부 클래스(inner class)
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/// @see [Test126.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test126.java)


/*
	
*/

// outer 클래스
class InnerOuterTest
{
	static int a = 10;
	int b = 20;
	
	// Inner 클래스
	class InnerNested		//-- 인스턴스 변수처럼 접근....
	{
		int c = 30;
		
		void write()		//-- inner의 write() 메서드
		{
			System.out.println("inner의 write()...");
			System.out.println("a : " + a);
			System.out.println("b : " + b);
			System.out.println("c : " + c);
		}
	}
	
	void write()			//-- outer의 write() 메서드
	{
		System.out.println("outer의 write()...");
		
		// InnerNested(inner 클래스) 기반 인스턴스 생성
		InnerNested ob1 = new InnerNested();
		ob1.write();	//-- inner 의 write() 메서드 호출
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test128
{
	
	public static void main(String[] args)
	{
		// InnerOuterTest(outer 클래스) 인스턴스 생성
		InnerOuterTest ob2 = new InnerOuterTest();
		ob2.write();	//-- outer의 write() 메서드 호출
		//--실행 결과
		//outer의 write()...
		//inner의 write()...
		//a : 10
		//b : 20
		//c : 30		
		
		// InnerNested(inner클래스) 인스턴스 생성
		//InnerNested ob3 = new InnerNested();
		//--==>> 에러 발생(컴파일 에러)
		//	Test128.java:58: error: cannot find symbol
		
		// check~!!  -> Test126.java 파일과 비교~!!!
		//InnerOuterTest.InnerNested ob4 = new InnerOuterTest.InnerNested();
		//ob4.write();
		//--==>> 에러 발생(컴파일 에러)
		//	Test128.java:63: error: an enclosing instance that contains InnerOuterTest.InnerNested is required
		
		// ※ 중첩 내부 클래스(static 중첩 클래스)와는 달리
		// 외부 클래스의 인스턴스(객체)를 사용하지 않고
		// 단독으로 내부 클래스이 인스턴스를 생성하는 것은 불가능하다.
		
		// check~!!! → Test126.java 파일과 비교~!!!
		InnerOuterTest.InnerNested ob5 = ob2.new InnerNested();
		ob5.write();
		//-- 실행 결과
		//inner의 write()...
		//a : 10
		//b : 20
		//c : 30		
		
		System.out.println("----------------");
		
		// outer클래스명.inner클래스명 참조형변수명 = outer객체.new inner생성자();
		// outer클래스명.inner클래스명 참조형변수명 = (new outer생성자).new inner생성자();
		
		// cf) static 중첩 클래스
		// outer클래스명.inner클래스명 참조형변수명 = new outer클래스명.inner생성자();
		
		InnerOuterTest.InnerNested ob6 = new InnerOuterTest().new InnerNested();
		ob6.write();
		//-- 실행결과
		//inner의 write()...
		//a : 10
		//b : 20
		//c : 30
		
	}
	
}