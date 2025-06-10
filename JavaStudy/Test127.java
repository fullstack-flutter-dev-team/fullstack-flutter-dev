/*========================================================================
	■■■ 클래스 고급 ■■■
	- 중첩 클래스 ▶ 로컬 클래스, local class, 지역 클래스
=========================================================================*/
// ※ ○ ★ 『』 ⬛ ▣ ▶ ① ② ③ ④   →  ←  ↓  …  ： ↑ /* */  ─ ┃ ┛┯

/// @see [Test126.java](https://github.com/fullstack-flutter-dev-team/fullstack-flutter-dev/blob/main/JavaStudy/Test126.java)

/*
	
*/


// outer 클래스
class Test2
{
	static int a = 10;
	int b = 20;
	
	void write()				//-- 첫 번째 write() 메서드
	{
		System.out.println("첫 번째 write()...");
		final int c = 30;	//-- 클래스 변수
		int d = 40;			//-- 인스턴스 변수
		
		d++;
		
		// inner 클래스
		// 메서드 안에 존재하는 또다른 클래스(로컬 클래스, local class, 지역 클래스)
		class LocalTest
		{
			void write()		//-- 두 번째 write() 메서드
			{
				System.out.println("두 번째 write()...");
				System.out.println("a : " + a);
				System.out.println("b : " + b);
				System.out.println("c : " + c);	//-- (허용), c의 값은 final 로서 보장된 변수
				//System.out.println("d : " + d);	//-- (컴파일 에러) ★
				//--==> 에러 발생(컴파일 에러)
				//	Test127.java:36: error: local variables referenced from an inner class must be final or effectively final
			}
		}
		
		d++;
		
		// LocalTest(inner 클래스) 인스턴스 생성이 언제 될 것인가에 따라 변수 d의 값은 보장받을 수 없어 컴파일 에러 발생
		LocalTest lt = new LocalTest();
		lt.write();			//-- 두 번째 write() 메서드 호출
		
		d++;
		
		d++;
	}
}

// main() 메서드를 포함하는 외부의 다른 클래스
public class Test127
{
	
	public static void main(String[] args)
	{
		// Test2(outer 클래스) 인스턴스 생성
		Test2 ob = new Test2();
		ob.write();		//-- 첫 번째 write() 메서드 호출
	}
	
}